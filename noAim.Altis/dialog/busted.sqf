#include "..\macros.hpp" 
private ["_text","_intro"];

_intro = [];
_text = [];
sleep 2;

switch (playerSide) do
{
	_text = [
		format ["<t align='left'>Du wurdest beim Combatlogging erwischt, dies ist auf unserem Server nicht erwuenscht.</t>"],
		format ["<t align='left'>Solltest du auf unserem Server noch einmal Sterben, dann wartest du entweder auf einen Sanitaeter oder Respawnst.</t>"],
		format ["<t align='left'>Waerend man tot ist, darf man das Spiel nicht ausschalten, ansonsten zaehlt dies als Combatlogging.</t>"],
		format ["<t align='left'>Dauerhaftes Combatlogging wird mit einem Ban bestraft.</t>"],
		format ["<t align='left'>Die welche vor einem Server Restart sterben, betrifft dies nicht. Dafuer koennt ihr nichts.</t>"]
	];
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;
        
format ["Hallo %1", name player] hintC _intro;
//playSound "s_welcome";