/*
Create : Black Lagoon
Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_medlevel","_rang"];

_target = cursorTarget;

if(playerSide != east) exitWith
{
	hint "Du gehoerst nicht zur Feuerwehr!";
};

if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

_medlevel = call zek_fwehrstufe;

switch ( _medlevel ) do
{
	case 1: { _rang = "Brandmeister-Anwärter"; };
	case 2: { _rang = "Brandmeister"; };
	case 3: { _rang = "Oberbrandmeister"; };
	case 4: { _rang = "Hauptbrandmeister"; };
	case 5: { _rang = "Brandinspektor"; };
	case 6: { _rang = "Brandoberinspektor"; };
	case 7: { _rang = "Brandamtmann"; };
	case 8: { _rang = "Brandrat"; };
	case 9: { _rang = "Oberbrandrat"; };
	case 10: { _rang = "Branddirektor"; };
	default {_rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\marke\fw.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Altis Feuerwehr</t>", name player, _rang];

//[[player, _message],"noaim_fnc_civIDShown",_target,false] spawn noaim_fnc_LAST;
[player,_message] remoteExec ["noaim_fnc_civIDShown",_target];