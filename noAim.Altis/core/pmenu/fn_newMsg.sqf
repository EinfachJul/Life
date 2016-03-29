#include "..\..\macros.hpp"
/*
	Author: Silex
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(zko_adminstufe) < 1)) then
		{
			ctrlShow[888897,false];
		};
		if((__GETC__(zak_copstufe) < 3)) then
		{
			ctrlShow[888998,false];
		};
		if((__GETC__(zek_fwehrstufe) < 2)) then
		{
			ctrlShow[888999,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwaehlt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";ctrlShow[88885, true];};
		//[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Sie haben %1 eine Nachricht gesendet: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";ctrlShow[888895,true];};
		//[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		_to = "An die Polizei";
		hint format["Sie haben %1 eine Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";ctrlShow[888896,true];};
		//[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		_to = "An die Admins";
		hint format["Sie haben %1 eine Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Feuerwehrmann im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";ctrlShow[888899,true];};
		//[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Sie haben eine Nachricht an die Feuerwehr versendet.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call zko_adminstufe) < 1) exitWith {hint "You are not an admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgaehlt!"];};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn noaim_fnc_TRY;
		[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Admin Message Sent To: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(zko_adminstufe) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call zko_adminstufe) < 1) exitWith {hint "Sie sind kein Admin!";};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Admin Nachricht an Alle: %1",_msg];
		closeDialog 887890;
	};
	//fwrequest
	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Feuerwehrmann im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";ctrlShow[888900,true];};
		//[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Notruf wurde abgesetzt.",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
	//copMsgAll
	case 9:
	{
		if((call zak_copstufe) < 1) exitWith {hint "Sie sind kein Polizist!";};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[ObjNull,_msg,player,7],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Polizei an Alle: %1",_msg];
		closeDialog 888198;
	};
	//NotarztMsgAll
	case 10:
	{
		if((call zek_fwehrstufe) < 1) exitWith {hint "Sie sind nicht von der Feuerwehr!";};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[ObjNull,_msg,player,8],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Feuerwehr an Alle: %1",_msg];
		closeDialog 888398;
	};
	
	//copMsgTO
	case 11:
	{
		if((call zak_copstufe) < 3) exitWith {hint "Sie haben nicht den benoetigten Polizei Rang!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgaehlt!"];};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[life_smartphoneTarget,_msg,player,9],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Polizei Message Sent To: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	
	//fwMsgTO
	case 12:
	{
		if((call zek_fwehrstufe) < 2) exitWith {hint "Sie haben nicht den benoetigten Feuerwehr Rang!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgaehlt!"];};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht zum Versenden eintragen!";};
		//[[life_smartphoneTarget,_msg,player,10],"TON_fnc_handleMessages",false] spawn noaim_fnc_DONE;
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Feuerwehr Message Sent To: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
};