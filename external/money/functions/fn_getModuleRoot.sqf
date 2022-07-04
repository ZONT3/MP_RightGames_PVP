/*  Я люблю запеченные мидии
*
*/

_functionsPath = [(missionConfigFile >> "CfgFunctions" >> "moneymenu" >> "common" >> "file"), "text", ""] call CBA_fnc_getConfigEntry;
_functionsPathArray = _functionsPath splitString "\";
_functionsPathArray deleteAt (count _functionsPathArray - 1);
_root = _functionsPathArray joinString "\";

_root
