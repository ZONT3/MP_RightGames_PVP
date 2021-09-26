//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "HQ": { VVS_HQ + VVS_Wheeled };
  	case "BTR": { VVS_BTR };
    case "Turel": { VVS_Turel };
    case "RMO": { VVS_RMO };
  	case "BMO": { VVS_BMO };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };
  	case "Tanks": { VVS_Tanks };
  	case "TV": { VVS_TV };
    case "BTR1": { VVS_BTR1 };
    case "Turel1": { VVS_Turel1 };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  // params ["_mode", "_vehicle"];
  switch(_this) do {
  	case "TV": { {
      _vehicle setVehicleAmmo 0;
      _vehicle setFuel 0
    } };

  	default {nil};
  };
};


VVS_HQ = [

];

VVS_Wheeled = [
];

VVS_Tanks = [
  "LIB_StuG_III_G_w",
  "LIB_PzKpfwIV_H_w",
  "LIB_PzKpfwV_w",
  "LIB_PzKpfwVI_B_w",
  "LIB_GER_PzKpfwVI_E_sPA503_Winter",
  "LIB_FlakPanzerIV_Wirbelwind_w_DLV"

];

VVS_TV = [
  "LIB_T34_85_w",
  "LIB_SU85_w",
  "LIB_JS2_43_w",
  "LIB_T34_76_w"

];

VVS_BMO = [
  "LIB_Willys_MB_Hood_w",
  "LIB_Willys_MB_Ambulance_w",
  "LIB_Zis5v_w",
  "LIB_Zis6_parm_w",
  "LIB_Zis5v_med_w",
  "LIB_Zis5v_fuel_w",
  "LIB_Willys_MB_Unarmed_base",
  "LIB_Zis5v_61K_DLV"

];

VVS_RMO = [
  "LIB_SdKfz_7_w",
  "LIB_OpelBlitz_Ambulance_w",
  "LIB_OpelBlitz_Parm_w",
  "LIB_Kfz1_MG42",
  "LIB_GER_KubelGreyHood",
  "LIB_GER_Kubel",
  "LIB_GER_Kubel_Medical",
  "LIB_GER_KubelBeigeHood_Medical",
  "LIB_ger_opelblitz_medical",
  "CSA38_opelblitz3_W",
  "CSA38_opelblitz2_W",
  "CSA38_opelblitz_W",
  "CSA38_opelblitz4_W",
  "CSA38_opelblitz5_W",
  "CSA38_opelblitz3_W"
];

VVS_BTR = [
  "LIB_SdKfz_7_AA_w",
  "LIB_SdKfz251_FFV_w",
  "LIB_Sdkfz251_w",
  "Lib_ger_SdKfz251IFL_medical"
];

VVS_Turel = [
  "LIB_Pak40_w",
  "LIB_leFH18",
  "LIB_leFH18_AT"
];

VVVS_BTR1 = [
  "LIB_SOV_M3_Halftrack_w"
];

VVS_Turel1 = [
  "NORTH_SOV_45mm1937",
  "NORTH_SOV_W_76mm1936",
  "LIB_Zis3_w"
];


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
