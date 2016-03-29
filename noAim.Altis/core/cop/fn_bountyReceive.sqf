/*
	Author: Bryan "Tonic" Boardwine
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total","_addExpAmount","_valBon","_m","_data"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;
_addExpAmount = 0;
_valBon = 1;
_m = 0.06;
if(_val == _total) then
{
//AX_LOG NEED TEST
	titleText[format[localize "STR_Cop_BountyRecieve",[_val] call noaim_fnc_numberText],"PLAIN"];
	//[format ["COPABUSE: %1 hat %2 Kopfgeld erhalten", name player, [_val] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
}
else
{
//AX_LOG NEED TEST
	titleText[format[localize "STR_Cop_BountyKill",[_val] call noaim_fnc_numberText,[_total] call noaim_fnc_numberText],"PLAIN"];
	//[format ["COPABUSE: %1 hat %2 Kopfgeld von Total %3 erhalten", name player, [_val] call noaim_fnc_numberText,[_total] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
};

_data = missionNamespace getVariable "Hero_Prof";
switch ( _data select 0 ) do
{
        case 0: {_m = 0.05;};
        case 1: {_m = 0.08;};
        case 2: {_m = 0.1;};
        case 3: {_m = 0.15;};
        case 4: {_m = 0.17;};
        case 5: {_m = 0.20;};
        case 6: {_m = 0.22;};
        case 7: {_m = 0.25;};
        case 8: {_m = 0.28;};
        case 9: {_m = 0.30;};
        case 10: {_m = 0.33;};
        case 11: {_m = 0.36;};
        case 12: {_m = 0.4;};
        case 13: {_m = 0.44;};
        case 14: {_m = 0.46;};
        case 15: {_m = 0.48;};
        case 16: {_m = 0.50;};
        case 17: {_m = 0.55;};
        case 18: {_m = 0.60;};
        case 19: {_m = 0.63;};
        case 20: {_m = 0.65;};
};
 
_valBon = round((_val * 0.1) * _m);
diag_log format["valbon %1",_valBon];
_addExpAmount = round(_valBon * 0.05);
["Hero_Prof",_AddExpAmount] call noaim_fnc_addExp;
//[[0,format["Sie erhalten %1 XP und einen Bonus von %2 € fuer diesen Arrest", _addExpAmount]],"noaim_fnc_broadcast",player,false] spawn noaim_fnc_TRY;
[0,format["Sie erhalten %1 XP und einen Bonus von %2 € fuer diesen Arrest", _addExpAmount]] remoteExecCall ["noaim_fnc_broadcast",player];

life_zgazzy = life_zgazzy + _val + _valBon;

/*AX_LOG *DEFEKT FIX
[format ["COPABUSEBOUNTY: Beamter %1(%2) hat %3%4 des Kopfgeldes von %5 erhalten, Gesamt %6..", name player,getPlayerUID player,_percent,"%",_uid,[_total] call noaim_fnc_numberText,[life_zgazzy] call noaim_fnc_numberText], _from getVariable["realname",name _from],(parseNumber(_val))],"ax_log",false,false] call noaim_fnc_Loggy;
//[["money",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;*/