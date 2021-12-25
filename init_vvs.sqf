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
  "Запрос Техники 1st Cavalry",
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
  "Запрос Техники 124th",
  VVS_fnc_openVVS,
  [VVS_west_Land,"A10"],
  6,
  true,
  true,
  "",
  "[['A10']] call ZONT_fnc_checkRole",
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
  "Запрос Техники Military Police",
  VVS_fnc_openVVS,
  [VVS_west_Land,"MP"],
  6,
  true,
  true,
  "",
  "[['MP']] call ZONT_fnc_checkRole",
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

_this addAction [
  "Запрос Техники CBRN",
  VVS_fnc_openVVS,
  [VVS_west_Land,"CBRN"],
  6,
  true,
  true,
  "",
  "[['CBRN']] call ZONT_fnc_checkRole",
  5
];
