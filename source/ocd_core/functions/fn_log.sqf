/* ///////////////////////////////////////////////////////////////////////////////////////
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
*	@Filename: fn_log.sqf
*	@Location: {ocd_core}\functions\
*	@Author: Nixon {nixon@visualized.se}
*
*	Description:
*		Logger with option to categorize data in different levels.
*		* The levels are defined when calling the function. And the global
*		  debug level are set in the settings file.
*         If global level is 3 (info) all your log messages will be shown
*
*	Example(s):
*		"Error message" call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [ERROR], T (13s) : Error message"
*
*		["Error message"] call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [ERROR], T (13s) : Error message"
*
*		["Error message", "ERROR"] call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [ERROR], T (14s) : Error message"
*
*		[["ERROR message with value %1", _value]] call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [ERROR], T (153s) : ERROR message with value _value"
*
*		[["INFO message with value %1", _value], "INFO"] call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [INFO], T (68s) : INFO message with value _value"
*
*		["Warning message", "WARNING"] call OCD_fnc_log;
*			OUTPUT: "- OCD_TP [WARNING], T (14s) : Warning message"
*
*	Parameter(s):
*		0 DATA (Mandatory):
*			Alt 1. STRING in format "Message without value"
*			Alt 2. ARRAY in format ["Message without value"]
*			Alt 3. ARRAY in format [["Message with value %1", _value]]
*
*		1 DEBUG LEVEL (Optional):
*			STRING - Enter the level of logging. (default: "ERROR")
*				Available Levels:
*					ERROR   - Log message with this level will always be displayed
*					WARNING - Use this for more detailed info
*					INFO    - Use this for even more detailed info
*		
*	Returns:
*		Logged message in RPT log file
*
*/ ///////////////////////////////////////////////////////////////////////////////////////

params [["_data", "- OCD_TP [ERROR] : OCD_fnc_log called without data!", [[],""]],["_opt1", "ERROR", [""]]];

switch (_opt1) do { case "ERROR": { _debugLevel = 1; }; case "WARNING": { _debugLevel = 2; }; case "INFO": { _debugLevel = 3; }; };

if (OCD_debugLevel >= _debugLevel) then {
	if ((typeName _data) == "ARRAY") then {

		_fm = format ["- OCD_TP [%1], T (%2s) : %3", _opt1, diag_tickTime, _data select 0];
		_data deleteAt 0; // Remove original message
		(_data select 0) pushBack _fm; // Add new formated message
		diag_log format _data; // Log modified array with values

	} else { diag_log _data; }; // Single message
};

TRUE