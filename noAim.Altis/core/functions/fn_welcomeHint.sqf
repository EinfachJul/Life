/*
	File: fn_welcome.sqf
	Author: Maximum

	Description:
	Shows the welcome message.
*/
disableSerialization;
createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_INTEXT = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_INTEXT2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\logo.paa' /></t><br /><br />";
_message = _message + "<t size='0.9' color='#009cff'>+</t><t size='0.9'> Version: Per Taste-M in der Changelog.</t><br />";
_message = _message + "<br />";
_message = _message + "<t size='0.7' color='#009cff'>-</t><t size='0.7'> Alle Changelogs befinden sich absofort in der Map Ansicht, per Taste-M.</t><br />";
_message = _message + "<br />";
_message = _message + "<t size='0.7' color='#009cff'>-</t><t size='0.7'> Bugs oder Ideen Posten gegen ingame Cash einfach auf feedback.noAimLife.de</t><br />";
_message = _message + "<br />";
_message = _message + "<t size='0.7' color='#009cff'>-</t><t size='0.7'> Feuerwehr oder Polizei Bewerbungen ins Forum auf www.noAimLife.de</t><br />";
_message = _message + "<br />";
_message = _message + "<t size='0.7' color='#009cff'>-</t><t size='0.7'> Support finden Sie auf ts.noAimLife.de</t><br />";
_message = _message + "<br /><br />";
_message = _message + "<t shadow='1' align='center' size='2.3' color='#009cff'>Viel Spaß!!</t><br />";

_INTEXT ctrlSetStructuredText (parseText _message);
_positionText1 = ctrlPosition _INTEXT;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _INTEXT;
_INTEXT ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_INTEXT ctrlcommit 0;
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_INTEXT2 ctrlSetFade 1;
_INTEXT2 ctrlCommit 0;