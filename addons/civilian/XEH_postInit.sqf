#include "script_component.hpp"
// Civilian: C1 Mission: M1
[ QGVAR(playerInitCivilianC1MissionM1DialogAction), {
    _this call FUNC(playerInitCivilianC1MissionM1);
}] call CBA_fnc_addEventHandler;
// Civilian: C2 Mission: M2
[ QGVAR(playerInitCivilianC2MissionM2DialogAction), {
    _this call FUNC(playerInitCivilianC2MissionM2);
}] call CBA_fnc_addEventHandler;