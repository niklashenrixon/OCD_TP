/* //////////////////////////////////////////////////////////////////
*
*      /$$$$$$   /$$$$$$  /$$$$$$$     /$$$$$$$$ /$$$$$$$ 
*     /$$__  $$ /$$__  $$| $$__  $$   |__  $$__/| $$__  $$
*    | $$  \ $$| $$  \__/| $$  \ $$      | $$   | $$  \ $$
*    | $$  | $$| $$      | $$  | $$      | $$   | $$$$$$$/
*    | $$  | $$| $$      | $$  | $$      | $$   | $$____/ 
*    | $$  | $$| $$    $$| $$  | $$      | $$   | $$      
*    |  $$$$$$/|  $$$$$$/| $$$$$$$/      | $$   | $$      
*     \______/  \______/ |_______//$$$$$$|__/   |__/      
*                                |______/                 
*
*	@Filename: config.cpp
*	@Location: {ocd_core}\
*	@Author: Nixon {nixon@visualized.se}
*
*/ //////////////////////////////////////////////////////////////////

#define true 1
#define false 0

class CfgPatches {
	class ocd_core {
		name             = "OCD Transport Protocol";
		author           = "Nixon";
		authorUrl        = "http://github.com/niklashenrixon/OCD_TP";
		fileName         = "ocd_core.pbo";
		requiredVersion  = 0.1;
		requiredAddons[] = {}; // Defined as "mod1", "mod2" (array)
	};
};

class CfgFunctions {
	class OCD {
		class core_functions {
			file = "\ocd_core\functions"; // @mod/addons/ocd_core/-> folder name <-/fn_reInit.sqf
			class init {
				postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit", didJIP]
			};
			class reInit {};
			class send   {};
			class log   {};
		};
	};
};