player addEventHandler ["Killed", {
    params ["_unit"];

    player setVariable ["moneymenu_myFundsOnDeath",[player] call moneymenu_fnc_getFunds];

    // if player keeps money on death, save in temp variable so that corpse cannot be looted during respawn time
    if (!moneymenu_playersLoseMoneyOnDeath) then {
        [player,0] call moneymenu_fnc_setFunds;
    };
}];

player addEventHandler ["Respawn",{
    params ["_unit", "_corpse"];

    // use addFunds here in case user has their own respawn event handler, that fired first and added money
    if (moneymenu_playersLoseMoneyOnDeath) then {
        [_unit,-(_unit getVariable ["moneymenu_myFundsOnDeath",0])] call moneymenu_fnc_addFunds;
    } else {
        [_unit,_unit getVariable ["moneymenu_myFundsOnDeath",0]] call moneymenu_fnc_addFunds;
    };
}];
