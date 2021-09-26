_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники БМО",
  VVS_fnc_openVVS,
  [VVS_east_Land,"BMO"],
  6,
  true,
  true,
  "",
  "[['C569', 'NKVD', 'MR', 'TV', 'VVS']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Турелей",
  VVS_fnc_openVVS,
  [VVS_east_Land,"Turel1"],
  6,
  true,
  true,
  "",
  "[['C569', 'NKVD', 'MR', 'TV', 'VVS']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос БТРов",
  VVS_fnc_openVVS,
  [VVS_east_Land,"BTR1"],
  6,
  true,
  true,
  "",
  "[['C569', 'NKVD', 'MR', 'TV', 'VVS']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Тяжелой техники",
  VVS_fnc_openVVS,
  [VVS_east_Land,"TV"],
  6,
  true,
  true,
  "",
  "[['TV']] call ZONT_fnc_checkRole",
  5
];
