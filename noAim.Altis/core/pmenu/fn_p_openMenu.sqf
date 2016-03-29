#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[2045,false];
		ctrlShow[6780,false]; //taxi call button
        ctrlShow[6600,false]; //TAXI
		ctrlShow[9900,false];
		ctrlShow[9810,false];
		ctrlShow[9414,true];
		ctrlShow[888398,false];
		ctrlShow[888898,false];
		ctrlShow[888198,true];
	};
	case east:
	{
       	ctrlShow[2012,false];
		ctrlShow[9800,false];
		ctrlShow[6780,false]; //taxi call button
        ctrlShow[6600,false]; //TAXI
		ctrlShow[2011,false];
		ctrlShow[9900,false];
		ctrlShow[9810,false];
		ctrlShow[9414,false];
		ctrlShow[888398,true];
		ctrlShow[888898,false];
		ctrlShow[888198,false];
	};
	case independent:
	{
		ctrlShow[2011,false];
		ctrlShow[2045,false];
		ctrlShow[9900,false];
		ctrlShow[6780,false]; //taxi call button
        ctrlShow[6600,false]; //TAXI
		ctrlShow[9810,false];
		ctrlShow[9414,false];
		ctrlShow[888398,false];
		ctrlShow[888898,false];
		ctrlShow[888198,false];
	};
	case civilian:
	{
		ctrlShow[2012,false];
		ctrlShow[2045,false];
		ctrlShow[9800,false];
		ctrlShow[9900,false];
		ctrlShow[9414,false];
		ctrlShow[888398,false];
		ctrlShow[888898,false];
		ctrlShow[888198,false];
		if ((license_civ_taxi) && (life_isOnDutyTaxi)) then
        {
	        ctrlShow[9810,true];
        } else {
		    ctrlShow[9810,false];
		};
	};
};
/*
if(__GETC__(zko_adminstufe) < 1) then
{
	//ctrlShow[2021,false];
};*/

if(__GETC__(zko_adminstufe) < 1) then
{
	ctrlShow[2911,false];
	ctrlShow[2045,false];
	ctrlShow[2910,false];
	ctrlShow[2909,false];
	ctrlShow[2908,false];
	ctrlShow[2907,false];
	ctrlShow[2906,false];
	ctrlShow[2904,false];
	ctrlShow[888398,false];
	ctrlShow[888898,true];
	ctrlShow[888198,false];
};

[] call noaim_fnc_p_updateMenu;