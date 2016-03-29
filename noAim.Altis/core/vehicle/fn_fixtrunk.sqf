/*
    Author: ArYx (noAim.eu)
    File: fn_fixtrunk.sqf


    Written for noAimLife.de
    http://www.noAimLife.de
    The usage of this file is restricted to noAim.eu
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Fix Trunk when Buggy
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if((_vehicle getVariable ["trunk_in_use",false])) then {
	hint "in ca. 1 min sollte der Kofferraum automatisch entsperrt werden.";
	sleep (45 + random 15);
	//cursorTarget setVariable["trunk_in_use",false,true];
	_vehicle setVariable["trunk_in_use",false,true];
} else {
	hint "Ihr Kofferraum benoetigt keinen fix.";
};