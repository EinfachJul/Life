/* 
	File: fn_ncsmoke.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Creates a smoke canister, that then is constantly recreated and hidden to create a smoke machine effect.
*/
if(license_civ_clubdj) then
{
	if((smokem getVariable["nightclub_smoke",false])) exitWith
	{
		hint "Bitte warten Sie bis der Rauch aus ist.";
		smokem setVariable["nightclub_smoke",false,true];
	};
	smokem setVariable["nightclub_smoke",true,true];
	hint "Smoke is On!";

	while {(smokem getVariable["nightclub_smoke",false])} do
	{
		_smoke = "SmokeShell" createVehicle getMarkerPos "smoke";
		_smoke1 = "SmokeShell" createVehicle getMarkerPos "smoke_1";
		_smoke2 = "SmokeShell" createVehicle getMarkerPos "smoke_2";
		hideObject _smoke;
		hideObject _smoke1;
		hideObject _smoke2;
		sleep 60;
	};
};