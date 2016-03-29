waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["noAim","noAimLife"];
player createDiarySubject ["Bußgeld","Bußgelder"];
player createDiarySubject ["changelog","Changelog"];
player createDiarySubject ["steuerung","Tastenkombi"];
player createDiarySubject ["newjobs","Berufe"];
player createDiarySubject ["serverrules","Server Regeln"];

#include "briefing\Serverinfo.sqf";
#include "briefing\Changelog.sqf";
#include "briefing\Bussgeld.sqf";
#include "briefing\Tastenkombi.sqf";
#include "briefing\Regeln.sqf";
#include "briefing\Berufe.sqf";