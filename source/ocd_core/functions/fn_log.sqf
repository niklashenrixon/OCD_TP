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
*		["Error message"] call OCD_fn_log;
*			OUTPUT: "- OCD_TP [ERROR], T (13s) : Error message"
*
*		["Error message", "ERROR"] call OCD_fn_log;
*			OUTPUT: "- OCD_TP [ERROR], T (14s) : Error message"
*
*		[["ERROR message with value %1", _value]] call OCD_fn_log;
*			OUTPUT: "- OCD_TP [ERROR], T (153s) : ERROR message with value _value"
*
*		[["INFO message with value %1", _value], "INFO"] call OCD_fn_log;
*			OUTPUT: "- OCD_TP [INFO], T (68s) : INFO message with value _value"
*
*		["Warning message", "WARNING"] call OCD_fn_log;
*			OUTPUT: "- OCD_TP [WARNING], T (14s) : Warning message"
*
*	Parameter(s):
*		0 DATA (Mandatory):
*			Alt 1. ARRAY in format ["Message without value"]
*			Alt 2. ARRAY in format [["Message with value %1", _value]]
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

params [ ["_data", ["- OCD_TP [ERROR] : OCD_fn_log called without data!"], [[]] ], ["_opt1", "ERROR", [""]] ];

switch (_opt1) do { case "ERROR": { _debugLevel = 1; }; case "WARNING": { _debugLevel = 2; }; case "INFO": { _debugLevel = 3; }; };

if (OCD_debugLevel >= _debugLevel) then {
	if ((typeName (_data select 0)) == "ARRAY") then {
		_message = (_data select 0) select 0;
		_values  = _data select 1;

		_formatedMessage = format ["- OCD_TP [%1], T (%2s) : %3", _debugLevel, diag_tickTime, _message];
		debugResult = [_formatedMessage];
		{ debugResult pushBack _x; } forEach _values;

		diag_log format debugResult;
	} else {  // Single array (textmessage)
		diag_log (_data select 0);
	};
};

TRUE