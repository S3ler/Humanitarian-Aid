// fnc_serverInitDialogState.sqf
params ["_civilianObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};

// set the initial TAG_dialog_state to 1 (globally) if is nil
if ( isNil { _civilianObj getVariable "TAG_dialog_state" } ) then {
  _civilianObj setVariable ["TAG_dialog_state", 1, true];
};
