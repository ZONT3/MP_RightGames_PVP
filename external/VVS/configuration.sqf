//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "HQ": { VVS_HQ + VVS_Wheeled };
  	case "BMO": { VVS_BMO };
  	case "Marine": { VVS_A10 };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };
  	case "CD": { VVS_CD };
    case "USAF": { VVS_USAF };
    case "CBRN": { VVS_CBRN };
    case "Atlas": { VVS_Atlas };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  params ["_vehicle", "_class", "_mode"];


  private _fnc_class = switch (_class) do {
    case "OPTRE_M808S": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B2": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808BM_UNSC": {
      [_vehicle, "colorwhite"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B_UNSC": {
      [_vehicle, "colorwhite"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M813_TT": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12A1_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12R_AA": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12G1_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV_APC": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M412_IFV_UNSC": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M413_MGS_UNSC": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M494": {
      [_vehicle, "colortund"] call BIS_fnc_initVehicle;
    };
	case "OPTRE_M875_SPH": {
      [_vehicle, "colorwhite"] call BIS_fnc_initVehicle;
    };
  };
};


VVS_HQ = [
];

VVS_Wheeled = [
];

VVS_CD = [
  "SC_EXT_Scorpion_White",
  "SC_EXT_Ant_White",
  "OPTRE_M808B2",
  "OPTRE_M808BM_UNSC",
  "OPTRE_M875_SPH",
  "OPTRE_M413_MGS_UNSC",
  "OPTRE_M412_IFV_UNSC",
  "OPTRE_M494"
];

VVS_A10 = [
  "OPTRE_M412_IFV_UNSC"
];

VVS_Wheeled_Spec = [
];

VVS_BMO = [
  "OPTRE_M813_TT",
  "OPTRE_m1087_stallion_unsc_resupply",
  "OPTRE_m1087_stallion_cover_unsc",
  "OPTRE_m1087_stallion_unsc_refuel",
  "OPTRE_m1087_stallion_unsc_repair",
  "OPTRE_m1087_stallion_unsc_medical",
  "OPTRE_M12_FAV_APC_MED",
  "OPTRE_M12_FAV_APC",
  "OPTRE_M12_LRV",
  "OPTRE_M12R_AA",
  "OPTRE_M12A1_LRV",
  "SC_SaurusAPC_APC_White"
];

VVS_USAF = [

];

VVS_CBRN = [
];

VVS_Atlas = [
  "SC_Ferret_AC",
  "SCEXT_Gator_APC_AC",
  "SCEXT_Gator_TC_A_AC",
  "SC_Gator_TO_AC"
]


VVS_Car = [];
VVS_Air = [];
VVS_Ship = [];
VVS_Armored = [];
VVS_Autonomous = [];
VVS_Support = [];

VVS_R_Car = [];
VVS_R_Air = [];
VVS_R_Ship = [];
VVS_R_Armored = [];
VVS_R_Autonomous = [];
VVS_R_Support = [];


/*
this disableAI "move"; this disableAI "radioprotocol"; this disableAI "autocombat"; this disableAI "weaponaim";
this addAction [
"Запрос Техники",
VVS_fnc_openVVS,
[VVS_west_Land,"West"],
6,
true,
true,
"",
"true",
5
];
*/
