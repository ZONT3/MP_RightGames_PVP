moneymenu_moduleRoot = [] call moneymenu_fnc_getModuleRoot;

moneymenu_canGiveDefault = ([missionConfigFile >> "CfgMoneymenu" >> "canGiveDefault", "number", 1] call CBA_fnc_getConfigEntry) == 1;
moneymenu_canGiveToAI = ([missionConfigFile >> "CfgMoneymenu" >> "canGiveToAI", "number", 0] call CBA_fnc_getConfigEntry) == 1;
moneymenu_canTransferToSidesDefault = ([missionConfigFile >> "CfgMoneymenu" >> "canTransferToSidesDefault", "array", []] call CBA_fnc_getConfigEntry) apply {call compile _x};
moneymenu_canTakeFromDeadDefault = ([missionConfigFile >> "CfgMoneymenu" >> "canTakeFromDeadDefault", "number", 1] call CBA_fnc_getConfigEntry) == 1;
moneymenu_canTakeFromSurrenderedDefault = ([missionConfigFile >> "CfgMoneymenu" >> "canTakeFromSurrenderedDefault", "number", 1] call CBA_fnc_getConfigEntry) == 1;
moneymenu_canSendDirectlyDefault = ([missionConfigFile >> "CfgMoneymenu" >> "canSendDirectlyDefault", "number", 0] call CBA_fnc_getConfigEntry) == 1;
moneymenu_startMoney = [missionConfigFile >> "CfgMoneymenu" >> "startMoney", "number", 0] call CBA_fnc_getConfigEntry;
moneymenu_startBankBalance = [missionConfigFile >> "CfgMoneymenu" >> "startBankBalance", "number", 0] call CBA_fnc_getConfigEntry;
moneymenu_atmObjects = [missionConfigFile >> "CfgMoneymenu" >> "atmObjects", "array", ["Land_Atm_01_F","Land_Atm_02_F"]] call CBA_fnc_getConfigEntry;

// смэрть
moneymenu_playersLoseMoneyOnDeath = (
    [missionConfigFile >> "CfgBuymenu","playersLoseMoneyOnDeath",
        [missionConfigFile >> "CfgMoneymenu","playersLoseMoneyOnDeath", 1] call BIS_fnc_returnConfigEntry
    ] call BIS_fnc_returnConfigEntry
) == 1;

if (!hasInterface) exitWith {};

[{!isNull player}, {

    private _money = [MPS_BDL_money, "loadMoney", [getPlayerUID _player]] call ZONT_fnc_bd_customRequest;

    //variables
    // проверяем, не назначен ли уже наш баланс
    if isNil (player getVariable ["lbm_myFunds", nil]) then {
      // если нет - создаем его как раньше
      player setVariable ["lbm_myFunds", moneymenu_startMoney, true];
    };
    player setVariable ["moneymenu_myBankBalance", (player getVariable ["moneymenu_myBankBalance",0]) + moneymenu_startBankBalance, true];
    player setVariable ["moneymenu_latestReceipts",[]];

    //interactions
    [{(captive (_this select 0) && player getVariable ["moneymenu_canTakeFromSurrendered",moneymenu_canTakeFromSurrenderedDefault]) || (!alive (_this select 0) && player getVariable ["moneymenu_canTakeFromDead",moneymenu_canTakeFromDeadDefault])}, "CAManBase", [], true] call moneymenu_fnc_addTakeAction;
    [{player getVariable ["moneymenu_canGive", moneymenu_canGiveDefault] && {alive (_this select 0)} && {moneymenu_canGiveToAI || isPlayer (_this select 0)}}, "CAManBase", [], true] call moneymenu_fnc_addGiveAction;
    [{player getVariable ["moneymenu_canSendDirectly", moneymenu_canSendDirectlyDefault]}] call moneymenu_fnc_addSendAction;
    [{true}, player, [], false] call moneymenu_fnc_addCheckAction;
    {
        [{true}, _x, [], false] call moneymenu_fnc_addTakeAction;
        [{true}, _x, [], false] call moneymenu_fnc_addGiveAction;
        [{true}, _x, [], false] call moneymenu_fnc_addTransferAction;
        [{true}, _x, [], false] call moneymenu_fnc_addCheckAction;
    } forEach moneymenu_atmObjects;

    // НЕ ТРОГАТЬ
    if (isNil "lbm_fnc_addPlayerEHs") then {
        [] call moneymenu_fnc_addPlayerEHs;
    };
}, []] call CBA_fnc_waitUntilAndExecute;
