/*
	Author: alleskapot
	Description: Sends AAN News to the player
*/
private["_display","_message","_name"];
disableSerialization;
_message = _this select 0;
_name = _this select 1;
[parseText format["<t size='2'>noAim News - Breaking News</t>",_name],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
diag_log format ["%1 hat eine noAim news geschrieben: %2",_name,_message];
sleep 60;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 