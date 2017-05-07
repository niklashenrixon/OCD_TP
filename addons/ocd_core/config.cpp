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

class CfgMods {
	class OCD_CORE {
		dir         = "@OCD_TP";
		picture     = "\ocd_core\logo.paa";
		name        = "OCD Transport Protocol";
		author      = "Nixon";
		hidePicture = 0;
		hideName    = 0;
		version     = "1.0";
	};
	author = "Nixon";
};

class CfgPatches {
	class OCD_CORE {
		name             = "OCD Transport Protocol";
		author           = "Nixon";
		authorUrl        = "http://github.com/niklashenrixon/OCD_TP";
		version          = "1.0";
		requiredVersion  = 1.0;
		requiredAddons[] = {};
	};
};