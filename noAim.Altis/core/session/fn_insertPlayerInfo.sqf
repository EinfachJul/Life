/*
	Author: Bryan "Tonic" Boardwine
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

//[[getPlayerUID player,profileName,life_znorak,life_zgazzy,player],"DB_fnc_insertRequest",false,false] spawn noaim_fnc_DONE;
[getPlayerUID player,profileName,life_znorak,life_zgazzy,player] remoteExec ["DB_fnc_insertRequest",2];