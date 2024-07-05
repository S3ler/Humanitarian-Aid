#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {
			QGVAR(Dialog_Civilian),
			QGVAR(Dialog2_Civilian)
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "cba_main",
            "ace_common",
            "A3_Characters_F",
			"A3_Structures_F_Items_Vessels",
			"A3_Props_F_Orange_Humanitarian_Supplies",
			"A3_Props_F_Orange_Civilian_Constructions",
			"A3_Structures_F_EPC_Civ_Garbage",
			"A3_Weapons_F_Explosives"
        };
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
//#include "CfgAmmo.hpp"
//#include "CfgSounds.hpp"
