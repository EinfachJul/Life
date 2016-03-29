/* 
	File: fn_ncflash.sqf
	Author: Maxi
	Date: 2/12/15
	Desc: main file for the strobe..
*/
_trueorfalse = nc_light getVariable["ncstrobe",FALSE];

if(_trueorfalse) then {
	hint "Es dauert kurz bis alle Scheinwerfer ausgeschaltet wurden.";
	nc_light setVariable["ncstrobe",FALSE,TRUE];
} else {
	nc_light setVariable["ncstrobe",TRUE,TRUE];
	//[[nc_light,perrys_stage],"noaim_fnc_ncFlashOn",true,false] spawn noaim_fnc_LAST;
	[nc_light,perrys_stage] remoteExec ["noaim_fnc_ncFlashOn",-2];
};