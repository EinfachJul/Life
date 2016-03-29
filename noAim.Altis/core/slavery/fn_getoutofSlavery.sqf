/*
	File: fn_getoutofSlavery.sqf
	@Foamy
	www.strainonline.com
	www.strainmod.com	
	Description:
	Gets the player out of Slavery.
*/
#include "..\..\macros.hpp"

if(life_inv_slavecotton < 29) exitWith {hint "Lern zaehlen!"};
if(life_inv_slavecotton > 29) then 
{
	[false,"slavecotton",29] call noaim_fnc_handleInv;
	player setPos (getMarkerPos "slave_free_marker");
	slave_task1 setTaskState "Du bist Frei!";
	player removeSimpleTask slave_task1;
};
life_enslaved = false;
player setVariable["enslaved",true,true];
//sleep (30 * 60);
sleep 300;
player setVariable["enslaved",false,true];
hint "Aufpassen! Nicht das du wieder als Sklave endest!";