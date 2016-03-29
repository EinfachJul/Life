#include "..\..\macros.hpp"
private["_mode","_display","_rtitlez","_rtextz","_rlistz","_rnputz","_displayName","_rsetz","_select"];

disableSerialization;
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_display = findDisplay 4506;
_rtitlez = _display displayCtrl 4507;
_rtextz = _display displayCtrl 4508;
_rlistz = _display displayCtrl 4509;
ctrlEnable[887892,false];

_rnputz = [
	["Allgemeine Regeln","Allgemeine Regeln Seite 1",
	//=========================================================== BUGS n HACKS *DONE
	"<t size='0.7' color='#009cff'>1. Bugusing/Hacking/Cheating/Exploits</t><t size='0.7' color='#ffffff'>
	<br/>Bannbare Vergehen:
	<br/><br/>Das ausnutzen fehlerhafter Spielmechaniken, das Ausnutzen von Bugs sowie das verwenden von Hacks/Cheats ist strengstens verboten. Jegliche Bugs muessen den Administatoren mitgeteilt werden, damit diese behoben werden.			
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Hacking/Cheating
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Trolling/Stimmenverzerrer
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Fremdwerbung
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Nicht einhaltung der Serverregeln
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Unangebrachtes Verhalten und Schwere Kraftausdruecke.
	<br/>
	<br/>Folgende Aktivitaeten sind Exploits und werden nicht mit einem Kick, sondern mit einem Bann bestraft:
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Aus dem Gefaengnis zu Glitchen und nicht per Helikopter rausgeholt zu werden.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Unerlaubte Einsteigen in ein Fahrzeug welches gerade aufgeschlossen wurde wird als Ausnutzen fehlerhafter Spielmechaniken angesehen.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Verstecken im Schilf.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Schliessen von Schranken waehrend ein Fahrzeug sich dieser naehert.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Spieler toeten mit Platzierbaren gegenstaenden z.B. Nagelband, Mauer, Schranke, usw.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Aktiv durch eine Wand schiessen um jemanden zu toeten ist verboten. Durch ein Fenster schiessen ist ok. (egal ob Holz-, Metall- oder Steinwaende)
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Selbstmord um Rollenspiel aus dem Weg zu gehen. -> Aus der Gefangenschaft, Festnahme, dem Verhoer oder Tasern entkommen. Wenn die Logs zeigen, dass du festgenommen wurdest und kurz danach getrennt bist, wirst du gebannt.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Duplizieren von Gegenstaenden und Geld. Wenn dir jemand ohne Grund eine unglaublich hohe Summe an Geld schickt, benachrichtige SOFORT einen Admin und transferiere das Geld an einen Admin. Befolge diese Schritte so schnell wie moeglich, da die Gefahr besteht gebannt zu werden, falls ein Admin dich mit so viel Geld sieht!
	<br/><t size='0.7' color='#ff0000'> 9. </t><t size='0.7' color='#ffffff'>Nutzen von offensichtlich gehackten Items. Wenn ein Hacker ins Spiel kommt und ein Item spawnt, dass es so nicht gibt, benutze es nicht!. Benachrichtige einen Admin und entferne dich.
	<br/><t size='0.7' color='#ff0000'> 10. </t><t size='0.7' color='#ffffff'>Ausnutzen von nicht so gewollten Spielmechaniken und Bugs zum eigenen Vorteil. Verdoppelt sich z.B eine Waffe oder ein Anzug? Lass das Zeug liegen und hau ab. Wenn ein Admin dich erwischt: Bann.
	<br/><t size='0.7' color='#ff0000'> 11. </t><t size='0.7' color='#ffffff'>Das Aussteigen oder Einsteigen aus Fahrzeugen wenn man gefesselt ist strengstens untersagt! Es kann und wird mit einem Ban bestraft.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>2. Roleplay</t><t size='0.7' color='#ffffff'>
	<br/>Altis Life ist ein Rollenspiel und somit lieg uns das Roleplay besonders am Herzen. Alle Interaktionen zwischen Spielern muessen mit Roleplay begruendet werden.
	<br/>Dies beinhaltet, dass man sich eine Figur mit Rolle, Charakter und Geschichte ausdenkt und diesen gewissenhaft nachgeht!<br/>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Das eigene und das Leben anderer sollte demnach weitgehend verschont bleiben!
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Das Trollen unterlaesst sonst wird dies vom Adminteam dementsprechend geahndet.
	<br/>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Wenn ein Feuergefecht im Rahmen des RP 10 Minuten lang unterbrochen wurde, muss das RP (im Hinblick auf das Feuergefecht) neu gestartet werden.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Wenn eine RP-Situation im Gange ist, darf/kann man sich als dritte Partei nur einmischen, wenn dies Angekuendigt wurde.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Der Start eines Rollenspiels wird definiert durch eine deutliche Mitteilung durch Direkte Kommunikation (Sprache oder Schrift) oder durch eine SMS.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Wenn man vor einem Restart in gewahrsam der Polizei ist, muss man sich nach dem Restart im Pygos oder Kavala HQ stellen.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Informationen, welche man durch das Teamspeak und/oder einen Stream erhaelt, duerfen nicht genutzt werden.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Sirene(F) = keine RP eroeffnung, Jaulen (Shift+F) = keine RP eroeffnung sondern ein hinweis anzuhalten, Warnsirene (SPRACHE)(ALT+F) eroeffnet ein RP!
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Es sollte jedem die Moeglichkeit gegeben werden, sein Leben mittels Rollenspiel zu retten. Die Toetung eines Spielers sollte dabei der letzte Ausweg sein!
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Jeder sollte sich die Zeit nehmen und nachdenken, was er dem Gegenueber mitteilen moechte.
	<br/><t size='0.7' color='#ff0000'> 9. </t><t size='0.7' color='#ffffff'>Aussagen wie z.B. die Folgenden sind Verboten: Anhalten/stehen bleiben sonst Tod! oder ueberfall rufen, dann jemanden niederschlagen und ausrauben.
	<br/><t size='0.7' color='#ff0000'> 10. </t><t size='0.7' color='#ffffff'>Wer meint, kein anstaendiges RP zu fuehren, bekommt einen Bann und kann den Server von aussen betrachten.
	<br/><t size='0.7' color='#ff0000'> 11. </t><t size='0.7' color='#ffffff'>Fahrzeuge duerfen nur eingeparkt werden, wenn sie nicht in einer RP-Situation involviert waren o. die RP-Situation beendet ist.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>3. New-Life Regel</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Sobald eine Person stirbt kann sie von einem Medic wiederbelebt werden. Achtung: Der Medic darf erst in eine Situation eingreifen, wenn keine Gefahr mehr fuer ihn besteht.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Wiederbelebte Personen MUESSEN ZWINGEND zusammen mit dem Medic zum naechsten Krankenhaus fahren. Verweigert die wiederbelebte Person dies, zaehlt dies als New-Life Regelbruch.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Jede wiederbelebte Person verschwindet jedoch nicht von der Wanted-Liste. Polizisten duerfen die wiederbelebte Personen nicht direkt festnehmen. Auch das Krankenhauscamping ist untersagt. Wenn man wiederbelebt wurde oder respawned ist darf man NICHT mehr in die vorherige Kampfsituation eingreifen. Man muss mind. 1 Kilometer vom Ort des Geschehens entfernt sein.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Wenn die Kampfsituation vorbei ist darf man erst nach 30 Minuten zum Ort des Geschehens zurueckkehren, darf aber nicht mehr an Folgesituationen teilnehmen z.B.: Wenn man waehrend eines Bankueberfalls stirbt darf man danach nicht helfen das Gold zu verkaufen.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Bei Tot sind deine Vergehen vergessen, andersrum darfst du aber auch keine Rache ausueben. Sprich ohne RP dein Moerder umbringen.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Wenn du Opfer von RDM wirst, gilt die NLR nicht.
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Wenn du durch einen Autounfall Stirbst, dann gilt die NLR nicht.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Wenn du Selbstmord begehst um dem Roleplay zu entkommen, gilt die NLR nicht. Es ist VERBOTEN und fuehrt zu einem ban.
	<br/><t size='0.7' color='#ff0000'> 9. </t><t size='0.7' color='#ffffff'>Sollte ein Polizist in Kavala sterben, darf er in Kavala Spawnen. Dieser darf sich nur in der Safezone vom Marktplatz aufhalten und nicht vor den 15 Minuten verlassen. EGAL WARUM!
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>4. Combatlog/Gearsave/Lobbyhopping</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Auf unserem Server gibt es ein Taxi. Somit ist das Lobbyhopping, also das Ausloggen in die Lobby um sich neu zuspawnen verboten ausser:
	<br/>Die Person befindet sich nicht in einer RP-Situation, Polizisten Muessen sich in einem HQ befinden wenn sie Lobbyhopping machen wollen.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Das Spiel beenden ohne die 20 Sekunden Auslogzeit abzuwarten ist Combatlog.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Das Spiel waerend des todes zu beenden ist Combatlog.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Wenn man Stirbt und nicht Wiederbelebt wird, darf man das Spiel nicht ausmachen ansonsten ist es Combatlog.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Wenn man Verhaftet ist darf man das Spiel nicht ausmachen ansonsten ist es Combatlog.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Wer mit der Combatlog Uniform rumrennt steht im verdacht des Combatlogs. Dies kann zu einem Ban fuehren.
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Solltet ihr denken ihr seit unschuldig und wollt euer Geld wieder, muesst ihr ein Beweisvideo vorlegen.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Gearsave durch das Trennen der Internetverbindung, Taskmanager oder so mit absicht zu bewirken wird als Combatlogging gewaertet.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>5. Random/Vehicle Deathmatch (RDM/VDM)</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Das Toeten von Personen ohne RP-Grund ist strengstens verboten. 
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Das absichtliche Kaputtrammen von Fahrzeugen ist ebenfalls verboten Ausgenommen von letzterem sind gepanzerte Fahrzeuge, sprich Ifrit, Strider, Hunter, Hemtt oder Tempest diese duerfen sich untereinander rammen.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Wenn du im Kreuzfeuer einer Schiesserei Anderer getoetet wirst, ist das kein RDM.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Jemanden toeten um sich und andere gegen eine offensichtliche Bedrohung zu schuetzen ist kein RDM. z.B.: Wenn jemand anderes RDM betreibt.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Jemanden erschiessen ohne ihm eine ausreichende Reaktionszeit zu gewaehren (z.B bei einem ueberfall) ist RDM.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Wenn ein Helikopter ueber einer Kampfzone Schwebeflug macht, muessen Warnschuesse auf ihn abgegeben werden. Jemanden im Helikopter ohne Warnschuesse zu toeten ist RDM. Ausser es ist eindeutig, dass es ein Feindlicher Helikopter ist. z.B. jemand ist vom Feind ausgestiegen oder es wird von dem Helikopter geschossen.
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Jemanden erschiessen, wenn er verhaftet ist, ist RDM. Auch wenn ein RP laeuft.(Geiselnehmer duerfen ihre Geilsel erschiessen, wenn es notwendig ist.)
	<br/>
	<br/><br/>Von Fall zu Fall kann die Strafe unterschiedlich ausfallen!
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>6. Beleidigungen/Provokation</t><t size='0.7' color='#ffffff'>
	<br/>Jegliche Provokation im TS³ oder Ingame Chat sind untersagt. Beleidigungen sind grundsaetzlich verboten. Rassistische,persoenlich verletzende,diskriminierende Beleidigungen,ethnische Verunglipfung so wie auch rechtsextreme Parolen und Namen auf dem Server sind untersagt und werden mit einem Ban bestraft.
	<br/>Achtung: Wenn zu einem Ueberfall kommt darf ein schorferer Umgangston gewaehlt werden.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>7. Safe Zones</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>In Markierten Gruenen Safezones sowie nicht Markierten Safezones (siehe 4) ist das Ausrauben oder Toten von Spielern, sowie das Aufbrechen von Fahrzeugen oder das Schiessen verboten.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Rote Safezones wird nur bei eine Bereits bestehenden RP aufgehoben, sonst gelten hier die gleichen Regeln wie bei Gruenen Safezones. Nicht involvierte Spieler sollten verschont bleiben.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Werend einem Gefecht darf man nicht in oder aus einer Safezone Schiessen.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Nicht Markierte Safezones: Alle Polizei HQ's (dort gilt die Regel siehe 5), Feuerwehr Stationen, Krankenhaeuser, RebellenHQ, Mafia Zone, Apfelplantagen, Alle Spawnstaedte.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Polizei HQ Safezones sind absolute Safe Zones (Ausgenommen sind Checkpoints). Das bedeutet, dass dort keine Waffengewalt seitens der Zivilisten angewendet werden darf, es sei denn ein Angehoeriger wird dort festgehalten dieser darf mit Waffengewalt befreit werden. 
	<br/>
	<br/>Ein Bruch dieser Regel kann mit einem Ban bestraft werden.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>8. illegale Zonen</t><t size='0.7' color='#ffffff'>
	<br/>Mafia Zone, Rebellen HQ, Tankstellen die Ausgeraubt werden, Drogenhaendler, Tabakhaendler, Drogen Felder sowie Verarbeiter, Ganghideouts welche eingenommen wurden.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>9. Teamspeak3/Kommunikation</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Teamspeak3 Infos duerfen fuer das Ingame-RP nicht verwendet werden. Ueberfalle ueber den TS sind nichtig. Das absichtliche Preisgeben von Teamspeak³ Infos, damit diese nicht mehr verwendet werden duerfen, ist ebenfalls verboten.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Das Teamspeak ist nicht ohne Grund in verschiedene Channel unterteilt! Die Polizei oder Feuerwehr bleibet in den Dienst Channel!
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Zivilisten duerfen nicht in den Channel der Cops kommen und deren Bewegungen und Aktivitaeten abhoeren. Werdet ihr erwischt werdet ihr aus dem Channel entfernt. Wiederholtes Vergehen resultiert mit der Entfernung aus dem Spiel und dem TS.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Kommunikation darf man als Zivilist jemanden nur abnehmen, wenn man ihn als Geisel nehmen moechte
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Keine Musik oder Micspam im Sidechat!
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Spamming in jeglichen Channels ist verboten.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>10. Support/Modbuero</t><t size='0.7' color='#ffffff'>
	<br/>Bevor Ihr im Falle eines Konflikts ins Modbuero geht, muesst Ihr erst einmal mit der Gegenseite sprechen. Die Gegenseite darf dies nicht verweigern, sofern Ihr nicht ausfallend werdet.
	<br/>Es waere sinnvoll wenn ihr Beweise im Vorraus mitbringt wie z.B. Videos oder Screenshots zumindest ein Beweis.
	<br/>Supportzeiten sind von 14-24 Uhr, dies gilt nicht fuer Samstag oder Sonntag (wenn ein Supporter erreichbar ist)
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>11. Anheben von Fahrzeugen mit dem Helikopter/Aufnehmen von Fahrzeugen mit Transportfahrzeugen</t><t size='0.7' color='#ffffff'>
	<br/>Fahrzeuge duerfen erst angehoben/abstransportiert werden, wenn ihr den Schluessel zu diesem Fahrzeug besitzt. In Safezones ist dies verboten.
	<br/>
	<br/>===========================================================
	<br/>
	<br/></t><t size='0.7' color='#009cff'>12. Herrauschiessen von Personen aus Fahrzeugen</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Das Herrauschiessen von Piloten aus Helikoptern die in der Luft sind ist verboten. Die Besatzung falls sie aggressiv gegen andere Einheiten agiert (z.B schiesst) darf herausgeschossen werden somit auch der Pilot.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Sollte sich der Helikopter im Hovering modus befinden gilt die Regel (siehe 1) nicht mehr, und der Pilot darf beschossen werden. Falls dieser nach Warnschuessen nicht abdreht.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Ein Fahrer darf nur aus einem Landfahrzeug geschossen werden, wenn dieses Fahrzeug Disabled wurde. (Das Fahren auf 2 Reifen bedeutet bereits Disabled.)
	<br/>
	</t>
	"],
	
	["Fahrzeug Regeln","Fahrzeug Regeln Seite",
	"<t size='0.7' color='#009cff'>Landfahrzeuge:</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Mit dem Fahrzeug darf man zu keiner Zeit jemanden ueberfahren. Es kann immer Unfaelle geben, aber dies entbindet euch nicht von der Regel.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Mit Absicht vor ein Fahrzeug springen um zu sterben.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Dauernd versuchen in fremde Fahrzeuge einzusteigen um zu klauen.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Mehrere Fahrzeuge aufeinmal kaufen um Explosionen zu verursachen.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Stehlen von Fahrzeugen aller Art, wenn der Besitzer nicht ausreichend Zeit hatte, um abzuschliessen. Wenn jemand aussteigt, nicht abschliesst und sich vom Fahrzeug entfernt, ist er selber Schuld, wenn ihr aber direkt nach dem der Fahrer ausgestiegen ist, einsteigt ohne ihm eine Chance zu geben abzuschliessen, ist dies ein Regelbruch.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Die folgenden Geschwindigkeitsbeschraenkungen sollten von der Polizei, zur Sicherheit aller, durchgesetzt werden.
	<br/>An dem Kavala oder Pygros Marktplatz: Maximal 30 km/h
	<br/>In Staedten: Maximal 50 km/h
	<br/><br/>
	<br/><t size='0.7' color='#009cff'>Luftfahrt:</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Mit Absicht in irgendwas hereinrammen um eine Explosion herbeizufuehren. Egal ob anderer Helikopter, Fahrzeug, Gebaeude oder Spieler.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Ein RP mit einem Helikopter kann nur per SMS gestartet werden.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Stehlen von Helikoptern, wenn der Besitzer nicht ausreichend Zeit hatte, um abzuschliessen. Wenn jemand landet, nicht abschliesst und sich entfernt, ist er selber Schuld, wenn ihr aber direkt nach dem Landen einsteigt ohne dem Piloten eine Chance zu geben, ist dies ein Regelbruch.
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Angehaengte Fahrzeuge duerfen nicht als Wurfgeschoss, Ramme oder Waffe genutz werden. Nur der Transport ist erlaubt.
	<br/><br/>Folgendes wird vom Bussgeld Katalog der Polizei geregelt.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Helikopter duerfen nicht auf Strassen landen oder Fahrzeug Parkplaetzen.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Unter 300m Hoehe ueber eine Stadt fliegen. Zum einen ist es illegal, zum anderen riskiert ihr dadurch mehr, in ein Gebaeude zu crashen anstatt irgendetwas zu erreichen.
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Helikopter duerfen nicht ueber einer Stadt schweben. Nur Polizisten duerfen dies, wenn eine Polizei-Einsatz im Gange ist.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Polizisten duerfen jegliche Landeanfluege der Zivilisten fuer eine kurze Zeitspanne verbieten.
	<br/><br/>
	<br/><t size='0.7' color='#009cff'>Boote:</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Wiederholtes Pushing von Booten ohne Erlaubnis.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Pushing von Booten um jemanden zu toeten. Das ist kein RP!
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Taucher oder Schwimmer mit Absicht ueberfahren.
	</t>
	"],
	
	["Zivilisten Regeln","Zivilisten Regeln Seite",
	"<t size='0.7' color='#009cff'>1. Ueberfall</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Ein Ueberfall auf Fahrzeuge kann per SMS oder per direkte Kommunikation angekuendigt werden. Der Beschuss auf Fahrzeuge gilt ebenfalls als Ueberfall.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Ein Ueberfall auf einen Helikopter muss per SMS angekuendigt werde, direkte Kommunikation ist verboten. Warnschuesse auf den Heli sind ebenfalls eine Ueberfallankuendigung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Person die Ueberfallen wird darf sich wenn das RP es zulaesst mit Waffengewalt gegen die Raeuber wehren. Falls sie dies tut duerfen die Raeuber zurueck schiessen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Raeuber duerfen zuerst schiessen falls:
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Opfer auch nach 10 Sekunden den Forderungen der Raeuber nicht nachkommen
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Opfer mit geschulterer Waffe aus dem Fahrzeug steigen und auf die Raeuber zielen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Sanitaeter oder Mitglieder ALAC duerfen Nie ueberfallen, entfuehrt oder beklaut werden. Auch das Entweden des Fahrzeuges ist verboten
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Sobald euch die Kommunikationsmoeglichkeiten entwednet wurden (Telefon etc.) Muesst ihr euch im TS muten und duerft mit euren Kamaraden oder Polizisten keinen Kontakt aufnehmen.
	<br/>
	<br/><t size='0.7' color='#009cff'>2. Disablen/Fahrzeuge ausser Gefecht setzen</t><t size='0.7' color='#ffffff'>
	<br/>Fahrzeuge duerfen ohne Ankuendigung ausser Gefecht gesetzt werden. Jedoch duerfen die Personen, die sich innerhalb des beschossenen Fahrzeuges befinden nicht getoetet werden!
	<br/>Falls dies passiert ist dies ein RDM. Falls das Fahrzeug explodiert ist dies ebenfalls ein RDM. Das Fahrzeug muss ersetzt werden. Dies gilt nicht fuer Helikopter.
	<br/>
	<br/><t size='0.7' color='#009cff'>3. Mutwillige Zerstoerung</t><t size='0.7' color='#ffffff'>
	<br/>Fahrzeuge duerfen niemals mutwillig zerstoert werden. Falls sie jedoch in einer RP-Situation eine Behinderung darstellen (Deckung,Strassensperre etc.) duerfen die Fahrzeuge zerstoert werden. Gleiches gilt bei Fahrzeugdiebstahl.
	<br/>
	<br/><t size='0.7' color='#009cff'>4. Wann darf ich schiessen?</t><t size='0.7' color='#ffffff'>
	<br/>Ich bin erst dann berechtigt auf eine Person zu schiessen, wenn ich von ihr unmittelbar bedroht werde. Der Beschuss auf unbewaffnete oder gefesselte Personen ist erst erlaubt,
	<br/>wenn dies in einer RP-Situation integriert ist (z.B Geiselnahme).
	<br/>
	<br/><t size='0.7' color='#009cff'>5.Welche Waffen sind legal?</t><t size='0.7' color='#ffffff'>
	<br/>Rook,Sting,Vermin,SDAR,P07 fuer den Besitz ist ein Waffenschein erforderlich. Alle anderen Waffen sind illegal und koennen von der Polizei abgenommen werden.
	<br/>
	<br/><t size='0.7' color='#009cff'>6. Welche Fahrzeuge sind illegal?</t><t size='0.7' color='#ffffff'>
	<br/>Offroad HMG,Strider,Hunter,Ifrit,Alle Polizei-,Medic- und Feuerwehr Fahrzeuge.
	<br/>
	<br/><t size='0.7' color='#009cff'>7. Welche Gegenstaende sind illegal?</t><t size='0.7' color='#ffffff'>
	<br/>Drogen,Polizeiutensilien,Schildkroeten,Zigarren,Organe,C4-Sprengstoff
	<br/>
	<br/><t size='0.7' color='#009cff'>8. Geislnahmen</t><t size='0.7' color='#ffffff'>
	<br/>Eine Geiselnahme sollte immer einen RP-Hintergrund, es duerfen nicht mehr als 3 Millionen € gefordert werden!
	<br/>Die Geiselnehmer duerfen von der Polizei auch Ausruestung fordern. Es duerfen keine Wagenladungen von Ausruestungsgestaenden gefordert werden, ebenso ist es euch untersagt mit der Geisel zu einem Shop zu fahren um euch dort auszuruesten.
	<br/>
	<br/><t size='0.7' color='#009cff'>9. Fahrzeuge/Flugzeuge und Haeuser aufbrechen</t><t size='0.7' color='#ffffff'>
	<br/>Wenn euer Haus, euer Fahrzeug bzw. euer Flugzeug aufgebrochen wird, duerft ihr euch mit Waffengewalt gegen die Einbrecher wehren. RP ist gewuenscht, wird aber nicht vorrausgesetz.
	<br/>Achtung: Euer Clan darf euch nur bei einer Ankuendigung unterstuetzen.
	<br/>
	<br/><t size='0.7' color='#009cff'>10. Bankraub </t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Ein Bankraub darf erst gestartet, wenn mind. sieben Polizisten (Anwaerter werden nicht mitgezaehlt) online sind.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Mitglieder einer Gang duerfen nur in einem Bankraub pro Serverperiode beteiligt sein.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Das starten der Staatsbank ohne den Hintergrund diese ernsthaft Auszurauben ist verboten!
	<br/>
	<br/>
	<br/><t size='0.7' color='#009cff'>11. Gepanzerte Fahrzeuge</t><t size='0.7' color='#ffffff'>
	<br/>Gepanzerte Fahrzeuge duerfen an der Kavala Garage aus/eingeparkt werden. Jedoch ist das Fahren durch die Savezone (rote gestrichelte Flaeche) strengstes verboten!!!
	<br/>
	<br/><t size='0.7' color='#009cff'>12. Fahrzeugdiebstahl </t><t size='0.7' color='#ffffff'>
	<br/>Verlassene Fahrzeuge duerfen immer ohne Ankuendigung verkauft werden. Falls ihr ein Fahrzeug in einer RP-Situation erbeutet, duerft ihr vom Besitzer Maximal 10% des urspruenglichen Kaufpreises fordern. Es gelten die nicht Donater Preise. Ihr muesst den Besitzer oder ein Mitglied seines Clanes anschreiben. Falls dieser eurer Forderung nicht nachkommt, duerft ihr das Fahrzeug zerstoeren verkaufen oder zum Eigengebrauch bis zur naechsten Serverperiode nutzen. Das Fordern von Ausruestung bzw. Geisel gegen Fahrzeug ist verboten! Diese Regel gilt jedoch nicht fuer verlassene Fahrzeuge in der Safezone hier ist jegliche Art von Zerstoerung/Diebstahl etc... strengstens verboten.
	<br/>
	<br/><t size='0.7' color='#009cff'>13. Ausweis</t><t size='0.7' color='#ffffff'>
	<br/>Zivilisten muessen Medics/ALAC´s/Polizisten immer den Ausweis zeigen (Sofern sie diesen verlangen). Zivilisten unter sich koennen dies in RP-Situation tun muessen nicht.
	<br/>
	<br/><t size='0.7' color='#009cff'>14. Donator Artikel</t><t size='0.7' color='#ffffff'>
	<br/>Donator Artikel duerfen nicht verkauft oder weitergegeben werden. Lediglich in einer RP-Situation duerfen Donator Artikel gefordert werden. Wer Donatorartikel ausserhalb des RP´s weitergibt muss einem Permanenten Ausschluss rechen.
	<br/>
	<br/><t size='0.7' color='#009cff'>15. Clankriege und Kopfgeld</t><t size='0.7' color='#ffffff'>
	<br/>Clankriege muessen mit einer RP-Begruendung im Forum angemeldet werden. Achtung: Beide Parteien muessen dem Krieg zustimmen! Wenn ihr Kopfgeld auf eine Person aussetzen wollt, muesst ihr dies im Support bei einem Admin ankuendigen. Dieser akzeptiert die Kopfgeldforderung o. lehnt sie ab. Falls er sie akzeptiert wird eine Administatorennachricht abgeschickt, die die Kopfgeldankuendigung beinhaltet. Das Einnehmen von einer Stadt, muss ebenfalls im Forum angemeldet werden und mit einem Admin besprochen werden.
	<br/>Zu den Angaben:
	<br/>Wann soll das Event starten, Wieviele machen mit maximal 2 Gangs / RP Begruendung / Euer Ziel
	<br/>Wenn in diesem Falle ein Admin zustimmt, wird eine Stunde vor diesem Event alle 15 Minuten eine Admin Nachricht kommen wo dieses Event angekuendigt wird. Die Polizei muss die Stadt evakuieren der Spieler der sich nicht daran haelt darf von der Polizei festgenommen und eingesperrt werden. Sollten sich immer noch Spieler in der RP-Zone aufhalte, macht dieser automatisch mit.
	
	<br/><t size='0.7' color='#009cff'>16. Regeln gegen Feuerwehr/Polizei</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr darf zu keiner Zeit beklaut, beraubt oder getoetet werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Zugreifen auf Rucksaecke der Polizei ist verboten.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Fahrzeuge der Feuerwehr duerfen zu keiner Zeit geklaut werden.
	</t>
	"],
	
	
	["Gang Regeln","Gang Regeln",
	"<t size='0.7' color='#009cff'>Allgemeine Gangregeln:</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Jedes Gangmitglied einer Gang muss ein Gangtag vor seinem Namen tragen.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Gangmitglieder ohne Gangtag duerfen nicht an RP`s der Gang teilnehmen, ausser diese wurden angekuendigt (Zivil: Sidechat, Polizei: SMS, Feuerwehr: SMS oder ueber Altis News)
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Wenn zwei oder mehr Gangs zusammenarbeiten, muss es dem Gegenueber (Feind) mitgeteilt werden. (siehe 2)
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Sobald ein RP bei einem Ganghideout im gange ist, darf auch von ausserhalb der Roten markierung geschossen werden. (Solang man teil der Gang ist, welche teil des RPs ist)
	<br/>
	<br/>
	<br/><t size='0.7' color='#009cff'>Gang Kriege:</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Jede Gang darf nur alle sieben Tage einen Gangkrieg ausrufen.
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Es darf nur gegen eine andere Gang Krieg gefuehrt werden.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Andere Gangs duerfen sich nicht einmischen, ausser diese sind verbuendet (muss im Forum im vorraus mitgeteilt werden)
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Beide Gangs muessen mit diesem Krieg einverstanden sein.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Es darf niemand in der Safezone erschossen werden, ausser es wurde vorher ein RP gestartet. Der Gangkrieg zaehlt hierbei nicht als RP start.
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Gangkriege duerfen maximal 24 Stunden andauern.
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Gangkriege muessen im Forum in den vorgesehenen Thema angekuendigt werden.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>Zu Punkt 7. muessen abgesprochene Regeln niedergeschrieben sein.
	</t>
	"],
	
	
	["Polizei Regeln","Polizei Regeln",
	"<t size='0.7' color='#009cff'>Oberstes Gebot: Erst reden, dann tazern, dann schiessen.</t><t size='0.7' color='#ffffff'>
	
	<br/>Jeder Polizist ist angehalten die Regeln zu kennen und sich an diese zu halten, ein verstoss zieht eine Bestrafung nach sich.
	<br/>
	<br/><t size='0.7' color='#ff0000'> 1. </t><t size='0.7' color='#ffffff'>Jeder muss einen Erstehilfekasten und mindestens ein Werkzeugskaesten mit sich fuehren
	<br/><t size='0.7' color='#ff0000'> 2. </t><t size='0.7' color='#ffffff'>Der Verbandskasten darf nur verwendet werden wenn sich kein Feuerwehrmann auf dem Server befindet.
	<br/><t size='0.7' color='#ff0000'> 3. </t><t size='0.7' color='#ffffff'>Ein Polizist darf NIEMALS einem Zivilisten Waffen oder andere Polizeiausruestungs Gegenstaende geben(ausgenommen Essen und Trinken)
	<br/><t size='0.7' color='#ff0000'> 4. </t><t size='0.7' color='#ffffff'>Als Polizist muss das Gang-Tag entfernt werden! und ein anderer name getragen werden. Vorname und Nachname (bitte einen ausdenken, nicht euren aus dem RL) Spawnt man mit Soldaten Equiptment, hat man sich sofort umzukleiden ueber einen der Loadout Ausruestung schalter.
	<br/><t size='0.7' color='#ff0000'> 5. </t><t size='0.7' color='#ffffff'>Jeder Notruf muss von der Polizei beantwortet werden und auf der Karte makiert werden, kurze Meldungen duerfen auch direkt von der Streife vor Ort angenommen werden
	<br/><t size='0.7' color='#ff0000'> 6. </t><t size='0.7' color='#ffffff'>Im TeamSpeak sollte man sich vernuenftig benehmen und auf die Lautstaerke im Channel achten, besonders bei einem Einsatz (Pushtotalk waere sinnvoll)
	<br/><t size='0.7' color='#ff0000'> 7. </t><t size='0.7' color='#ffffff'>Bei Dienstbeginn / schluss immer im Spiel an und ab melden.
	<br/><t size='0.7' color='#ff0000'> 8. </t><t size='0.7' color='#ffffff'>AFK im Dienst ist nur fuer 5-10 min erlaubt, bei laengerer auszeit sollte man aus dem Server ausloggen!
	<br/><t size='0.7' color='#ff0000'> 9. </t><t size='0.7' color='#ffffff'>Achte auf dein Verhalten im Spiel und im TeamSpeak gegenueber deinen Kollegen / innen
	<br/><t size='0.7' color='#ff0000'> 10. </t><t size='0.7' color='#ffffff'>Es ist Pflicht der Polizei, der Feuerwehr mitzuteilen wenn ein RP beendet ist oder der Feuerwehr zu antworten wenn sie schon nachgefragt haben!
	<br/><t size='0.7' color='#ff0000'> 11. </t><t size='0.7' color='#ffffff'>Der Verkauf von Polizei Equiptment an Zivilisten ist verboten.
	<br/><t size='0.7' color='#ff0000'> 12. </t><t size='0.7' color='#ffffff'>Es darf zu keiner zeit ueber die Fahndungsliste gesprochen werden und es darf auch keine auskunft gegeben werden. (Ausser man befindet sich in einem Verhoer)
	<br/><t size='0.7' color='#ff0000'> 13. </t><t size='0.7' color='#ffffff'>Fahrzeuge (eigene und von Kollegen) duerfen nur dann Beschlagnahmt werden wenn sie offen sind, wenn sie eine Gefahr darstellen oder wenn die Kollegen offline sind.
	<br/><t size='0.7' color='#ff0000'> 14. </t><t size='0.7' color='#ffffff'>Fahrzeuge duerfen waehrend eines laufendem RP´s nicht beschlagnahmt werden.
	<br/><t size='0.7' color='#ff0000'> 15. </t><t size='0.7' color='#ffffff'>Solltest du Probleme mit dem on kommen haben, oder in den Urlaub fahren so melde dich bitte ab!
	<br/><t size='0.7' color='#ff0000'> 16. </t><t size='0.7' color='#ffffff'>Sobald ein laufendes RP beendet ist, schreibe bitte der Feuerwehr welche Partei gewonnen hat.
	<br/>
	<br/><t size='0.7' color='#009cff'>1. Wann darf ich jemanden inhaftieren?</t><t size='0.7' color='#ffffff'>
	<br/>Inhaftiert werden darf eine Person erst, wenn sie mindestens drei Morde auf dem Konto hat, oder sich 3x hintereinander weigert, ein Ticket zu bezahlen. Achtung: Falls die Person gutes RP macht, muss sie nicht inhaftiert werden!. Dies liegt in eurem Ermessen, bedankt jedoch, dass eine lange Gefaengnisstrafe die Spieler veraergert und ihnen den Spielspass nimmt.
	<br/>
	<br/><t size='0.7' color='#009cff'>2. Wann darf ich einem unterrangigen Polizisten Waffen abgeben?</t><t size='0.7' color='#ffffff'>
	<br/>Bei einem grossen Einsatz darf der hoechstranginge Polizist entscheiden, ob er den niederrangigen Waffen gibt. Jedoch duerfen diese nur maximal 2 Raenge ueber ihm verfuegbar sein. 
	<br/>Beispiel: Nehmen wir man an, du bist Captain. Dann darfst du einem Rekruten nur Sergeant Waffen geben, einem Polizeimeister nur Lieutenant Waffen etc. nach dem Einsatz muessen die Waffen abgegeben werden.
	<br/>
	<br/><t size='0.7' color='#009cff'>3. Wann darf ich gepanzerte Fahrzeuge ausparken</t><t size='0.7' color='#ffffff'>
	<br/>Gepanzerte Fahrzeuge duerfen nur ausgeparkt werden, wenn unmittelbarer Beschuss droht und muessen mit mind. zwei Personen bemannt sein. Gepanzerte Fahrzeuge am Marktplatz sind unerwuenscht!
	<br/>
	<br/><t size='0.7' color='#009cff'>4. Bankraub</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Bei einem Bankraub darf jeder Polizist auf alle Personen schiessen, die am Bankraub beteiligt sind und sich in einem Kilometer Umkreis befinden. Der Polizist muss den Beschuss nicht ankuendigen!
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Helikopter, die ueber der Zentralbank fliegen, koennen gebeten werden, das Gebiet zu verlassen. Bei Verweigerung duerfen sie ausgeschaltet werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn die Zentralbank ausgeraubt wird, muessen alle polizeilichen Kraefte mobilisiert werden, um den Raub zu stoppen. (Ausnahme es besteht eine Geiselnahme, dann muss die Haelfte mobilisiert werden)
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Polizisten duerfen nicht blind in das Gebaeude feuern.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Jeder Zivilist der die Polizisten bei der Gefahrenvermeidung blockiert, kann als Komplize der Bankraeuber angesehen werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Polizisten duerfen beim Bankraub alle Fahrzeuge Zerstoeren(oder permanenent beschlagnahmen wenn der Rang es nicht ermoeglicht) wenn sie teil des RP's sind
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn der Bundesbankraub gestartet wurde, darf die Polizei nicht umloggen um an der Staatsbank teilzunehmen. Polizisten haben Land- und Luftfahrzeuge um zu diesem Einsatz zu kommen.
	<br/>
	<br/><t size='0.7' color='#009cff'>5. Fahrzeuge beschlagnahmen</t><t size='0.7' color='#ffffff'>
	<br/>Fahrzeuge duerfen erst beschlagnahmt werden, wenn die RP-Situation vorbei (Gefecht,Geiselnahme). Das Beschlagnahmen eigener Polizeifahrzeuge ist nur im Notfall gestattet.
	<br/>
	<br/><t size='0.7' color='#009cff'>6. Kommunikation</t><t size='0.7' color='#ffffff'>
	<br/>Bei Dienstantritt muss sich jeder Polizist auf dem Teamspeak³ befinden. Anweisungen des hoeherrangigen Polizisten sind zu befolgen!
	<br/>
	<br/><t size='0.7' color='#009cff'>7. Streifendienst</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Eine regulaere Polizeistreife besteht aus mind. 2 Polizeibeamten und einem Fahrzeug. Auf die Gegenseite Sicherung ist zu jedem Zeitpunkt zu achten.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Bei Trennung der Besatzung ist schnellstmoeglich eine Zusammenfuehrung zu unternehmen. Fuer eine Helikopterstreife muss mind. eine Bodenstreife aktiv sein.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Polizei darf keine Streife im oder nahe eines Mafia-/Rebellenstuetzpunktes machen.
	<br/>
	<br/><t size='0.7' color='#009cff'>8. Razzien</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Razzien duerfen nur auf Anweisung oder nach Ruecksprache mit dem HQ ausgefuehrt werden. Fuer die Durchfuehrung einer Razzia werden min. 4 Beamte benoetigt, wobei mind. einer den Rang Oberkomissar besitzen muss
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Fluechtet ein Krimineller in eine illegale Zone, so stellt dies keinen Grund fuer den Abrruch der Verfolgung dar.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Zivilfahnder duerfen sich jederzeit illegalen Zonen naehern und dort kurzzeitig aufhalten, aber keine Razzien durchfuehren oder Verdaechtigen dort auflauern.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn du als Polizist ein illegales Gebiet betreten willst, hole vorher Verstaerkung!
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Alle Zivilisten im bereich der Razzia, duerfen Festgenommen und durchsucht werden. Wenn nichts illegales gefunden wird, muesst ihr sie gehen lassen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn etwas illegales gefunden wird, werden die betroffenen mit zum Revier genommen und verhoert.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Toedliche Gewalt darf nur unter bestimmten Voraussetzungen eingesetzt werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Nach Sicherung des Gebiets haben sich die Polizisten wieder zu entfernen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Eine Razzia darf nicht innerhalb von 20 Minuten nach einer Razzia im selben Gebiet stattfinden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Verstaerkung darf gerufen werden, es duerfen aber keine Polizisten sein die bereits gestorben sind.
	<br/>
	<br/><t size='0.7' color='#009cff'>9. Hausdurchsuchungen</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Um eine Hausdurchsuchung durchzufuehren, muessen 3 Polizisten beteiligt sein, einer davon muss mindestens den Rang Oberkomissar sein.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn ein Straftaeter in ein Haus fluechtet darf die Polizei mit mindestens 2 Polizisten das Haus aufbrechen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Alle Zivilisten die eine Hausdurchsuchung stoeren, duerfen festgenommen werden. Wenn nichts illegales gefunden wird, muesst ihr sie gehen lassen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn etwas illegales gefunden wird, werden die betroffenen mit zum Revier genommen und verhoert.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Nach beendigung und Sicherung des Hauses muessen die Tueren geschlossen und das Gelaende verlassen werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Eine Hausdurchsuchung darf nicht innerhalb von 120 Minuten nach einer Hausdurchsuchung im selben Gebaeude stattfinden.<
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Eine Hausdurchsuchung darf nur durchgefuehrt werden wenn jemand auf der Fahndungsliste mit Mord oder Drogendelikten steht.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Der Besitzer eines Hauses muss von der Polizei verhaftet sein oder muss bei der Durchsuchung seines Hauses vorort sein.
	<br/>
	<br/><t size='0.7' color='#009cff'>10. EMP</t><t size='0.7' color='#ffffff'>
	<br/>Das EMP darf nur verwendet werden, wenn ein Helikopter, Strider, Ifrit, Hunter oder Lastwagen(Tempest/Hemtt) vor dem Polizeihelikopter fluechtet, und das fluechtende Flug-/Bodenfahrzeug muss mindestens 2 mal gewarnt werden. Achtung: Eine EMP Warnung bedeutet automatisch Schusserlaubnis fuer die Besatzung des fluechtenden Flug-/Bodenfahrzeugs.
	<br/>
	<br/><t size='0.7' color='#009cff'>11. Tasern</t><t size='0.7' color='#ffffff'>
	<br/>Das Tasern von Personen aus Fahrzeugen die sich bewegen ist verboten! Ausnahmen sind offene Fahrzeuge, sprich Karts und Quads. Personen die sich in stehenden Fahrzeugen befinden duerfen herrausgetasert werden.
	<br/>
	<br/><t size='0.7' color='#009cff'>12. Verkaufen von Fahrzeugen</t><t size='0.7' color='#ffffff'>
	<br/>Ihr duerft eure eigenen Fahrzeuge niemals verkaufen. Wer dies tut muss mit einem Permanenten Ban rechnen.
	<br/>
	<br/><t size='0.7' color='#009cff'>13. Anzahl an Polizisten / Member</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Wenn weniger als drei Polizisten online sind und du als Polizist gewhitelisted bist, musst du dich als Polizist einloggen. Du darfst in einem solchen Fall nicht als Zivilist spielen!
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Zu Anzahl an Polizisten zaehlt natuerlich auch das GSG9
	<br/>
	<br/><t size='0.7' color='#009cff'>14.Polizist am Marktplatz</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Es sollte sich immer ein Polizist am Marktplatz befinden! Da diese Angabe sehr RP gebunden und ungefaehrlich ist, sollte dies immer der niederrangigste Polizist uebernehmen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Ausgenommen, es sind acht Polizisten online und es findet ein Bankraub statt, dann sollten sieben zum Bankraub gehen und einer am Makrtplatz bleiben.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Richtig geparkte Fahrzeuge, sollten in ruhe gelassen werden.
	<br/>
	<br/><t size='0.7' color='#009cff'>15. Stadt Regeln</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Polizisten duerfen am Autohaendler anhalten, um sicherzustellen, dass dieser frei ist. Stehen dort Fahrzeuge rum, sollte die Feuerwehr benachrichtigt werden.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Polizisten duerfen nicht in der Stadt herumstehen oder rumtroedeln. (ausser Kavala/Pyrgos)
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Polizisten duerfen die Stadt auch in groesseren Mengen betreten, wenn es rebellische Aktivitaeten gibt. Sobald der Frieden in der Stadt wieder gesichert ist, haben die Polizisten das Gebiet zu raeumen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Der Ausnahmezustand darf zu keiner Zeit erklaert werden, dies wird im Forum von einem Owner wenn es eintritt mitgeteilt.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Polizei Reviere sind fuer Zivilisten verboten. Betreten dieser ohne Genehmigung ist nicht erlaubt. Sich in der naehe aufzuhalten, ist jedoch nicht verboten, solange die Zivilisten keinen Aufstand machen oder die Polizisten belaestigen.
	<br/>
	<br/><t size='0.7' color='#009cff'>16. Bussgeldkatalog</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Dreimaliges ablehnen von Bussgeldern, erlaubt die Inhaftierung des Zivilisten.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Insgesamt darf man bis zu 4 Vergehen mit inhaftieren haben. Hier kann sich der Straftaeter in hoehe seines Bussgeldes freikaufen. (Blitzer zaehlen nicht)
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Ab den 5x Vergehen mit inhaftierung kann man sich nicht mehr freikaufen und muss in den Knast. (Blitzer zaehlen nicht)
	<br/>
	<br/>Gefaengnis dauer: (Blitzer nicht einbegriffen)
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Bussgeld bis 1.000.000€: 5-10 Minuten Gefaengnis
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Bussgeld bis 2.500.000€: 10-15 Minuten Gefaengnis
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Bussgeld Ab 2.500.000€: 15-20 Minuten Gefaengnis
	<br/>Ab 15x Vergehen inhaftierung (Blitzer nicht einbegriffen) - 25 Minuten Gefaengnis
	<br/>
	<br/>Inhaftierungen sollten nur stattfinden, wenn Zivilisten eine Gefahr fuer sich oder andere sind.
	<br/>Du musst einem Zivilisten erlaeutern, warum er inhaftiert wird bevor du ihn ins Gefaengnis schickst.
	<br/>Wenn ein Zivilist auf der Fahndungsliste steht, darfst du ihn Festnehmen. Toete ihn nicht sofort, es sei denn toedliche Gewalt ist angebracht.
	<br/>Anwaelte muessen eine Anwaltszulassung haben, und duerfen keinen Mord auf der Fahndungsliste haben.
	<br/>
	<br/><t size='0.7' color='#009cff'>17. Strafen gegen Polizisten</t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Verteilung von Ausruestung an nicht authorisierte Personen. = 150.000
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Festhalten eines unschuldigen. (In Handschellen legen ohne legalen Grund) = 25.000
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Besitzen oder Fuehren von nicht registrierten Waffen (Rebellen-/Zivilwaffen) = Degradierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Toetung eines anderen Polizisten. (In vollem Bewusstsein / mit Absicht) = Suspendierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Toetung eines Zivilisten. (In vollem Bewusstsein / mit Absicht) = Suspendierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Belaestigung von anderen Polizisten. (Mobbing / Beleidigungen / Zerschiessen von Reifen usw.) = Degradierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Belaestigung von Zivilisten. (Mobbing / Beleidigungen usw.) = Degradierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Befehlsverweigerung = 100.000 oder Degradierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Dem Dienstrang unangemessene Kleidung/Fahrzeug. (mutwillig) = Verwarnung in Dienstakte + Degradierung.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Durchsuchen von Fahrzeugen/Personen ohne Begruendung/Erlaubnis = 250.000 + Ersatz der Ware + Diensteintrag.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Missachten des Cop-Zivi Verhaeltnis = 100.000 + Verwarnung in Dienstakte
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Stehenlassen von Dienstfahrzeugen = 100.000 + Verwarnung in Dienstakte
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Strassensperren/Verkehrshuetchen fuer einen nicht vorhergesehenen Grund verwenden. (unter Fahrzeug legen/zum Spass aufstellen/etc.) = Verwarnung in Dienstakte + Degradierung + Ban
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Beabsichtigtes beschaedigen von Cop-, Feuerwehr- oder Zivilfahrzeugen. = Verwarnung in Dienstakte
	</t>
	"],
	
	["GSG9 Regeln","GSG9 Regeln Seite 1",
	"<t size='0.7' color='#009cff'> 1. Befehle </t><t size='0.7' color='#ffffff'>
	<br/>Das GSG9 ist gegenueber den Polizisten nicht weisungsbefugt, es sei denn ein Einsatz ruft an dem das GSG9 teilnimmt.
	<br/>In diesem Fall DARF das GSG9 das Kommando uebernehmen.
	<br/><t size='0.7' color='#009cff'> 2. Einsatzgebiete </t><t size='0.7' color='#ffffff'>
	<br/>
	<br/>Einsatzgebiete sind: Tankstellen, Geiselnahmen, Stadtuebernahme, Staatsbank und Events. Das GSG9 sollte zu keinem anderen RP eingeschaltet werden.
	<br/>Das GSG9 mischt sich nicht in Polizei-Aktivitaeten ein. Das heisst, wenn Polizisten in einer RP-Situation sind und das GSG9 nicht anfordern, darf sich das GSG9 nicht einmischen!  Die Polizei beendet die RP-Situation.
	<br/>
	<br/><t size='0.7' color='#009cff'> 3. Gepanzerte Fahrzeuge </t><t size='0.7' color='#ffffff'>
	<br/>Das GSG9 darf selbst entscheiden, ob es gepanzerte Fahrzeuge rausholt. Dennoch sollten gepanzerte Fahrzeuge am Kavala Markt eine Ausnahme sein.
	<br/>
	<br/><t size='0.7' color='#009cff'> 4. Roleplay </t><t size='0.7' color='#ffffff'>
	<br/>Das GSG9 ist wie jede Einheit gezwungen, RP zu machen. Tickets ausstellen oder Personenkontrollen sind nicht die Hauptaufgabengebiete des GSG9. 
	<br/>Wenn die Polizei jedoch ausgelastet ist darf das GSG9 selbstverstaendlich einspringen.
	<br/>
	<br/><t size='0.7' color='#009cff'> 5. Weitergabe von Waffen </t><t size='0.7' color='#ffffff'>
	<br/>Alle exklusiven GSG9 Waffen, also Waffen die nur im GSG9-Shop verfuegbar sind duerfen nicht weitergegeben werden.
	<br/>(auch nicht an Polizisten, egal welcher Rang sie haben)
	<br/>
	<br/><t size='0.7' color='#009cff'> 6. Traenengas </t><t size='0.7' color='#ffffff'>
	<br/>Traenengas nutzung nur fuer GSG9.
	</t>
	"],
	
	["Feuerwehr Regeln","Feuerwehr Regeln",
	"<t size='0.7' color='#009cff'> 1. Wiederbeleben </t><t size='0.7' color='#ffffff'>
	<br/>Ihr duerft erst Personen wiederbeleben wenn die Kampfsituation von beiden Parteien freigegeben wurde. Wenn ihr nach einer Kampfsituation Personen wiederbelebt muesst ihr alle Personen wiederbeleben
	<br/>Niemand darf euch verbieten Leute zu revieven und gleichzeitig fordern, dass seine Freunde/Clanmember etc... revived werden. Wer dies tut wird bitte beim Admin gemeldet
	<br/>
	<br/><t size='0.7' color='#009cff'> 2. Krankenhaus oder Feuerwehrstation </t><t size='0.7' color='#ffffff'>
	<br/>Nachdem ihr eine Pereson nach einer Kampfsituation wiederbelebt habt muesst ihr sie ins Krankenhaus bringen. Personen die ohne Einfluss anderer und unabhaengig von einer Kampfsituation gestorben sind muesst ihr nicht mitnehmen
	<br/>
	<br/><t size='0.7' color='#009cff'> 3. Kampfsituation </t><t size='0.7' color='#ffffff'>
	<br/>Ihr duerft keine Gegenstaende looten und behalten. Wenn ihr Waffen findet gebt diese bitte bei der Polizei ab, oder gibt sie den Zivilisten denen sie gehoeren. Ihr duerft dafuer kein Geld fordern. Ihr duerft niemanden toeten, auch wenn er trollt!
	<br/>
	<br/><t size='0.7' color='#009cff'> 4. Verkaufen von Fahrzeugen </t><t size='0.7' color='#ffffff'>
	<br/>Ihr duerft eure eigenen Fahrzeuge niemals verkaufen. Wer dies tut wird in die Blacklist eingetragen und kann somit nicht mehr als Feuerwehr spielen.
	<br/>
	<br/><t size='0.7' color='#009cff'> 5. Godmodus </t><t size='0.7' color='#ffffff'>
	<br/>Sie duerfen nicht Ihren Vorteil ausnutzen das Sie God-Modus haben dass heisst Sie duerfen keine Partei ergreifen weder fuer die Polizei, Rebellen, Mafiosis oder einen normalen
	<br/>Zivilisten Sie muessen immer neutral handeln und duerfen nicht ausspionieren.
	<br/>
	<br/><t size='0.7' color='#009cff'> 6. Grosser Unfall </t><t size='0.7' color='#ffffff'>
	<br/>Sie sind dazu verpflichtet bei einer Massenkarambolage die Polizei hinzu zuziehen und die Strasse grosszuegig abzusperren
	<br/>
	<br/><t size='0.7' color='#009cff'> 7. Funktionen ausnutzung </t><t size='0.7' color='#ffffff'>
	<br/>Keine der Funktionen der Feuerwehr darf ausgenutzt werden fuers Glitchen oder Dupen. (Dies wird geloggt, und mit einem Ban bestraft)
	<br/>
	<br/><t size='0.7' color='#009cff'>Weitere Regeln: </t><t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr darf unter keinen umstaenden Waffen besitzen bzw. benutzen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr haben Teamspeak Pflicht und muessen im Feuerwehr Channel sein.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr darf Ihren Universalschluessel, nur nutzen um Leichen aus Fahrzeugen zu ziehen.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr darf keine bewaffneten Personen transportieren.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Feuerwehr darf sich nicht an Straftaten beteiligen z.B. ein Gefaengnisausbruch.
	<br/><t size='0.7' color='#ff0000'> - </t><t size='0.7' color='#ffffff'>Die Mitarbeiter duerfen ausschliesslich die im Sanitaer oder Feuerwehrbedarf erhaeltlichen Kleidungsstuecke tragen.
	</t>
	"],
	
	["Banditen Regeln","Banditen Regeln",
	"<t size='0.7' color='#ffffff'>
	<br/><t size='0.7' color='#009cff'>Zivilisten: </t><t size='0.7' color='#ffffff'>
	<br/>Downtown ist eine Anti-Polizei Zone, hier darf kein PVP gegen Zivilisten geführt werden, nur gegen die Polizei.
	<br/>Zwischen Zivilisten, Mafia oder Rebellen darf kein PVP gefuehrt werden, sondern Roleplay. (Nutzt eure Kraft eher gegen die Polizei Razzias)
	<br/>
	<br/><t size='0.7' color='#009cff'>Polizei: </t><t size='0.7' color='#ffffff'>
	<br/>Downtown darf von der Polizei nur bei Razzias oder Verfolgungsjagten befahren werden.
	<br/>Polizisten muessen trotz Anti-Polizei Zone eine Ansage machen, bevor Sie handeln/schiessen.
	<br/>
	</t>
	"]
];

switch(_mode) do
{
	case 0:
	{
		{
			_displayName = (_x select 0);
			_rlistz lbAdd format["%1",_displayName];
		} forEach _rnputz;
	};
	
	case 1:
	{
		if(isNull _display) exitWith {};
		_rsetz = lbCurSel _rlistz;
		_select = _rnputz select _rsetz;
		_rtitlez ctrlSetText (_select select 1);
		_rtextz ctrlSetStructuredText parseText (_select select 2);
	};
};