#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {
			QGVAR(Dialog_Civilian)
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "cba_main",
            "ace_common"
        };
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};

#include "CfgEditorCategories.hpp"

