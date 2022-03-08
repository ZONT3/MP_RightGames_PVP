
this addAction ["Перемещение на корабль",{titleCut ["Перемещение...","BLACK IN",3]; player setposatl [getpos regularBase select 0, getpos regularBase select 1, getposatl regularBase select 2]},"",1,false,true,"","_this distance _target < 5"];

this addAction ["<t color='#ffffff'>Перемещение базу",{titleCut ["Перемещение...","BLACK IN",3]; player setposatl [getpos bso select 0, getpos bso select 1, getposatl bso select 2]},"",1,false,true,"","_this distance _target < 5"];
/*
this addAction ["<t color='#ffffff'>Перемещение базу Гвардии",{titleCut ["Перемещение...","BLACK IN",3]; player setposatl [getpos aclamator select 0, getpos aclamator select 1, getposatl aclamator select 2]},"",1,false,true,"","_this distance _target < 5"];


this addAction ["<t color='#7cb342'>Перемещение в храм джедаев",{titleCut ["Перемещение...","BLACK IN",3]; player setposatl [getpos jedi select 0, getpos jedi select 1, getposatl jedi select 2]},"",1,false,true,"","_this distance _target < 5"];

this addAction ["<t color='#ffd600'>Перемещение в NonRP Зону",{titleCut ["Перемещение...","BLACK IN",3]; player setposatl [getpos noneRP select 0, getpos noneRP select 1, getposatl noneRP select 2]},"",1,false,true,"","_this distance _target < 5"];

this addAction ["Запросить снаряжение",{wRS setposatl [getpos aRS select 0, getpos aRS select 1, getposatl aRS select 2]},"",1,false,true,"","_this distance _target < 3"];

this addAction [""Получение мед. помощи"",""call ace_medical_treatment_fnc_fullHeal;"","""",1,false,true,"""",""_this distance _target < 3""];
*/

0 fadeRadio 0;
enableRadio false;
enableSentences false;
enableSaving [false, false];

west setFriend [east, 0];
west setFriend [resistance, 0];
east setFriend [west, 0];
east setFriend [resistance, 1];
resistance setFriend [west, 0];
resistance setFriend [east, 1];

/* Real Weather
Climates:
arid, mediterranean, continental, tropical, polar
*/
OPEX_mapClimate = "continental";
execVM "external\OPEX_real_weather.sqf";


KPLIB_init = false;

// Version of the KP Liberation framework
KP_liberation_version = [0, 96, "7a"];

enableSaving [ false, false ];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call KPLIB_fnc_initSectors;
if (!isServer) then {waitUntil {!isNil "KPLIB_initServer"};};
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_objectInits.sqf";

// Activate selected player menu. If CBA isn't loaded -> fallback to GREUH
if (KPPLM_CBA && KP_liberation_playermenu) then {
    [] call KPPLM_fnc_postInit;
} else {
    [] execVM "GREUH\scripts\GREUH_activate.sqf";
};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
    [] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
    execVM "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
    // Get mission version and readable world name for Discord rich presence
    [
        ["UpdateDetails", [localize "STR_MISSION_VERSION", "on", getText (configfile >> "CfgWorlds" >> worldName >> "description")] joinString " "]
    ] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

    // Add EH for curator to add kill manager and object init recognition for zeus spawned units/vehicles
    {
        _x addEventHandler ["CuratorObjectPlaced", {[_this select 1] call KPLIB_fnc_handlePlacedZeusObject;}];
    } forEach allCurators;

    waitUntil {alive player};
    if (debug_source != name player) then {debug_source = name player};
    [] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
    setViewDistance 1600;
};

// Execute fnc_reviveInit again (by default it executes in postInit)
if ((isNil {player getVariable "bis_revive_ehHandleHeal"} || isDedicated) && !(bis_reviveParam_mode == 0)) then {
    [] call bis_fnc_reviveInit;
};

KPLIB_init = true;

// Notify clients that server is ready
if (isServer) then {
    KPLIB_initServer = true;
    publicVariable "KPLIB_initServer";
};

