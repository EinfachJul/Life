#define SAFETY_ZONES    [["safezone_kavala", 300],["safezone_pygros", 150]]
#define MESSAGE "Das Schiessen ist in dieser Zone von Zivilisten nicht erwuenscht."

if (isDedicated) exitWith {};
waitUntil {!isNull player};

switch (playerSide) do
{
	case west:
	{};
	
	case civilian:
	{
    player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
             deleteVehicle (_this select 6);
			 hint parseText format["<t color='#FFFFFF' align='center' size='1'>Du befindest dich in einer Safezone</t><br/><t color='#FFFFFF' align='center' size='1.5'>Keine Gewalt</t><br/><t color='#FFFFFF' align='center' size='1.5'>Kein Niederschlagen</t><br/><t color='#FFFFFF' align='center' size='1.5'>Kein Ausrauben</t><br/> <t color='#FFFFFF' align='center' size='1.5'>Kein Stehlen</t><br/><t color='#FFFFFF' align='center' size='1.5'>Kein Trollen</t>"];
             titleText [MESSAGE, "PLAIN", 3];
             };
        }];  
	};
};