while {true} do 
{
	if ((driver vehicle player == player) ) then // Spieler ist der Fahrer des Fahrzeuges
	{
		_unit = vehicle player;
		_unit addEventHandler ["handleDamage", {_this call noaim_fnc_hVehDamage}]; // Wenn Schaden verursacht wird in der DB speichern // ACHTUNG muss auch beim reparieren aufgerufen werden
	};

};