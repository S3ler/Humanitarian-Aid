#include "script_component.hpp"

// HERE SET CBA EVENTHANDLERS
[QGVAR(dialogAction), {
    _this call FUNC(playerInitCivilianDialog);
}] call CBA_fnc_addEventHandler;
