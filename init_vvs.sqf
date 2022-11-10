_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники БМО",
  VVS_fnc_openVVS,
  [VVS_east_Land,"BMO"],
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
  [VVS_east_Land,"SWheeled"],
  6,
  true,
  true,
  "",
  "[['SOAR']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники 2nd Armored Squad",
  VVS_fnc_openVVS,
  [VVS_east_Land,"CD"],
  6,
  true,
  true,
  "",
  "[['AF']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники Штаба",
  VVS_fnc_openVVS,
  [VVS_east_Land,"HQ"],
  6,
  true,
  true,
  "",
  "[['HQ']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники 13th Marine Corp",
  VVS_fnc_openVVS,
  [VVS_east_Land,"Marine"],
  6,
  true,
  true,
  "",
  "[['Marine']] call ZONT_fnc_checkRole",
  5
];
