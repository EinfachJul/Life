/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
	e-monkeys.com
*/
/*
private["_swmpos"];
if(life_schwarzmarkt) exitWith {hint "Der Schwarzmarkt haendler ist bereits in der Stadt."};

_swmpos = round(random 13);




switch(true) do
		{
			case (_swmpos < 1) : 
			{
				SchwarzMarkt_1 hideObject false;
				"SchwarzMarkt_1" setMarkerAlphaLocal 1;
				_text = "PVP:ZONE: Der Schwarzmarkthaendler ist in Altis erschienen, nahe PLATZHALTER."; _haendler = "Schwarzmarkthaendler"; [_text,_haendler,0] spawn clientMessage;
				life_schwarzmarkt = true;
			
           };
		   case (_swmarkt < 2) : 
		   {
				SchwarzMarkt_2 hideObject false;
				"SchwarzMarkt_2" setMarkerAlphaLocal 1;
				_text = "PVP:ZONE: Der Schwarzmarkthaendler ist in Altis erschienen, nahe PLATZHALTER."; _haendler = "Schwarzmarkthaendler"; [_text,_haendler,0] spawn clientMessage;
				life_schwarzmarkt = true;		
            };
			case (_swmarkt < 3) : 
			{
				SchwarzMarkt_3 hideObject false;
				"SchwarzMarkt_3" setMarkerAlphaLocal 1;
				_text = "PVP:ZONE: Der Schwarzmarkthaendler ist in Altis erschienen, nahe PLATZHALTER."; _haendler = "Schwarzmarkthaendler"; [_text,_haendler,0] spawn clientMessage;
				life_schwarzmarkt = true;		
            };	
			case (_swmarkt < 4) : 
			{
				SchwarzMarkt_4 hideObject false;
				"SchwarzMarkt_4" setMarkerAlphaLocal 1;
				_text = "PVP:ZONE: Der Schwarzmarkthaendler ist in Altis erschienen, nahe PLATZHALTER."; _haendler = "Schwarzmarkthaendler"; [_text,_haendler,0] spawn clientMessage;
				life_schwarzmarkt = true;		
            };
			
			case (_swmarkt < 5) : 
			{
            Dealer_1_1_1 hideObject false;
			"Dealer_1_1_1" setMarkerAlphaLocal 1;
			"kreis_1_1_1" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten beim Einwohnermeldeamt."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 6) : 
			{
            Dealer_1_1_2 hideObject false;
			"Dealer_1_1_2" setMarkerAlphaLocal 1;
			"kreis_1_1_2" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten in der n�he der M�llhalde."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 7) : 
			{
            Dealer_1_1_3 hideObject false;
			"Dealer_1_1_3" setMarkerAlphaLocal 1;
			"kreis_1_1_3" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten beim Zementh�ndler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 8) : 
			{
            Dealer_1_1_4 hideObject false;
			"Dealer_1_1_4" setMarkerAlphaLocal 1;
			"kreis_1_1_4" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist f�r 30 Minuten beim �lh�ndler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage	;
			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 9) : 
			{
            Dealer_1_1_5 hideObject false;
			"Dealer_1_1_5" setMarkerAlphaLocal 1;
			"kreis_1_1_5" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten beim S�gewerk."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 10) : 
			{
            Dealer_1_1_6 hideObject false;
			"Dealer_1_1_6" setMarkerAlphaLocal 1;
			"kreis_1_1_6" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten bei der Brauerei."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;

			EMonkeys_drogen_active = true;			
            };
			
			case (_swmarkt < 11) : 
			{
            Dealer_1_1_7 hideObject false;
			"Dealer_1_1_7" setMarkerAlphaLocal 1;
			"kreis_1_1_7" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten beim Schmuckh�ndler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			case (_swmarkt < 12) : 
			{
            Dealer_1_1_8 hideObject false;
			"Dealer_1_1_8" setMarkerAlphaLocal 1;
			"kreis_1_1_8" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist f�r 30 Minuten bei der Glash�tte."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			case (_swmarkt < 13) : 
			{
            Dealer_1_1_9 hideObject false;
			"Dealer_1_1_9" setMarkerAlphaLocal 1;
			"kreis_1_1_9" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist f�r 30 Minuten bei der Silberschmelze."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			EMonkeys_drogen_active = true;			
            };
			
			
		};

[] spawn 
{

uisleep 1800;

Dealer_1 hideObject true;
"Dealer_1" setMarkerAlphaLocal 0;
"kreis_8" setMarkerAlphaLocal 0;

Dealer_2 hideObject true;
"Dealer_1_4" setMarkerAlphaLocal 0;
"kreis_7" setMarkerAlphaLocal 0;

Dealer_3 hideObject true;
"Dealer_1_3" setMarkerAlphaLocal 0;
"kreis_9" setMarkerAlphaLocal 0;


Dealer_1_1 hideObject true;
"Dealer_1_1" setMarkerAlphaLocal 0;
"kreis_1_1" setMarkerAlphaLocal 0;

Dealer_1_1_1 hideObject true;
"Dealer_1_1_1" setMarkerAlphaLocal 0;
"kreis_1_1_1" setMarkerAlphaLocal 0;


Dealer_1_1_2 hideObject true;
"Dealer_1_1_2" setMarkerAlphaLocal 0;
"kreis_1_1_2" setMarkerAlphaLocal 0;



Dealer_1_1_3 hideObject true;
"Dealer_1_1_3" setMarkerAlphaLocal 0;
"kreis_1_1_3" setMarkerAlphaLocal 0;



Dealer_1_1_4 hideObject true;
"Dealer_1_1_4" setMarkerAlphaLocal 0;
"kreis_1_1_4" setMarkerAlphaLocal 0;



Dealer_1_1_5 hideObject true;
"Dealer_1_1_5" setMarkerAlphaLocal 0;
"kreis_1_1_5" setMarkerAlphaLocal 0;


Dealer_1_1_6 hideObject true;
"Dealer_1_1_6" setMarkerAlphaLocal 0;
"kreis_1_1_6" setMarkerAlphaLocal 0;



Dealer_1_1_7 hideObject true;
"Dealer_1_1_7" setMarkerAlphaLocal 0;
"kreis_1_1_7" setMarkerAlphaLocal 0;



Dealer_1_1_8 hideObject true;
"Dealer_1_1_8" setMarkerAlphaLocal 0;
"kreis_1_1_8" setMarkerAlphaLocal 0;



Dealer_1_1_9 hideObject true;
"Dealer_1_1_9" setMarkerAlphaLocal 0;
"kreis_1_1_9" setMarkerAlphaLocal 0;


_text = "Der Drogendealer musste seine Position wechseln."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
EMonkeys_drogen_active = false;
};





*/
