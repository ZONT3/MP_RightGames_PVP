if (!hasInterface) exitWith { };


removeAllActions player;

private _text = "<t color='#d40000' size='3'>Вы очнулись</t><br/><t color='#ffffff' size='1'>и не помните, что с Вами случилось!</t>";
titleText [_text, "PLAIN", 0.2, true, true];

[] spawn {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [15];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 5;
};


[player, {
private _curators = call ZONT_fnc_retrieveCurators;
if not ((getPlayerUID _this) in _curators) exitWith { };
_this call ZONT_fnc_giveZeus;
}] remoteExec ["bis_fnc_call", 2];


[] execVM "initPlayerAfterRespawn.sqf";

/* { [_x select 0, player, _x select 1, true] spawn ZONT_fnc_addSkillAction } foreach MPC_skills_actions; */

waitUntil {!isNil "KPLIB_initServer"};

params ["_newUnit", "_oldUnit"];

if (isNil "GRLIB_respawn_loadout") then {
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeVest player;
    removeBackpack player;
    removeHeadgear player;
    removeGoggles player;
    player linkItem "ItemMap";
    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
} else {
    sleep 4;
    [player, GRLIB_respawn_loadout] call KPLIB_fnc_setLoadout;
};

[] call KPLIB_fnc_addActionsPlayer;

// Support Module handling
if ([
    false,
    player isEqualTo ([] call KPLIB_fnc_getCommander) || (getPlayerUID player) in KP_liberation_suppMod_whitelist,
    true
] select KP_liberation_suppMod) then {
    waitUntil {!isNil "KPLIB_suppMod_req" && !isNil "KPLIB_suppMod_arty" && time > 5};

    // Remove link to corpse, if respawned
    if (!isNull _oldUnit) then {
        KPLIB_suppMod_req synchronizeObjectsRemove [_oldUnit];
        _oldUnit synchronizeObjectsRemove [KPLIB_suppMod_req];
    };

    // Link player to support modules
    [player, KPLIB_suppMod_req, KPLIB_suppMod_arty] call BIS_fnc_addSupportLink;

    // Init modules, if newly joined and not client host
    if (isNull _oldUnit && !isServer) then {
        [KPLIB_suppMod_req] call BIS_fnc_moduleSupportsInitRequester;
        [KPLIB_suppMod_arty] call BIS_fnc_moduleSupportsInitProvider;
    };
};