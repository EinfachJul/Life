/*
	Resets market by calling marketConfiguration
*/
[] call noaim_fnc_marketconfiguration;
//[[0,format["ADMIN: %1 hat die Marktpreise auf Standard gesetzt.",name player]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
[0,format["ADMIN: %1 hat die Marktpreise auf Standard gesetzt.", name player]] remoteExecCall ["noaim_fnc_broadcast",-2];
hint "Markpreise resettet.";