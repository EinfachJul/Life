/*
	Quick simple action that is only temp.
*/
private["_method"];
if(life_znorak < 500) then
{
	if(life_zgazzy < 500) exitWith {_method = 0;};
	_method = 2;
}
else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "Sie haben gerade keine 500 € bei sich oder auf ihrem Bankkonto."};
	case 1: {vehicle player setDamage 0; life_znorak = life_znorak - 500; hint "Sie haben ihr Fahrzeug fuer 500 € Repariert";};
	case 2: {vehicle player setDamage 0; life_zgazzy = life_zgazzy - 500; hint "Sie haben ihr Fahrzeug fuer €500 € Repariert";};
};