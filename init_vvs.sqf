_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники БМО",
  VVS_fnc_openVVS,
  [VVS_west_Land,"BMO"],
  6,
  true,
  true,
  "",
  "true",
  5
];

_this addAction [
  "Запрос специальной колесной техники",
  VVS_fnc_openVVS,
  [VVS_west_Land,"SWheeled"],
  6,
  true,
  true,
  "",
  "[['Navy', 'SOAR']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники Tank Departament",
  VVS_fnc_openVVS,
  [VVS_west_Land,"CD"],
  6,
  true,
  true,
  "",
  "[['CD']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники Штаба",
  VVS_fnc_openVVS,
  [VVS_west_Land,"HQ"],
  6,
  true,
  true,
  "",
  "[['HQ']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники 37th",
  VVS_fnc_openVVS,
  [VVS_west_Land,"USAF"],
  6,
  true,
  true,
  "",
  "[['USAF']] call ZONT_fnc_checkRole",
  5
];
