/*
	Some random and dynamical stuff for market
*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];
_rand = [0,200] call noaim_fnc_randomRound; //0-200
diag_log "[MARKET] marketChange called.";

switch(true) do
{
	case (_rand <= 30): //30% default market change value (strong version)
	{
		{
			if(random(10) <= 4) then //Random for each resource
			{
				_modifier = [-20,20] call noaim_fnc_randomRound; //Verkaufte/Gekaufte Items
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call noaim_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call noaim_fnc_marketBuy; 
				};
			};
		}
		foreach life_market_prices;
	};
	case (_rand <= 30): //6% Drogenpreis erhöhen
	{
		//[[0,"News: Ein Drogenschmugglerring wurde auf Altis hochgenommen!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Ein Drogenschmugglerring wurde auf Altis hochgenommen!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["cocainep", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["heroinp", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		
		diag_log "+Market+ Event drugp";
	};
	case (_rand <= 40): //8% Ölpreis erhöhen
	{
		//[[0,"News: Ölzulieferer meldet gesunkenen Ölfrachter!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Ölzulieferer meldet gesunkenen Ölfrachter!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["oilp", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		
		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 40): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		//[[0,"News: Die Regierung genehmigt den Bau des neue Einkaufszentrum in Kavala!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Die Regierung genehmigt den Bau des neue Einkaufszentrum in Kavala!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["copper_r", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["iron_r", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["glass", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		
		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 40): //4% Schmuck+Dia
	{
		//[[0,"News: Eine große Schmuckaustellung steht bevor!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Eine große Schmuckaustellung steht bevor!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//["schmuck", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["diamondc", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["diamond", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 

		diag_log "+Market+ Event goldm";
	};
	case (_rand <= 40): //8% Kupfer+Silber+Bronze+Eisen
	{
		//[[0,"News: Elektronikindustrie benötigt Edelmetalle!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Elektronikindustrie benötigt Edelmetalle!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["silberp", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["diamond", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["copper_r", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		["iron_r", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		//["eisenp", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 

		diag_log "+Market+ Event copperp";
	};
	case (_rand <= 10): //6% Goldpreis erhöht sich
	{
		//[[0,"News: Anleger verlieren Vertrauen im Euro!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Anleger verlieren Vertrauen im Euro!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["goldbar", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 
		
		diag_log "+Market+ Event goldp";
	};
	case (_rand <= 50): //10% Schildkröten höher
	{
		//[[0,"News: Eine zuhohe Population an Schildkröten gefaehrdet die Naturschutzgebiete!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Eine zuhohe Population an Schildkröten gefaehrdet die Naturschutzgebiete!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell
		["turtle", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 	
		
		diag_log "+Market+ Event turtlep";
	};
	case (_rand <= 20): //10% rhöht
	{
		//[[0,"News: Die Mafia treibt auf Altis wieder ihr Unwesen!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Die Mafia treibt auf Altis wieder ihr Unwesen!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell ARYX
		["haschisch", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketBuy; 		
		
		diag_log "+Market+ Event turtlep";
	};
	case (_rand <= 35): //6% Drogenpreis niedriger
	{
		//[[0,"News: Neue synthetische Droge überschwemmt Drogenmarkt!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Neue synthetische Droge überschwemmt Drogenmarkt!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["cocainep", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["heroinp", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		
		diag_log "+Market+ Event drugm";
	};
	case (_rand <= 35): //8% Ölpreis sinkt
	{
		//[[0,"News: Neuer Biotreibstoff überschwemmt den Markt!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Neuer Biotreibstoff überschwemmt den Markt!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["oilp", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		
		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 35): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		//[[0,"News: Die Regierung lehnt den Bau des neue Einkaufszentrum in Kavala ab!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Die Regierung lehnt den Bau des neue Einkaufszentrum in Kavala ab!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["diamondc", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["iron_r", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["glass", [20,40] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		
		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 35): //4% Goldpreis steigt
	{
		//[[0,"News: Schmuckausstellung wurde abgesagt, da Diebe ihr Unwesen treiben!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Schmuckausstellung wurde abgesagt, da Diebe ihr Unwesen treiben!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
	//	["schmuck", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["diamondc", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["diamond", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 

		diag_log "+Market+ Event goldm";
	};
	case (_rand <= 35): //8% Kupfer/Silber erhöht sich
	{
		//[[0,"News: Bedarf an Edelmetalle sinkt!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Bedarf an Edelmetalle sinkt!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["silberp", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["diamond", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["copper_r", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		["iron_r", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 

		diag_log "+Market+ Event copperp";
	};
	case (_rand <= 15): //6% Goldpreis erhöht sich
	{
		//[[0,"News: Der Dollar festigt seinen Wert!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Der Dollar festigt seinen Wert!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		["goldbar", [15,30] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 
		
		diag_log "+Market+ Event goldp";
	};
	case (_rand <= 45): //10% Schildkröten höher
	{
		//[[0,"News: Schildkröten sind vor den Aussterben bedroht!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Schildkröten sind vor den Aussterben bedroht!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell
		["turtle", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 	
		
		diag_log "+Market+ Event turtlep";
	};
	case (_rand <= 25): //10% erhöht
	{
		//[[0,"News: Die Mafia verlaesst Altis wieder!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Die Mafia verlaesst Altis wieder!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell
		["haschisch", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell;
		
		diag_log "+Market+ Event turtlep";
	};
	case (_rand <= 35): //10% erhöht
	{
		//[[0,"News: Die staatlichen Festlichkeiten wurden abgesagt!"],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
		[0,"News: Die staatlichen Festlichkeiten wurden abgesagt!"] remoteExecCall ["noaim_fnc_broadcast",-2];
		
		//Erhöhe Marktpreis mit marketSell 	
		["zuckerip", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 	
		["traubenp", [4,10] call noaim_fnc_randomRound, true] call noaim_fnc_marketSell; 	
		
		diag_log "+Market+ Event turtlep";
	};

	default //market change: default version
	{
		{
			_defaultprice = 0;			
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;
		
			{
				if((_x select 0) == _shortname) exitWith
				{
					_defaultprice = _x select 1;
				};
			}
			foreach life_market_resources;
			
			if(_defaultprice > 0) then
			{
				_difference = _defaultprice - _price; //Defaultprice - current pric
				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;
				diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				//New price arr
				life_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,_modifier] ]; //set raw values
			}
			else
			{
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		}
		foreach life_market_prices;
	};
};

publicVariable "life_market_prices";