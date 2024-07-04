class CfgVehicles {
    class C_man_1;
    class GVAR(CivilianC1) : C_man_1 {
        displayName = CSTRING(CivilianC1DisplayName);
        author = AUTHOR;
        editorCategory = "HUMANAID_MAINCATEGORY";
        editorSubcategory = "HUMANAID_CIVILIANS";
    };
    class GVAR(CivilianC2) : C_man_1 {
        displayName = CSTRING(CivilianC2DisplayName);
        author = AUTHOR;
        editorCategory = "HUMANAID_MAINCATEGORY";
        editorSubcategory = "HUMANAID_CIVILIANS";
    };
};