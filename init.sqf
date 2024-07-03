// put into mission's init.sqf 
// name civilian global variable neame CIV001
private _civilian = CIV001;

if (isServer) then {
    _civilian setVariable ["TAG_dialog_state", 1, true];
};

if (hasInterface) then {
    // reply
    private _dialog_action = {
        _target say "Alarm";
        target setVariable ["TAG_dialog_state", 2, true];
     };
    // condition
    private _dialog_condition = { (_target getVariable ["TAG_dialog_state", 0] == 1) };
    // ace action
    private _ace_action = ["TAG_ace_action_name", "Hi, do you have information?",
    "", _dialog_action, _dialog_condition, {},[_civilian], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
    // add ace action to civilian
    [ _civilian, 0, [ "ACE_MainActions" ], _ace_action ] call ace_interact_menu_fnc_addActionToObject;
    // more actions later
};
