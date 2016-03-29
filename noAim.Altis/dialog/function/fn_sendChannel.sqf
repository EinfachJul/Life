/*
	Author: alleskapot & Lifted
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.
*/
private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if (life_znorak < 100000 ) exitWith { systemChat "Du brauch €100.000 um eine Nachricht zu schicken!"; };
if (playerSide != civilian ) exitWith { systemChat "Du musst Zivilist sein!"; };
if (life_channel_send) exitWith { systemChat "Warte 10 Minuten bevor du einen neue Nachricht sendest!"; };
life_znorak = life_znorak - 100000;

_message = ctrlText 9001;

//[[3,format ["noAim News %1",_message]],"noaim_fnc_broadcast",true,false] call noaim_fnc_TRY;
[3,format["noAim News %1",_message]] remoteExecCall ["noaim_fnc_broadcast",-2];
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};