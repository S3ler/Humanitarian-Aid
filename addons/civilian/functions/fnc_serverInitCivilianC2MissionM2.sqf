// Civilian: C2 Mission: M2
#include "../script_component.hpp"
params ["_civilianObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
diag_log ["serverInitCivilianC2MissionM2: _this: %1",_this];

if ( isNil { _civilianObj getVariable QGVAR(civilianC2MissionM2DialogState) } ) then {
    _civilianObj setVariable [ QGVAR(civilianC2MissionM2DialogState), 1, true ];
    [ QGVAR(playerInitCivilianC2MissionM2DialogAction), [_civilianObj] ] call CBA_fnc_globalEventJIP;
};