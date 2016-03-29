/*
	Author: Bryan "Tonic" Boardwine
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == east} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	//[[life_corpse,profileName],"noaim_fnc_medicRequest",east,FALSE] spawn noaim_fnc_DONE;
	[life_corpse,profileName] remoteExec ["noaim_fnc_medicRequest",east];
/*} else {
	//No medics were online, send it to the police.
	[[life_corpse,profileName],"noaim_fnc_copMedicRequest",west,FALSE] spawn noaim_fnc_DONE;*/
	
	Life_request_timer = true;
	life_corpse setvariable ["fwcall",true,true];
};


//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (5 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};