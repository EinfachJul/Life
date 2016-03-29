if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

waitUntil {!isnull (findDisplay 39500)};

[] call noaim_fnc_refreshMarketView;