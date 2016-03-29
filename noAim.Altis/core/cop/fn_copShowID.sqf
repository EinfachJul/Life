/*
Create : Black Lagoon
Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_coplevel","_rang"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du gehoerst nicht zur Polizei!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_coplevel = call zak_copstufe;

switch ( _coplevel ) do
{
	case 1: { _rang = "Polizeianwärter"; };
	case 2: { _rang = "Wachtmeister"; };
	case 3: { _rang = "Polizeiobermeister"; };
	case 4: { _rang = "Polizeihauptmeister"; };
	case 5: { _rang = "Polizeikommissar"; };
	case 6: { _rang = "Polizeioberkommissar"; };
	case 7: { _rang = "Polizeihauptkommissar"; };
	case 8: { _rang = "Polizeirat"; };
	case 9: { _rang = "Polizeioberrat"; };
	case 10: { _rang = "Polizeidirektor"; };
	case 11: { _rang = "Polizeipräsident"; };
	default {_rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\marke\cop.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Altis Polizei</t>", name player, _rang];

//[[player, _message],"noaim_fnc_civIDShown",_target,false] spawn noaim_fnc_TRY;
[player,_message] remoteExec ["noaim_fnc_civIDShown",_target];