_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники РМО",
  VVS_fnc_openVVS,
  [VVS_west_Land,"RMO"],
  6,
  true,
  true,
  "",
  "[['T501', 'C417', 'Med', 'F4', 'RONA', 'LFT', 'SS5']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос БТР",
  VVS_fnc_openVVS,
  [VVS_west_Land,"BTR"],
  6,
  true,
  true,
  "",
  "[['T501', 'C417', 'Med', 'F4', 'RONA', 'LFT', 'SS5']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Турелей",
  VVS_fnc_openVVS,
  [VVS_west_Land,"Turel"],
  6,
  true,
  true,
  "",
  "[['T501', 'C417', 'Med', 'F4', 'RONA', 'SS5']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Танков",
  VVS_fnc_openVVS,
  [VVS_west_Land,"Tanks"],
  6,
  true,
  true,
  "",
  "[['T501', 'SS5']] call ZONT_fnc_checkRole",
  5
];

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
