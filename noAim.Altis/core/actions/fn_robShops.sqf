/*
Executes the rob shop action!
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);

_robberCount = 0;

_objects = nearestObjects [_shop, ["Air","Car","Ship","Man"], 50];
	{
		if ( (side _x)  == west ) exitWith {};
		if (getPlayerUID _x != "" ) then 
			{
				_robberCount = _robberCount + 1;
			
			};	
	} foreach _objects;

if(_cops < 5) exitWith {hint "Du kannst im Moment keinen Laden ausrauben, weil nicht genug Polizei verfuegbar ist!";};
if(side _robber == west) exitWith { hint "Verdienst du etwa nicht genug?"; };
if(side _robber == east) exitWith { hint "Sie sollten lieber Menschenleben retten!"; };
if(_robber distance _shop > 3) exitWith { hint "Du darfst maximal 3 Meter entfernt sein um auszurauben!"; };
if (vehicle player != _robber) exitWith { hint "Steig mal aus dem Wagen aus!"; };
if(_robberCount < 2) exitWith{hint "Ihr seid nicht genug Leute um die Laden auszurauben!!\n\nIhr müsst mindestens zu dritt sein";};

if (currentWeapon player in ["","Rangefinder","Binocular"]) exitWith { hint "Haha! Du machst mir keine Angst du Lutscher!"; };

if !(_kassa) then { _kassa = 50000; };
if (_rip) exitWith { hint "Es wird bereits ausgeraubt!"; };
if (currentWeapon _robber == "") exitWith { hint "Ohne Waffe wird das nichts!"; };

if !(alive _robber) exitWith {};
if (_kassa == 0) exitWith { hint "Laden hat kein Geld!"; };

_rip = true;
_kassa = 40000 + round(random 20000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 20) then {
	hint "Der stille Alarm wurde ausgeloest, du solltest jetzt fliehen!";
	//[[1,format["ALARM! - Laden: %1 wird ausgeraubt!", _shop]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
	[1,format["ALARM! - Laden: %1 wird ausgeraubt!", _shop]] remoteExecCall ["noaim_fnc_broadcast",west];
};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du raubst den Laden aus, bleib innerhalb von 5 Metern (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker%1", _rndmrk];
   _Pos = position player; 
   _marker = createMarker [_mrkstring, _Pos]; 
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!Achtung! >>> Tankstellenraub <<< !Achtung!";
   _marker setMarkerType "mil_warning";

   while{true} do
   {
      sleep 3.50;
      _cP = _cP + 0.01;
      _progress progressSetPosition _cP;
      _pgText ctrlSetText format["Du raubst den Laden aus, bleib innerhalb von 5 Metern (%1%2)...",round(_cP * 100),"%"];
	  
      if(_cP >= 1 OR !alive _robber) exitWith {};
      if(_robber distance _shop > 5.1) exitWith { };
	  if((_robber getVariable["restrained",false])) exitWith {};
	  if(life_istazed) exitWith {} ;
	  if(life_interrupted) exitWith {};
   };
   // [[getPlayerUID _robber,name _robber,"50"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;
   if!(alive _robber) exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; 5 cutText ["","PLAIN"];};
   if(_robber distance _shop > 5.1) exitWith { deleteMarker _marker; _shop switchMove ""; hint "Du bist zu weit weg, der Raub ist gescheitert!"; 5 cutText ["","PLAIN"]; _rip = false; [getPlayerUID _robber,name _robber,"50"] remoteExec ["noaim_fnc_wantedAdd",2]; };
   if(_robber getVariable "restrained") exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; hint "Du wurdest festgenommen!"; 5 cutText ["","PLAIN"]; [getPlayerUID _robber,name _robber,"50"] remoteExec ["noaim_fnc_wantedAdd",2]; };
   if(life_istazed) exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; hint "Du wurdest getazert!"; 5 cutText ["","PLAIN"];};
   
   5 cutText ["","PLAIN"];
   titleText[format["Du hast €%1 erbeutet, flieh so schnell du kannst!",[_kassa] call noaim_fnc_numberText],"PLAIN"];
   deleteMarker _marker;
   life_znorak = life_znorak + _kassa;

   _rip = false;
   life_use_atm_2 = false;
   sleep (30 + random(180));
   life_use_atm_2 = true;
   [getPlayerUID _robber,name _robber,"211"] remoteExec ["noaim_fnc_wantedAdd",2];
  // [[getPlayerUID _robber,name _robber,"211"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
   _data = missionNamespace getVariable "Shop_Prof";
   _addExpAmount = 50;
   _addExpAmount = _addExpAmount + (5 * (_data select 0));
   ["Shop_Prof",_AddExpAmount] call noaim_fnc_addExp;
  // [[0,format["Sie erhalten %1 XP fuer das Ausrauben einer Ladenkasse.", _addExpAmount]],"noaim_fnc_broadcast",player,false] spawn noaim_fnc_TRY;
   [0,format["Sie erhalten %1 XP fuer das Ausrauben einer Ladenkasse.", _addExpAmount]] remoteExecCall ["noaim_fnc_broadcast",player];
};

sleep 600;
_action = _shop addAction["Laden Ausrauben",noaim_fnc_robShops];	
_shop switchMove "";