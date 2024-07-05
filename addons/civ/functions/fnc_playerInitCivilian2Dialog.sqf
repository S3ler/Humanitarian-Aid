// fnc_playerInitCivilian2Dialog.sqf
#include "../script_component.hpp"
params ["_civilianObj", "_civilians"];
if (!hasInterface) exitWith {};
diag_log ["playerInitCivilian2Dialog: this: ", _this];

private _otherCivilianIndex = _civilians findIf { ( typeOf _x == QGVAR(Dialog_Civilian) ) };
if (_otherCivilianIndex > -1) then {
	private _otherCivilian = _civilians select _otherCivilianIndex;
	_civilianObj setVariable [QGVAR(otherCivilian), _otherCivilian];
	_otherCivilian setVariable [QGVAR(otherCivilian), _civilianObj];
} else {
	// other civilian must register itself here.
};

// reply with Alarm and set TAG_dialog_state to 2 (globally)
private _dialog_action = {
	params ["_target", "_player", "_actionParams"];
	_target say "Alarm";
	private _otherCivilian = _target getVariable [QGVAR(otherCivilian), nil];
	diag_log ["_dialog_action: _otherCivilian:" ,_otherCivilian];

	if (  !(isNil { _otherCivilian }) ) then {
		_target say "Alarm";
		diag_log ["_dialog_action: _otherCivilianPosition:", getPosWorld _otherCivilian];

		// Channel ID 5 is Direct Player in proximity
		deleteMarkerLocal "otherCivilianMarker";
		private _marker = createMarkerLocal ["otherCivilianMarker" , getPosWorld _otherCivilian, 5, _player];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "hd_dot";
		_marker setMarkerTextLocal "other civilian";
	} else {
		_target say "AlarmCar";
	};
	
	_target setVariable [QGVAR(dialog_state), 1, true]; 
};
// condition
private _dialog_condition = {
	params ["_target", "_player", "_actionParams"];
	(_target getVariable [QGVAR(dialog_state), 0] == 1) 
};

// ace action
private _ace_action = [QGVAR(action2Name),"Where is the other civilian?","", _dialog_action, _dialog_condition, {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
// add ace action to civilian
[ _civilianObj, 0, [ "ACE_MainActions"], _ace_action ] call ace_interact_menu_fnc_addActionToObject;
// more actions later