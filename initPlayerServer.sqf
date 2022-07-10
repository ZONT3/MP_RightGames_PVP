params ["_player", "_didJIP"];

_null = _this spawn {
  params ["_player", "_didJIP"];
  private _curators = call ZONT_fnc_retrieveCurators;
  if not ((getPlayerUID _player) in _curators) exitWith { };
  _player call ZONT_fnc_giveZeus;
};

_player spawn ZONT_fnc_initPersonalLocker;

// спавним этот код для того, что бы не провоцировать фриз при загрузке
private _n = [_player] spawn {
  params ["_player"];

  // хуйня на случай, если вдруг игрок не до конца инициализировался
  private _fn_checkId = {
    private _uid = getPlayerUID _player;
    [(_uid find "7656") >= 0, _uid];
  };

  // ждем инициализации максимум 10 секунд
  private _until = (time max 0) + 10;
  waitUntil { sleep 0.1; ((call _fn_checkId) select 0) or { time > _until } };

  call _fn_checkId params ["_bool", "_uid"];
  if not _bool exitWith {
    ["Cannot init UID for player", _player] call BIS_fnc_error;
  };
  // конец хуйни

  // загружаем из бд
  private _res = [MPS_BDL_money, "loadMoney", [_uid]] call ZONT_fnc_bd_customRequest;
  private ['_money'];

  // тут я сам забыл, из этой функции хуйня возвращается - наши деньги должны быть внутри двух массивов.
  // пробуем их оттуда достать. если не получилось - значит их нет в бд, либо какая-то ошибка
  try {
    _money = _res select 0 select 0;
  } catch { };

  // если достали - присераем их вместо тех, что уже могли нам присраться по умолчанию
  if (not isNil '_money') exitWith {
    // есть еще переменная moneymenu_myBankBalance - мб тебе захочется в нее эти деньги сохранять.
    // если да - то поменяй местами строки 30 и 32 в файле fn_initModule и замени
    // там moneymenu_startMoney на 0, если не хочешь, что бы игрокам постоянно при заходе давали деньги на руки
    _player setVariable ["lbm_myFunds", _money, true];
    diag_log format ["Fetched money for %1: %2", name _player, _money];
  }
  diag_log format ["Cannot fetch money for %1", name _player];
};
