/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_coplevel","_rang","_nameText","_playerData"];
_target = cursorTarget;

if(playerSide != civilian) exitWith
{
	hint "Du bist kein Zivilist!";
};

if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

if(license_civ_rebel) then
{
	_message = format["<img size='10' color='#FFFFFF' image='textures\marke\reb.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t>", name player, "Verbrecher Rebell", "Rebellen HQ"];
	life_IDShown = time + 120;
};
if(license_civ_mafia) then
{
	_message = format["<img size='10' color='#FFFFFF' image='textures\marke\maf.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t>", name player, "Verbrecher Mafia", "Mafia HQ"];
	life_IDShown = time + 120;
};
if(!license_civ_mafia && !license_civ_rebel) then 
{
	_message = format["<img size='10' color='#FFFFFF' image='textures\marke\civ.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t>", name player, "Zivilist", "Republik Altis"];
	life_IDShown = time + 120;
};

if(license_civ_mafia && license_civ_rebel) then 
{
	_message = format["<img size='10' color='#FFFFFF' image='textures\marke\maf.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t>", name player, "Verbrecher Mafiobel","Republik Stratis"];
	life_IDShown = time + 120
};

//[[player, _message],"noaim_fnc_civIDShown",_target,false] spawn noaim_fnc_LAST;
[player,_message] remoteExec ["noaim_fnc_civIDShown",_target];