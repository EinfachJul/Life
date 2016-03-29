#include <macro.h>
/*
	Updates player clothing by replacing vanilla by custom ones
*/

// =============================================================================================================================
// POLIZEI / GSG9
// U_B_CombatUniform_mcam
// U_B_CombatUniform_mcam_tshirt
// U_I_CombatUniform
// U_B_SpecopsUniform_sgg
// U_B_CombatUniform_mcam_worn (NOT USED YET)
// U_B_CTRG_1 (USED FOR MEDICS BUT NOT YET FOR COPS)
// U_B_CTRG_3 (USED FOR MEDICS BUT NOT YET FOR COPS)

if(playerSide == west) then {

	switch(true) do {
	
		case ((uniform player == "U_B_CombatUniform_mcam") && (__GETC__(zak_copstufe) == 1)) : { //LEER
			player setObjectTextureGlobal [0,"textures\uniforms\cop\cop_anwaerter.paa"];
			[player,"POLIZEI"] call BIS_fnc_setUnitInsignia;
		};
		case ((uniform player == "U_B_CombatUniform_mcam") && (__GETC__(zak_copstufe) > 1)) : { //ANWÄRTER
			player setObjectTextureGlobal [0,"textures\uniforms\cop\cop_beamter.paa"];
			[player,"POLIZEI"] call BIS_fnc_setUnitInsignia;
		};
		case (uniform player == "U_B_CombatUniform_mcam_tshirt") : { //NEW GSG9
			player setObjectTextureGlobal [0,"textures\uniforms\cop\cop_beamter.paa"];
			[player,"POLIZEI"] call BIS_fnc_setUnitInsignia;
		};
		
		//U_B_CTRG_3 U_I_CombatUniform
		case (uniform player == "U_B_SpecopsUniform_sgg") : { //NEW GSG9
			player setObjectTextureGlobal [0,"textures\uniforms\gsg9\gsg9_polizei.paa"];
			[player,"GSG9"] call BIS_fnc_setUnitInsignia;
		};
		case (uniform player == "U_B_CTRG_1") : { //NEW GSG9
			player setObjectTextureGlobal [0,"textures\uniforms\gsg9\gsg9_polizei-1.paa"];
			[player,"GSG9"] call BIS_fnc_setUnitInsignia;
		};
		case (uniform player == "U_B_CombatUniform_mcam_worn") : { //NEW GSG9
			player setObjectTextureGlobal [0,"textures\uniforms\gsg9\gsg9_polizei-2.paa"];
			[player,"POLIZEI"] call BIS_fnc_setUnitInsignia;
		};
	};
	
	switch (true) do {
		case (backpack player == "B_Carryall_oucamo") : {
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		case (backpack player == "B_Kitbag_rgr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.05,0.05,0.05,1)"];
		};
		case (backpack player == "B_TacticalPack_blk") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(ai,64,64,1)Fresnel(0.3,3)"];
		};
		case (backpack player == "B_TacticalPack_ocamo") : {
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
	};
};

// =============================================================================================================================
// FEUERWEHR / SANITÄTER
// U_I_HeliPilotCoveralls

if(playerSide == east) then {
	if((uniform player == "U_B_CombatUniform_mcam") && (__GETC__(zek_fwehrstufe) == 2)) then {
		player setObjectTextureGlobal [0, "textures\uniforms\fw\med_sanitaeter.paa"];
	};
	if((uniform player == "U_B_CombatUniform_mcam") && (__GETC__(zek_fwehrstufe) == 3)) then {
		player setObjectTextureGlobal [0, "textures\uniforms\fw\med_notarzt.paa"];
	};
	
	switch(true) do {
		case (uniform player == "U_B_CTRG_3") : {
			player setObjectTextureGlobal [0,"textures\uniforms\fw\fw_uniform.paa"];
		};
	};
	switch(true) do {
		case (uniform player == "U_B_CTRG_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\fw\fw_uniformT.paa"];
		};
	};
	
	switch (true) do {
		case (backpack player == "B_Carryall_oucamo") : {
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		case (backpack player == "B_Kitbag_sgg") : {
			(backpackContainer player) setObjectTextureGlobal [0,"textures\uniforms\fw\med_backpack.paa"];
		};
	};
};
// =============================================================================================================================
// ZIVILISTEN

