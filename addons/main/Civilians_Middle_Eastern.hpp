class LOP_Tak_Civ_Random;
class GVAR(Base_Tak_Civilian_Random) : LOP_Tak_Civ_Random {
	displayName = CSTRING(RandomCivilian_DisplayName); 
	author = AUTHOR;
	editorCategory = "HUMANAID_MAINCATEGORY"; 
	editorSubcategory = "HUMANAID_CIVILIANS_MIDDLE_EASTERN";
};
class GVAR(Tak_Mission_ID001):GVAR(Base_Tak_Civilian_Random) {
	displayName = CSTRING(Tak_Mission_ID001_DisplayName); 
	author = AUTHOR;
	editorCategory = "HUMANAID_MAINCATEGORY"; 
	editorSubcategory = "HUMANAID_CIVILIANS_MIDDLE_EASTERN";
};

