_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники РМО",
  VVS_fnc_openVVS,
  [VVS_guer_Land,"RMO"],
  6,
  true,
  true,
  "",
  "[['C28', 'POGON']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос БТР",
  VVS_fnc_openVVS,
  [VVS_guer_Land,"BTR"],
  6,
  true,
  true,
  "",
  "[['C28', 'POGON']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Установок",
  VVS_fnc_openVVS,
  [VVS_guer_Land,"Turel"],
  6,
  true,
  true,
  "",
  "[['C28', 'POGON']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Танков",
  VVS_fnc_openVVS,
  [VVS_guer_Land,"Tanks"],
  6,
  true,
  true,
  "",
  "[['C28', 'POGON']] call ZONT_fnc_checkRole",
  5
];
