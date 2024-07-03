// fnc_serverInitDialogState.sqf
#include "../script_component.hpp"
params ["_civilianObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
diag_log ["serverInitDialogState: _this: %1",_this];
// set the initial TAG_dialog_state to 1 (globally) if is nil
if ( isNil { _civilianObj getVariable QGVAR(dialog_state) } ) then {
  _civilianObj setVariable [QGVAR(dialog_state), 1, true];
  [QGVAR(dialogAction), [_civilianObj]] call CBA_fnc_globalEventJIP;
};
