// fnc_playerInitCivilianDialog.sqf
params ["_civilianObj"];
if (!hasInterface) exitWith {};

// reply with Alarm and set TAG_dialog_state to 2 (globally)
private _dialog_action = { _civilianObj say "Alarm"; target setVariable ["TAG_dialog_state", 2, true]; };
// condition
private _dialog_condition = { (_civilianObj getVariable ["TAG_dialog_state", 0] == 1) };
// ace action
private _ace_action = ["TAG_ace_action_name", "Hi, do you have information?",
"", _dialog_action, _dialog_condition, {},[_civilianObj], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
// add ace action to civilian
[ _civilianObj, 0, [ "ACE_MainActions" ], _ace_action ] call ace_interact_menu_fnc_addActionToObject;
// more actions later