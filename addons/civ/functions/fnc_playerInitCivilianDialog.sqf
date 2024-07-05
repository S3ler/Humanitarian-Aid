// fnc_playerInitCivilianDialog.sqf
#include "../script_component.hpp"
params ["_civilianObj", "_civilians"];
if (!hasInterface) exitWith {};
diag_log ["playerInitCivilianDialog: this: ", _this];

diag_log ["playerInitCivilianDialog: _civilianObj: ",_civilianObj];
if (count _civilians > 0) then {
	{ diag_log ["playerInitCivilianDialog: _civilians:",_x];  } forEach _civilians;
} else {
	diag_log ["playerInitCivilianDialog: _civilians:",_civilians];
};

private _otherCivilianIndex = _civilians findIf { ( typeOf _x == QGVAR(Dialog2_Civilian) ) };
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
	_target setVariable [QGVAR(dialog_state), 2, true]; 
};
// condition
private _dialog_condition = {
	params ["_target", "_player", "_actionParams"];
	(_target getVariable [QGVAR(dialog_state), 0] == 1) 
};

// ace action
private _ace_action = [QGVAR(actionName),"Hi, do you have information?","", _dialog_action, _dialog_condition, {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
// add ace action to civilian
[ _civilianObj, 0, [ "ACE_MainActions"], _ace_action ] call ace_interact_menu_fnc_addActionToObject;
// more actions later