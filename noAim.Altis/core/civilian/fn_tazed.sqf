/*
	Author: Bryan "Tonic" Boardwine
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_istazed) then
	{
		life_istazed = true;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};
		
		//[[_unit],"noaim_fnc_tazeSound",true,false] spawn noaim_fnc_DONE;
		[_unit] remoteExec ["noaim_fnc_tazeSound",-2];
		_obj = createVehicle ["Land_ClutterCutter_small_F", getPosATL _unit, [], 0, "NONE"];
		_obj setPosATL (getPosATL _unit);
		//[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_DONE;
		[player, "AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["noaim_fnc_animSync", -2];
		
		//[[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_DONE;
		//format["STR_NOTF_Tazed",profileName, _shooter getVariable["realname",name _shooter]] remoteExec ["noaim_fnc_broadcast",-2];
		[0,format[localize "STR_NOTF_Tazed",profileName, _shooter getVariable["realname",name _shooter]]] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["noaim_fnc_animSync",-2];
		//[[player,"amovppnemstpsraswrfldnon"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_DONE;
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		life_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
}
else
{
	_unit allowDamage true;
	//ARYX life_iztazed
	life_istazed = false;
};