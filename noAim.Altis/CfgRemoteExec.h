	/*
        Mode:
			0: remote execution is blocked
			1: only whitelisted functions/commands are allowed for remote execution
			2: remote execution fully opened
		
		allowedTargets:
			0: can target all machines (default)
			1: can target only clients, execution on server is denied
			2: can target only server, execution on clients is denied
		
		jip:
			0: JIP flag cannot be set
			1: JIP flag can be set (default) // Jetzt ausführen und für jeden joinenden Spieler
	*/
		
		class Commands
        {
                mode = 1;
				jip = 0;
                //class setFuel {allowedTargets = 2;};           //execute only on server
                //class hint {jip = 0;};                         //jip is not allowed for this command
				class diag_log {};
				class hint {};
				class systemChat {};
				/*
				class allowDamage {};
				class allowSprint {};
				class disableCollisionWith {};
				class forceWalk {};
				class lock {};
				class moveInAny {};
				class moveInCargo {};
				class moveInCommander {};
				class moveInDriver {};
				class moveInGunner {};
				class moveInTurret {};
				class playMove {};
				class playMoveNow {};
				class say3d;
				class selectLeader {};
				class setAnimSpeedCoef {};
				class setCaptive {};
				class setCustomAimCoef {};
				class setFace {};
				class setFlagTexture {};
				class setFog {};
				class setObjectMaterial {};
				class setObjectTextureGlobal {};
				class setPos {};
				class setPosASL {};
				class setPosATL {};
				class setFuel {};
				class setUnitRecoilCoefficient {};
				class setVectorUp {};
				class switchMove {};*/
				//class skipTime {allowedTargets = 2;};
				
        };
		
        class Functions
        {
                mode = 1;
                jip = 0;                                       //no functions can use jip
				
				//SERVER-N-CLIENT
				class DB_fnc_queryRequest {allowedTargets = 0;};
				class noaim_fnc_setFuel {allowedTargets = 0;};
				class noaim_fnc_lockVehicle {allowedTargets = 0;};
				class TON_fnc_insertGang {allowedTargets = 0;};
				class DB_fnc_insertRequest {allowedTargets = 0;};
				class DB_fnc_updatePartial {allowedTargets = 0;};  	// Überarbeitet
				class DB_fnc_updateRequest {allowedTargets = 0;};  	// Überarbeitet
				class TON_fnc_vehicleDelete {allowedTargets = 0;};		//<<<<<<<<<
				class TON_fnc_spawnVehicle {allowedTargets = 0;}; 		// Überarbeitet
				class TON_fnc_getVehicles {allowedTargets = 0;};  		// Überarbeitet
				class noaim_fnc_colorVehicle {allowedTargets = 0;};
				class TON_fnc_handleMessages {allowedTargets = 0;};
				class TON_fnc_msgRequest {allowedTargets = 0;};
				class TON_fnc_callTaxiDrivers {allowedTargets = 0;};	
				class bis_fnc_execvm {allowedTargets = 0;};
				class bis_fnc_effectkilledsecondarie {allowedTargets = 0;};
				class noaim_fnc_simDisable {allowedTargets = 0;}; //TEST nil
				//class (atmcoins_cache - life_zgazzy),(coins_cache - life_znorak) {allowedTargets = 0;}; //TEST nil
				class noaim_fnc_weedSmoke {allowedTargets = 0;}; //TEST true
				class noaim_fnc_finishRide {allowedTargets = 0;}; //TEST life_taxiDriver
				class noaim_fnc_respond {allowedTargets = 0;}; //TEST life_taxiDriver
				class noaim_fnc_shopState {allowedTargets = 0;}; //true true
				class noaim_fnc_storeVehicle {allowedTargets = 0;}; //true true
				class TON_fnc_huntingZone {allowedTargets = 2;}; //TEST????????????????
				class noaim_fnc_nonLethal {allowedTargets = 1;};
				//class TON_fnc_farmingEggZone {allowedTargets = 2;}; //TEST????????????
				//class noaim_fnc_medicservice {allowedTargets = 0;};
				//class noaim_fnc_feuerwehr {allowedTargets = 0;};
				
				//SERVER
				class noaim_fnc_wantedBounty {allowedTargets = 2;};
				class noaim_fnc_wantedAdd {allowedTargets = 2;};
				class TON_fnc_vehicleStore {allowedTargets = 0;};
				class noaim_fnc_robShops {allowedTargets = 2;};
				class noaim_fnc_wantedRemove {allowedTargets = 2;};
				class TON_fnc_updateHouseContainers {allowedTargets = 2;};
				class TON_fnc_updateHouseTrunk {allowedTargets = 2;};
				class TON_fnc_managesc {allowedTargets = 2;};
				class TON_fnc_removeGang {allowedTargets = 2;};
				class TON_fnc_updateGang {allowedTargets = 2;};
				class TON_fnc_addHouse {allowedTargets = 2;};
				class TON_fnc_sellHouse {allowedTargets = 2;};
				class TON_fnc_spikeStrip {allowedTargets = 2;};
				class noaim_fnc_wantedFetch {allowedTargets = 2;};
				class TON_fnc_setObjVars {allowedTargets = 2;};
				class TON_fnc_chopShopSell {allowedTargets = 2;};
				class TON_fnc_setObjVar {allowedTargets = 2;};
				class TON_fnc_keyManagement {allowedTargets = 2;};
				class ton_fnc_vehiclecreate {allowedTargets = 2;};
				class ton_fnc_cleanuprequest {allowedTargets = 2;};
				class noaim_fnc_wantedprofupdate {allowedTargets = 2;}; //TEST
				class noaim_fnc_jailSys {allowedTargets = 2;}; //TEST 2
				class TON_fnc_vehicleIsDead {allowedTargets = 2;}; //TEST 2
				class TON_fnc_logIt {allowedTargets = 2;}; //TEST 2
				class noaim_fnc_wantedCrimes {allowedTargets = 2;}; //TEST 2
				class DB_fnc_marketInsert {allowedTargets = 2;}; //TEST 2
				class TON_fnc_paintball {allowedTargets = 2;}; //TEST 2
				class TON_fnc_cleanupMessages {allowedTargets = 2;}; //TEST 2
				class TON_fnc_goOnDuty {allowedTargets = 2;}; //TEST 2
				class TON_fnc_acceptedTaxiCall {allowedTargets = 2;}; //TEST 2
				class TON_fnc_game {allowedTargets = 2;}; //TEST 2
				
				//CLIENT
				class noaim_fnc_fwmsg {allowedTargets = 1;};
				class noaim_fnc_wantedList {allowedTargets = 1;};
				class noaim_fnc_wantedInfo {allowedTargets = 1;}; //TEST _unit
				class noaim_fnc_bountyReceive {allowedTargets = 1;};
				class noaim_fnc_spikeStripEffect {allowedTargets = 1;};
				class noaim_fnc_garageRefund {allowedTargets = 1;};
				class noaim_fnc_addVehicle2Chain {allowedTargets = 1;}; //TEST _unit
				class noaim_fnc_robShops2 {allowedTargets = 1;}; //TEST //_robber2
				class noaim_fnc_impoundMenu {allowedTargets = 1;};
				class noaim_fnc_adminid {allowedTargets = 1;}; //TEST _ret
				class noaim_fnc_smartphone {allowedTargets = 1;}; //TEST _player
				class noaim_fnc_endRace {allowedTargets = 1;}; //TEST _player
				class noaim_fnc_prepareRace {allowedTargets = 1;}; //TEST _x
				class noaim_fnc_startRace {allowedTargets = 1;}; //TEST _x
				class noaim_fnc_pb_response {allowedTargets = 1;}; //TEST _x _uid
				class SAX_fnc_insertPlayerInfo {allowedTargets = 1;};
				class SAX_fnc_requestReceived {allowedTargets = 1;}; //TEST_ownerID
				class SAX_fnc_dataQuery {allowedTargets = 1;};
				class noaim_fnc_jailMe {allowedTargets = 1;};
				class noaim_fnc_gangDisbanded {allowedTargets = 1;};
				class noaim_fnc_gangCreated {allowedTargets = 1;};
				class noaim_fnc_netSetVar {allowedTargets = 1;}; //TEST_ownerID
				class noaim_fnc_setRating {allowedTargets = 1;}; //TEST _shooter
				class TON_fnc_clientMessage {allowedTargets = 1;}; //TEST east west civ und co
				class noaim_fnc_taxi_respond {allowedTargets = 1;}; //TEST _player
				class noaim_fnc_ncFlashOn {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_setTexture {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_clientGangLeft {allowedTargets = 1;}; //TEST player
				class noaim_fnc_tempSack {allowedTargets = 1;}; //TEST life_pInact_curTarget
				class noaim_fnc_flashbang {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_ticketPrompt {allowedTargets = 1;}; //TEST life_ticket_unit
				class noaim_fnc_fw_ticket_prompt {allowedTargets = 1;}; //TEST life_ticket_unit
				class noaim_fnc_ticketPaid {allowedTargets = 1;}; //life_ticket_cop
				class noaim_fnc_fw_ticket_paid {allowedTargets = 1;}; //life_ticket_fw
				class noaim_fnc_pushFunction {allowedTargets = 1;}; //TEST unit
				class noaim_fnc_rdere {allowedTargets = 1;}; //TEST unit
				class noaim_fnc_demoChargeTimer {allowedTargets = 1;}; //TEST west
				class noaim_fnc_playSound {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_civIDShown {allowedTargets = 1;}; //TEST _target
				class noaim_fnc_leftl {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_rightl {allowedTargets = 1;}; //TEST -2
				class noaim_fnc_pulloutVeh {allowedTargets = 1;};
				class noaim_fnc_jail {allowedTargets = 1;};
				class noaim_fnc_broadcast {allowedTargets = 1;};
				class noaim_fnc_animSync {allowedTargets = 1;};
				class noaim_fnc_robPerson {allowedTargets = 1;};
				class noaim_fnc_robReceive {allowedTargets = 1;};
				class noaim_fnc_searchClient {allowedTargets = 1;};
				class noaim_fnc_hasOrgan {allowedTargets = 1;};
				class noaim_fnc_knockedOut {allowedTargets = 1;};
				class noaim_fnc_tazeSound {allowedTargets = 1;};
				class noaim_fnc_licenseCheck {allowedTargets = 1;};
				class noaim_fnc_licensesRead {allowedTargets = 1;};
				class noaim_fnc_copSearch {allowedTargets = 1;};
				class noaim_fnc_copLights {allowedTargets = 1;};
				class noaim_fnc_medicLights {allowedTargets = 1;};
				class noaim_fnc_globalSoundClient {allowedTargets = 1;};
				class noaim_fnc_copSiren {allowedTargets = 1;};
				class noaim_fnc_copSiren1 {allowedTargets = 1;};
				class noaim_fnc_copSiren2 {allowedTargets = 1;};
				class noaim_fnc_medicSiren {allowedTargets = 1;};
				class noaim_fnc_medicSiren2 {allowedTargets = 1;};
				class noaim_fnc_copSiren3 {allowedTargets = 1;};
				class noaim_fnc_medicSiren3 {allowedTargets = 1;};
				class noaim_fnc_giveDiff {allowedTargets = 1;};
				class noaim_fnc_admininfo {allowedTargets = 1;};
				class noaim_fnc_gangInvite {allowedTargets = 1;};
				class TON_fnc_clientGangKick {allowedTargets = 1;};
				class TON_fnc_clientGangLeft {allowedTargets = 1;};
				class TON_fnc_clientGangLeader {allowedTargets = 1;};
				class noaim_fnc_lightHouse {allowedTargets = 1;};
				class noaim_fnc_removeLicenses {allowedTargets = 1;};
				class noaim_fnc_medicRequest {allowedTargets = 1;};
				class noaim_fnc_corpse {allowedTargets = 1;};
				class noaim_fnc_revived {allowedTargets = 1;};
				class noaim_fnc_receiveItem {allowedTargets = 1;};
				class noaim_fnc_receiveMoney {allowedTargets = 1;};
				class TON_fnc_clientGetKey {allowedTargets = 1;};
				class noaim_fnc_vehicleWarned {allowedTargets = 1;};
				class noaim_fnc_soundDevice {allowedTargets = 1;};
				class TON_fnc_clientWireTransfer {allowedTargets = 1;};
				class noaim_fnc_vehicleAnimate {allowedTargets = 1;};
				class noaim_fnc_networkSetVar {allowedTargets = 1;};
				class noaim_fnc_vehicleEmpd {allowedTargets = 1;};
				class noaim_fnc_jumpfnc {allowedTargets = 1;};
				class noaim_fnc_zrestrain {allowedTargets = 1;};
				class BIS_fnc_spawn {allowedTargets = 1;}; //TEST _unit
				
				//NOT YET USED
                class BIS_fnc_setRank {allowedTargets = 1;};   //execute only on clients, server execution denied
				class noaim_fnc_requestReceived {allowedTargets = 1;};
				class noaim_fnc_moveIn {allowedTargets = 1;};
        };
