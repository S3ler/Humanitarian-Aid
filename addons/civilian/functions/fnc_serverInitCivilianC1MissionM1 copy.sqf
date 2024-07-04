// Civilian: C1 Mission: M1
#include "../script_component.hpp"
params ["_civilianObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
diag_log ["serverInitCivilianC1MissionM1: _this: %1",_this];

if ( isNil { _civilianObj getVariable QGVAR(civilianC1MissionM1DialogState) } ) then {
    _civilianObj setVariable [ QGVAR(civilianC1MissionM1DialogState), 1, true ];
    [ QGVAR(playerInitCivilianC1MissionM1DialogAction), [_civilianObj] ] call CBA_fnc_globalEventJIP;
};