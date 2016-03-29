/* 
	File: fn_nclights.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Enables/Disables the nightclub lights, then sends it to all clients.
*/
_trueorfalse = nc_light getVariable["nclights",FALSE];

if(license_civ_clubdj) then
{
	if(_trueorfalse) then {
		nc_light setVariable["nclights",FALSE,TRUE];
		hint "Das ausschalten der Lampen dauert kurz.";
	} else {
		nc_light setVariable["nclights",TRUE,TRUE];
		//[[nc_light,0.22],"noaim_fnc_ncLightsOn",true,false] call noaim_fnc_LAST;
		[nc_light,0.22] remoteExec ["noaim_fnc_ncFlashOn",-2];
	};
};