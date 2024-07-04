// Civilian: C1 Mission: M1
#include "../script_component.hpp"
params ["_civilianObj"];
if (!hasInterface) exitWith {};
diag_log ["playerInitCivilianC1MissionM1: _this: %1",_this];
private _items_delivery = createHashMapFromArray [
    ["Land_PaperBox_01_small_closed_white_med_F", 1], 
    ["Land_CanisterFuel_F", 2]
];
private _delivery_radius = 5;
// Dialog 1: Gesprächsstart
private _dialog1 = {
    _target setVariable [QGVAR(Talking), true];
    // Oh, ja, das habe ich. Aber erst, wenn Sie mir bei einer kleinen Aufgabe helfen.
    _target say QGVAR(cIdC1_mIdM1_dId1_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
    _target setVariable [ QGVAR(civilianC1MissionM1DialogState), 2, true];
};
// Condition 1: Gesprächsstart
private _condition1 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 1)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 1: Gesprächsstart
private _action1 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Hallo, haben Sie Informationen über die Farisia?",
    "", _dialog1, _condition1,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action1 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 2: Aufgabenanfrage
private _dialog2 = {
    _target setVariable [QGVAR(Talking), true];
    // Bringen Sie mir ein paar medizinische Vorräte und etwas Treibstoff.
    _target say QGVAR(cIdC1_mIdM1_dId2_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
    _target setVariable [ QGVAR(civilianC1MissionM1DialogState), 3, true];
};
// Condition 2: Aufgabenanfrage
private _condition2 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 2)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 2: Aufgabenanfrage
private _action2 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Welche Aufgabe ist das?",
    "", _dialog2, _condition2,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action2 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 3: Aufgabenabschluss und mögliche Nachfragen
private _dialog3 = {
    params ["_target", "_player", "_params"];
    private _delivery_target = _target;
    private _items_delivery = _params select 1;
    private _delivery_radius = _params select 2;
    private _condition_result = true;
    
    private _nearby_entities = _delivery_target nearEntities _delivery_radius;
    { private _count = _x countType _nearby_entities;
    if (!(_count >= _y)) then { _condition_result = false;
    };
    } forEach _items_delivery;
   
    if (_condition_result) then {
        _target setVariable [QGVAR(Talking), true];
        // Lass mich schauen.... ja, die Lieferung ist vollständig. Vielen Dank für Ihre Hilfe!
        _target say QGVAR(cIdC1_mIdM1_dId3_success);
        [_target] spawn {
            params ["_target"];
            sleep 1;
            _target setVariable [QGVAR(Talking), false];
        };
        _target setVariable [ QGVAR(civilianC1MissionM1DialogState), 4, true];
    } else {
        _target setVariable [QGVAR(Talking), true];
        // Lass mich schauen... nein, es fehlt noch etwas. Bitte beeilen Sie sich!
        _target say QGVAR(cIdC1_mIdM1_dId3_fail);
        [_target] spawn {
            params ["_target"];
            sleep 1;
            _target setVariable [QGVAR(Talking), false];
        };
    };
};
// Condition 3: Aufgabenabschluss und mögliche Nachfragen
private _condition3 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 3)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 3: Aufgabenabschluss und mögliche Nachfragen
private _action3 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Ist die Lieferung vollständig?",
    "", _dialog3, _condition3,
    {},[_civilianObj, _items_delivery, _delivery_radius], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action3 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 3_1: 
private _dialog3_1 = {
    _target setVariable [QGVAR(Talking), true];
    // Bringen Sie mir eine Box medizinische Vorräte und 2 Kannister Treibstoff.
    _target say QGVAR(cIdC1_mIdM1_dId3_1_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
};
// Condition 3_1: 
private _condition3_1 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 3)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 3_1: 
private _action3_1 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Was war die Aufgabe nochmal?",
    "", _dialog3_1, _condition3_1,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action3_1 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 3_2: 
private _dialog3_2 = {
    _target setVariable [QGVAR(Talking), true];
    // Bringen Sie die Lieferung direkt zu mir.
    _target say QGVAR(cIdC1_mIdM1_dId3_2_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
};
// Condition 3_2: 
private _condition3_2 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 3)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 3_2: 
private _action3_2 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Wohin soll ich die Lieferung bringen?",
    "", _dialog3_2, _condition3_2,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action3_2 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 3_3: 
private _dialog3_3 = {
    _target setVariable [QGVAR(Talking), true];
    // Die medizinischen Vorräte sind dringend für die Kranken hier im Dorf, und der Treibstoff wird für unsere Generatoren gebraucht. Ihre Hilfe wird hier wirklich geschätzt!
    _target say QGVAR(cIdC1_mIdM1_dId3_3_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
};
// Condition 3_3: 
private _condition3_3 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 3)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 3_3: 
private _action3_3 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Wieso möchten Sie die Lieferung haben?",
    "", _dialog3_3, _condition3_3,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action3_3 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 4: Informationen abfragen
private _dialog4 = {
    _target setVariable [QGVAR(Talking), true];
    // Die Farisia verstecken sich in den Bergen im Nordosten. Ihr Anführer ist ein skrupelloser Mann namens Khaled.
    _target say QGVAR(cIdC1_mIdM1_dId4_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
    _target setVariable [ QGVAR(civilianC1MissionM1DialogState), 5, true];
};
// Condition 4: Informationen abfragen
private _condition4 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 4)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 4: Informationen abfragen
private _action4 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Welche Informationen über die Farisia haben Sie nun?",
    "", _dialog4, _condition4,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action4 ] call ace_interact_menu_fnc_addActionToObject;
// Dialog 5: Weitere Informationen
private _dialog5 = {
    _target setVariable [QGVAR(Talking), true];
    // Nein, das ist alles, was ich weiß. Seien Sie vorsichtig da draußen!
    _target say QGVAR(cIdC1_mIdM1_dId5_success);
    [_target] spawn {
        params ["_target"];
        sleep 1;
        _target setVariable [QGVAR(Talking), false];
    };
};
// Condition 5: Weitere Informationen
private _condition5 = {
    (_target getVariable [ QGVAR(civilianC1MissionM1DialogState), 0 ] == 5)
    && !(_target getVariable [ QGVAR(Talking), true])
};
// Ace Action 5: Weitere Informationen
private _action5 = [
    QGVAR(civilianC1MissionM1AceAction),
    "Hast du noch mehr Informationen für uns?",
    "", _dialog5, _condition5,
    {},[], "", 3,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[ _civilianObj, 0, [ "ACE_MainActions" ], _action5 ] call ace_interact_menu_fnc_addActionToObject;

_civilianObj setVariable [QGVAR(Talking), false];