#define COMPONENT humanaid
#define COMPONENT_NAME "Humanitarian Aid Civilians"
#include "\z\humanaid\addons\civilian\script_mod.hpp"
#include "\z\humanaid\addons\civilian\script_debug.hpp"
#ifdef DEBUG_ENABLED_HUMANAID
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HUMANAID
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HUMANAID
#endif

#include "\z\humanaid\addons\civilian\script_macros.hpp"
