/*
	Author: Bryan "Tonic" Boardwine
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?
/*if (player getVariable["newbie",false]) exitWith {};*/

if(life_znorak > 0) then
{
	
	/*
		_tmp_cash = life_cash;
	life_cash = 0;
	[0] call SOCK_fnc_updatePartial;
	
	[_tmp_cash] remoteExec ["noaim_fnc_robReceive",_robber]; */ // REMOTE
	[life_znorak] remoteExec ["noaim_fnc_robReceive",_robber];
	//[[life_znorak],"noaim_fnc_robReceive",_robber,false] spawn noaim_fnc_DONE;
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteExec ["noaim_fnc_wantedAdd",2];
	//[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
	//[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_znorak] call noaim_fnc_numberText]],"noaim_fnc_broadcast",nil,false] spawn noaim_fnc_TRY;
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_znorak] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",nil];
	
	life_znorak = 0;
	[0] call SAX_fnc_updatePartial;
	[] call SAX_fnc_updateRequest;
	/*profileNamespace setVariable["Busted",true];
	sleep 10;
	profileNamespace setVariable["Busted",false];*/
}
else
{
	//[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211v"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211v"] remoteExec ["noaim_fnc_wantedAdd",2];
	//[[2,"STR_NOTF_RobFail",true,[profileName]],"noaim_fnc_broadcast",_robber,false] spawn noaim_fnc_TRY;
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",_robber];
};
/*
// Sync life_znorak to DB:
[[getPlayerUID player,playerSide,life_znorak,0],"DB_fnc_updatePartial",false,false] spawn noaim_fnc_DONE;

// Sync life_zgazzy to DB:
[[getPlayerUID player,playerSide,life_zgazzy,1],"DB_fnc_updatePartial",false,false] spawn noaim_fnc_DONE;*/

//AX_LOG *DEFEKT *FIX
[format ["GESTOHLEN: [Raub] %1 (%4) wurden von %2 to %3€ geklaut.", name player, name _robber, [life_znorak] call noaim_fnc_numberText, getPlayerUID player],"ax_log",false,false] call noaim_fnc_Loggy;