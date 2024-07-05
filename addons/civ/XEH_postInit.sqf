#include "script_component.hpp"

GVAR(civilians) = [];

[QGVAR(updateCivilianList), {
	params ["_civilianObj"];
    GVAR(civilians) pushBackUnique _civilianObj;
}] call CBA_fnc_addEventHandler;

// HERE SET CBA EVENTHANDLERS
[QGVAR(dialogAction), {
    params ["_civilianObj"];
    [_civilianObj, GVAR(civilians)] call FUNC(playerInitCivilianDialog);
}] call CBA_fnc_addEventHandler;

[QGVAR(dialog2Action), {
    params ["_civilianObj"];
    [_civilianObj, GVAR(civilians)] call FUNC(playerInitCivilian2Dialog);
}] call CBA_fnc_addEventHandler;

