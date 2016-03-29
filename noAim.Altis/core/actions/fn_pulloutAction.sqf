/*
	Author: Bryan "Tonic" Boardwine
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if(side _x != west) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		//[[_x],"noaim_fnc_pulloutVeh",_x,false] spawn noaim_fnc_DONE;
		[_x] remoteExec ["noaim_fnc_pulloutVeh", _x];
		false;
	};
} foreach _crew;