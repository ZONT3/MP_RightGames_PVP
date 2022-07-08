params ["_unit",["_getBankAccount",false]];

private _varName = ["lbm_myFunds","moneymenu_myBankBalance"] select _getBankAccount;
private _funds = _unit getVariable [_varName,0];

_funds

if ( hasInterface ) then {
   waitUntil { alive player && ! isNull player };
   _player = player;
private _money = [MPS_BDL_money, "loadMoney", [getPlayerUID _player]] call ZONT_fnc_bd_customRequest;
