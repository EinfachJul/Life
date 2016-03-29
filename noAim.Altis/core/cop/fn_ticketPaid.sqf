/*
 Author: Bryan "Tonic" Boardwine
 Verifies that the ticket was paid.
*/
private["_value","_unit","_cop","_addExpAmount","_valBon","_m","_data"];
_value = [_this,0,5,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_cop = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_addExpAmount = 0;
_valBon = 0;
_m = 0.004;
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

_data = missionNamespace getVariable "Ticket_Prof";
switch ( _data select 0 ) do
{
        case 0: {_m = 0.005;};
        case 1: {_m = 0.008;};
        case 2: {_m = 0.01;};
        case 3: {_m = 0.015;};
        case 4: {_m = 0.017;};
        case 5: {_m = 0.020;};
        case 6: {_m = 0.022;};
        case 7: {_m = 0.025;};
        case 8: {_m = 0.028;};
        case 9: {_m = 0.030;};
        case 10: {_m = 0.033;};
        case 11: {_m = 0.036;};
        case 12: {_m = 0.04;};
        case 13: {_m = 0.044;};
        case 14: {_m = 0.046;};
        case 15: {_m = 0.048;};
        case 16: {_m = 0.050;};
        case 17: {_m = 0.055;};
        case 18: {_m = 0.060;};
        case 19: {_m = 0.063;};
        case 20: {_m = 0.065;};
};
 
_valBon = round(_value * 0.10);
_addExpAmount = round(_valBon * _m);
["Ticket_Prof",_addExpAmount] call noaim_fnc_addExp;
//[[0,format["Sie erhalten %1 XP und einen Bonus von %2 € fuer dieses Ticket", _addExpAmount, [_valBon] call noaim_fnc_numberText]],"noaim_fnc_broadcast",player,false] spawn noaim_fnc_TRY;
[0,format["Sie erhalten %1 XP und einen Bonus von %2 € fuer dieses Ticket", _addExpAmount, [_valBon] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",player];

life_zgazzy = life_zgazzy + _value + _valBon;

[6] call SAX_fnc_updatePartial;