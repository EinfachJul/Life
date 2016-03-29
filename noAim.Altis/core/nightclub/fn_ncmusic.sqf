/*
	File: fn_schutzSirene.sqf
*/	
if(license_civ_clubdj) then
{
	if (life_ncmusica) exitWith {hint "Du hast die Music vor kurzem erst benutzt!"};	
	private["_source"];
	_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNull _source) exitWith {};
	if(playerSide == civilian) then
	{
		[player,"ncmusic"] call noaim_fnc_globalSound;	
		life_ncmusica = true;
	};
	sleep 340;
	life_ncmusica = false;
};