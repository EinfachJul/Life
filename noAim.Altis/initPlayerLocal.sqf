/*
	Starts the initialization of the player.
*/
zko_adminstufe = nil;zak_copstufe = nil;life_donatorlevel = nil;
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call noaim_fnc_MPexec};
noaim_fnc_Loggy = compilefinal preprocessFile "core\functions\network\fn_ax_log.sqf";
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";
[] execVM "core\functions\fn_emptyFuel.sqf";
//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

player enableStamina false;

pb_positionen = [[17446.332,13057.269,0.00143051],[17326.43,13195.418,0.0014081],[17444.281,13242.097,0.00141621],[17366.695,13236.6,0.00136614],[17403.764,13131.769,0.00113297],[17504.502,13171.249,0.00124598],[17466.027,13116.346,0.001472],[17518.223,13128.582,0.00142336],[17485.869,13202.555,0.00156975],[17370.914,13120.888,0.00156975],[17368.146,13200.207,0.00156975],[17446.402,13201.497,0.00156975],[17490.33,13143.947,0.00156975],[17542.93,13141.365,0.00156975],[17469.664,13080.493,0.00156975],[17402.252,13272.432,0.00156975]];
joinmode = 0;