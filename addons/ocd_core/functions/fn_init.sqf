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
*	@Filename: fn_init.sqf
*	@Location: {ocd_core}\functions\
*	@Author: Nixon {nixon@visualized.se}
*
*/ //////////////////////////////////////////////////////////////////

private ['_managerID', '_isPlayerHost'];

if (!isDedicated && isServer) then { _isPlayerHost = TRUE; };

/* Only executed on player hosted games */
if (_isPlayerHost) then {
	_managerID = owner player;
	ocd_endpoints = [_managerID, getPlayerUID(player)];
};

/* Only executed on dedicated servers */
if (isDedicated) then {
	ocd_endpoints = [];
};

/* Executed on both server types */
if (isServer) then {

};

["- OCD_TP, T (%1): Post initialization complete", time] call BIS_fnc_logFormat;