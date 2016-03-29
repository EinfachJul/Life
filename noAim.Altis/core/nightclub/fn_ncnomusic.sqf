/*
	File: fn_schutzSirene.sqf
*/
if(license_civ_clubdj) then
{
	private["_source"];
	_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNull _source) exitWith {};
	if(playerSide == civilian) then
	{
		[player,"ncnomusic"] call noaim_fnc_globalSound;	
	};
};