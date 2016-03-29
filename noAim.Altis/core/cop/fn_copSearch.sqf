#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call TON_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		//[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
		[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"] remoteExec ["noaim_fnc_wantedAdd",2];
	};
	
	//[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
	[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"] remoteExec ["noaim_fnc_wantedAdd",2];
	
	[0,"STR_Cop_Contraband",true,[(_civ getVariable["realname",name _civ]),[_illegal] call noaim_fnc_numberTex]] remoteExecCall ["noaim_fnc_broadcast",west];
	//[[0,"STR_Cop_Contraband",true,[(_civ getVariable["realname",name _civ]),[_illegal] call noaim_fnc_numberText]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
}
else
{
	_inv = localize "STR_Cop_NoIllegal";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}];

if(_robber) then
{
	[0,"STR_Cop_Robber",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",-2];
	//[[0,"STR_Cop_Robber",true,[profileName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
};