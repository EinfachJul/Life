/*
	File: fn_schutzSirene.sqf
*/	
private["_pult"];
_pult = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(license_civ_clubdj) then
	{
		if (life_ncmusica) exitWith {hint "Du hast die Music vor kurzem erst benutzt!"};	
		if(isNull _pult) exitWith {};
		if(playerSide == civilian) then
			{
				[_pult,"ncmusic"] call noaim_fnc_globalSound;	
				life_ncmusica = true;
			};
		sleep 340;
		life_ncmusica = false;
	};
