/*
Author: Timo
With no radio cant use Cellphone
*/
if("ItemRadio" in assignedItems player) then {
if(!(player getVariable "restrained") && !(animationState player in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"])) then {
createDialog "Life_my_smartphone"; 
} else {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Smartphone</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Kannst dein Handy nicht benutzen wenn du gefesselt bist oder dich ergeben hast.</t><br/>"];
	}
} else { 
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Kein Smartphone</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Du brauchst ein Smartphone um SMS zu schreiben. Kaufe ein neues beim Gemischtwarenhandel.</t><br/>"];
};