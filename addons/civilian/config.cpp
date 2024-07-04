#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = AUTHORS;
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(CivilianC2)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "ace_common",
            "A3_Characters_F",
            "humanaid_main"
        };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
