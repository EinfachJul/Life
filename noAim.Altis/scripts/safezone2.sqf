/*
	Author: Distrikt41.de - Dscha
	Safezones script
*/

private ["_eh1","_inArea","_zone1","_zone2","_zone3","_zone4","_zone7","_zone7a","_zone7b","_zone8","_zone9","_zone10","_dis","_dis3","_dis4","_obst1","_obst2","_obst3","_obst4"];

_zone1 = getMarkerPos "safezone_kavala";  // 300x300 
_zone2 = getMarkerPos "safezone_pygros";  // 150x150
_zone3 = getMarkerPos "safezone_athira";  // 150x150
_zone4 = getMarkerPos "safezone_sofia";  // 150x150
_zone5 = getMarkerPos "safezone_rebel";  // 350x350
_zone6 = getMarkerPos "safezone_mafia";  // 350x350
_zone7 = getMarkerPos "safezone_aircop";  // 45x45
_zone7a = getMarkerPos "safezone_aircop1";  // 45x45
_zone7b = getMarkerPos "safezone_aircop2";  // 45x45
_zone8 = getMarkerPos "safezone_academy";  // 350x350
_zone9 = getMarkerPos "spawn_zone_noaim"; // 600x600
_zone10 = getMarkerPos "crafting_spawn_1";  // 45x45

_dis = 300; 
_dis1 = 350;
_dis2 = 150;
_dis3 = 45;
_dis4 = 600;

_obst1 = getMarkerPos "safezone_obst1";
_obst2 = getMarkerPos "safezone_obst2";
_obst3 = getMarkerPos "safezone_obst3";
_obst4 = getMarkerPos "safezone_obst4";

_inArea = false;

switch (playerSide) do
{
	case west:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis2) || (_zone4 distance player < _dis2) || (_zone5 distance player < _dis1) || (_zone6 distance player < _dis1) || (_zone7 distance player < _dis3) || (_zone7a distance player < _dis3) || (_zone7b distance player < _dis3) || (_zone8 distance player < _dis1) || (_zone9 distance player < _dis4) || (_obst1 distance player < _dis3) || (_obst2 distance player < _dis3) || (_obst3 distance player < _dis3) || (_obst4 distance player < _dis3)) && (!_inArea)) then 
				{     
					_inArea = true;
					hint "Du betrittst eine Safe Zone";
					player allowDamage false;
				};

				if (((_zone1 distance player > _dis) && (_zone2 distance player > _dis2) && (_zone3 distance player > _dis2) && (_zone4 distance player > _dis2) && (_zone5 distance player > _dis1) && (_zone6 distance player > _dis1) && (_zone7 distance player > _dis3) && (_zone7a distance player > _dis3) && (_zone7b distance player > _dis3) && (_zone8 distance player > _dis1) && (_zone9 distance player > _dis4) && (_obst1 distance player > _dis3) && (_obst2 distance player > _dis3) && (_obst3 distance player > _dis3) && (_obst4 distance player > _dis3)) && (_inArea)) then 
				{    
					_inArea = false;
					hint "Du verlaesst eine Safe Zone";
					player allowDamage true;
				};
			};
		};
	};
	
	case civilian:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis2) || (_zone4 distance player < _dis2) || (_zone5 distance player < _dis1) || (_zone6 distance player < _dis1) || (_zone7 distance player < _dis3) || (_zone7a distance player < _dis3) || (_zone7b distance player < _dis3) || (_zone8 distance player < _dis1) || (_zone9 distance player < _dis4) || (_obst1 distance player < _dis3) || (_obst2 distance player < _dis3) || (_obst3 distance player < _dis3) || (_obst4 distance player < _dis3) || (_zone10 distance player < _dis3)) && (!_inArea)) then 
				{    
					_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint "Du betrittst eine Safe Zone";
					player allowDamage false;
				};

				if (((_zone1 distance player > _dis) && (_zone2 distance player > _dis2) && (_zone3 distance player > _dis2) && (_zone4 distance player > _dis2) && (_zone5 distance player > _dis1) && (_zone6 distance player > _dis1) && (_zone7 distance player > _dis3) && (_zone7a distance player > _dis3) && (_zone7b distance player > _dis3) && (_zone8 distance player > _dis1) && (_zone9 distance player > _dis4) && (_obst1 distance player > _dis3) && (_obst2 distance player > _dis3) && (_obst3 distance player > _dis3) && (_obst4 distance player > _dis3) && (_zone10 distance player > _dis3)) && (_inArea)) then 
				{     
					player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint "Du verlaesst eine Safe Zone";
					player allowDamage true;
				};
			};
		};
	};
	uiSleep 3;
};