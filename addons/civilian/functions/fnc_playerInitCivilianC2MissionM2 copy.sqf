// Civilian: C2 Mission: M2
#include "../script_component.hpp"
params ["_civilianObj"];
if (!hasInterface) exitWith {};
diag_log ["playerInitCivilianC2MissionM2: _this: %1",_this];
private _items_delivery = createHashMapFromArray [
    ["Land_PaperBox_01_small_closed_white_med_F", 1], 
    ["Land_CanisterFuel_F", 2]
];
private _delivery_radius = 5;
// Dialog 1: Gesprächsstart
private _dialog1 = {
    _target setVariable [QGVAR(Talking), true];
    // Die Farisia verstecken sich in den Bergen im Nordosten. Ihr Anführer ist ein skrupelloser Mann namens Khaled.
    _target say QGVAR(cIdC2_mIdM2_dId1_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
    _target setVariable [ QGVAR(civilianC2MissionM2DialogState), 1, true];
};
// Condition 1: Gesprächsstart
private _condition1 = {
    (_target getVariable [ QGVAR(civilianC2MissionM2DialogState), 0 ] == 1)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 1: Gesprächsstart
private _action1 = [
    QGVAR(civilianC2MissionM2AceAction),
    "Hallo, haben Sie Informationen über die Farisia?",
    "", _dialog1, _condition1,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action1 ] call ace_interact_menu_fnc_addActionToObject;

_civilianObj setVariable [QGVAR(Talking), false];