if(playerSide == civilian) then {
	switch(true) do {
		//MAFIA
		case (uniform player == "U_BG_Guerilla3_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\mafia\mafia3.paa"];
		};
		case (uniform player == "U_BG_Guerilla3_2") : {
			player setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.05,0.05,0.05,0.5)"];
		};
		case (uniform player == "U_IG_Guerilla3_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\mafia\mafia1.paa"];
		};
		case (uniform player == "U_OG_Guerilla3_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\mafia\mafia2.paa"];
		};
		case (uniform player == "U_I_CombatUniform") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\mafia\mafia4.paa"];
		};
		//BÜRGER
		case (uniform player == "U_C_Commoner1_2") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_bluebull.paa"];
		};
		case (uniform player == "U_C_Commoner1_3") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\hawaii_shirt2.paa"];
		};
		case (uniform player == "U_C_Poloshirt_salmon") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_cry.paa"];
		};
		case (uniform player == "U_C_Poloshirt_burgundy") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\hawaii_shirt.paa"];
		};
		case (uniform player == "U_C_Poor_shorts_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_geisterbuster.paa"];
		};
		case (uniform player == "U_C_Commoner_shorts") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_hallokitty.paa"];
		};
		case (uniform player == "U_C_ShirtSurfer_shorts") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_jurassiczoo.paa"];
		};
		case (uniform player == "U_C_TeeSurfer_shorts_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_monsta.paa"];
		};
		case (uniform player == "U_C_TeeSurfer_shorts_2") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_noaim.paa"];
		};
		case (uniform player == "U_C_Commoner1_1") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_northpark.paa"];
		};
		// uniform player == "U_C_Poloshirt_blue"
		case (uniform player == "U_C_Poloshirt_stripped") : {
			player setObjectTextureGlobal [0,"textures\uniforms\civ\civ_weed.paa"];
		};
	};
	
	switch (true) do {
		case (backpack player == "B_AssaultPack_blk") : { // MARKE
			(backpackContainer player) setObjectTextureGlobal [0,"#(ai,64,64,1)Fresnel(0.3,3)"];
		};
		case (backpack player == "B_Bergen_mcamo") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.43,0.01,0,0.5)"]; //RED
		};
		case (backpack player == "B_AssaultPack_cbr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.11,0.11,0.11,1)"]; //GRAU
		};
		case (backpack player == "B_FieldPack_oli") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.11,0.11,0.11,1)"]; //GRAU
		};
		case (backpack player == "B_Kitbag_rgr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.05,0.05,0.05,1)"]; //BLACK
		};
		case (backpack player == "B_Kitbag_cbr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.10,0.10,0.10,1)"]; //HGRAU
		};
		case (backpack player == "B_Carryall_cbr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.05,0.05,0.05,1)"]; //BLACK
		};
		case (backpack player == "B_Carryall_khk") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.17,0.17,0.17,1)"]; //HGRAU
		};
		case (backpack player == "B_HuntingBackpack") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.78,0.27,0,1)"]; //ORANGE
		};
		case (backpack player == "B_OutdoorPack_blu") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0.3,0.52,0.3)"]; //BLAU
		};
		case (backpack player == "B_OutdoorPack_tan") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.98,0.98,0.98,0.5)"]; //WEISS
		};
		case (backpack player == "B_OutdoorPack_blk") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.3,0.04,0.45,0.4)"]; //LILA
		};
		case (backpack player == "B_Bergen_blk") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.9,0.9,0.9,1)"]; //GRAU
		};
		case (backpack player == "B_Bergen_rgr") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.98,0.87,0.07,0.3)"]; //GELB
		};
		case (backpack player == "B_Bergen_sgg") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.61,0.11,0.42,0.4)"]; //PINK
		};
		case (backpack player == "B_TacticalPack_blk") : {
			(backpackContainer player) setObjectTextureGlobal [0,"#(ai,64,64,1)Fresnel(0.3,3)"]; //PINK
		};
		case (backpack player == "B_Carryall_oucamo") : {
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
	};
};	
//==============================================================================================================================