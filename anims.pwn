#include 	<YSI_Coding\y_hooks>

CMD:animhelp(playerid, params[])
{
    SendClientMessage(playerid, COLOR_GREEN,"{06F966}l_____________��ҷҧ Animation_____________|");
	SendClientMessage(playerid, COLOR_WHITE,"[���/�͹] /sit /chairsit /groundsit /seat /sleep /lean");
	SendClientMessage(playerid, COLOR_WHITE,"[�ѭ�ҳ���] /gsign /salute");
	SendClientMessage(playerid, COLOR_WHITE,"[����������] /greet /taxiL /taxiR");
    SendClientMessage(playerid, COLOR_WHITE,"[����������] /fuckyou /wave /kiss /no");
    SendClientMessage(playerid, COLOR_WHITE,"[����ҷҧ����Ҿ] /bat /punch /taunt /facepalm /aim /slapass");
    SendClientMessage(playerid, COLOR_WHITE,"[����ҷҧ����Ҿ] /hide /crawl /crack /think /sipdrink /sipdrink2");
    SendClientMessage(playerid, COLOR_WHITE,"[������] /cry /injured /panic");
    SendClientMessage(playerid, COLOR_GREEN,"{06F966}l_____________��ҷҧ Animation_____________|");

    GameTextForPlayer(playerid, "TO STOP ANIMATION TYPE ~r~/STOPANIM OR PRESS ~r~ENTER.", 3000, 4);

	new str[3500];
    strcat(str, "{FFFFFF}/fall | /fallback | /injured | /akick | /push | /lowbodypush | /handsup | /bomb | /drunk | /getarrested | /laugh | /sup\n");
    strcat(str, "{FFFFFF}/basket | /headbutt | /medic | /spray | /robman | /taichi | /lookout | /kiss | /cellin | /cellout | /crossarms | /lay\n");
	strcat(str, "{FFFFFF}/deal | /crack | /groundsit | /chat  | /dance | /fucku | /strip | /hide | /vomit | /chairsit | /reload\n");
    strcat(str, "{FFFFFF}/koface | /kostomach | /rollfall | /bat | /die | /joint | /bed | /lranim | /fixcar | /fixcarout\n");
    strcat(str, "{FFFFFF}/lifejump | /exhaust | /leftslap | /carlock | /hoodfrisked | /lightcig | /tapcig | /box | /lay2 | /chant | /fuckyou| /fuckyou2\n");
    strcat(str, "{FFFFFF}/shouting | /knife | /cop | /elbow | /kneekick | /airkick | /gkick | /punch | /gpunch | /fstance | /lowthrow | /highthrow | /aim\n");
    strcat(str, "{FFFFFF}/pee | /lean | /run | /poli | /surrender | /sit | /breathless | /seat | /rap | /cross | /jiggy | /gsign\n");
    strcat(str, "{FFFFFF}/sleep | /smoke | /pee | /chora | /relax | /crabs | /stop | /wash | /mourn | /fuck | /tosteal | /crawl\n");
    strcat(str, "{FFFFFF}/followme | /greet | /still | /hitch | /palmbitch | /cpranim | /giftgiving | /slap2 | /pump | /cheer\n");
    strcat(str, "{FFFFFF}/dj | /foodeat | /wave | /slapass | /dealer | /dealstance | /inbedright | /inbedleft\n");
	strcat(str, "{FFFFFF}/wank | /bj | /getup | /follow | /stand | /slapped | /yes | /celebrate | /win | /checkout\n");
	strcat(str, "{FFFFFF}/thankyou | /invite1 | /scratch | /nod | /cry | /carsmoke | /benddown | /facepalm | /angry\n");
	strcat(str, "{FFFFFF}/cockgun | /bar | /liftup | /putdown | /camera | /think | /handstand | /panicjump\n");
    Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{06F966}(��ҷҧ�������͹���)", str, "��ŧ", "");
	return 1;
}
CMD:greet(playerid, params[])
{
	new targetid, type;
	if(sscanf(params,"ud",targetid,type)) {
		SendClientMessage(playerid, COLOR_GREY, "�����: /greet [�ʹռ�����/���ͺҧ��ǹ] [style]");
		SendClientMessage(playerid, COLOR_YELLOW, "[1] Kiss [2] Handshake [3] Handshake [4] Handshake [5] Handshake");
		SendClientMessage(playerid, COLOR_YELLOW, "[6] Handshake [7] Handshake [8] Handshake [9] Handshake [10] Handshake");
		return 1;
	}

	if(targetid == INVALID_PLAYER_ID)
		SendClientMessage(playerid, COLOR_GREY, "   �����蹹�鹵Ѵ�����������");

	if(targetid == playerid)
		return SendClientMessage(playerid, COLOR_GREY, "�س�������ö�ѡ��µ���ͧ��");

	if(type > 10 || type < 1)
		return SendClientMessage(playerid, COLOR_WHITE, "���� 1-10!");

	if (!IsPlayerNearPlayer(playerid, targetid, 2.0))
		return SendClientMessage(playerid, COLOR_GREY, "   �����蹹��������������س");

	SetPVarInt(playerid, "SentGreet", 1);
	SetPVarInt(playerid, "GreetType", type);
	SetPVarInt(targetid, "GreetFrom", playerid);
	SetPVarInt(targetid, "GettingGreet", 1);

	SendClientMessageEx(playerid, COLOR_WHITE, "* �س��ͧ��÷ѡ��� %s", GetPlayerNameEx(targetid));
	SendClientMessageEx(targetid, COLOR_WHITE, "(ID: %d)%s ��ҡ��������ѡ��¡Ѻ�س (/acceptshake playerID)", playerid,GetPlayerNameEx(playerid));
	return 1;
}

CMD:acceptshake(playerid, params[])
{
	new targetid;
	if(sscanf(params,"d",targetid)) return SendClientMessage(playerid, COLOR_GREY, "{FF6142}USAGE: /acceptshake [�ʹռ�����/���ͺҧ��ǹ]");
	if(GetPVarInt(playerid, "GettingGreet") == 0) return SendClientMessage(playerid, COLOR_GREY, "������õ�ͧ��÷ѡ��¤س");
	if(GetPVarInt(playerid, "GreetFrom") != targetid) return SendClientMessage(playerid, COLOR_GREY, "�س�����١��ͧ�͡�÷ѡ��¨ҡ�����蹹��");

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_GREY, "   �����蹹�鹵Ѵ�����������");
	}

	if(targetid == playerid) return SendClientMessage(playerid, COLOR_GREY, "�س�������ö�ѡ��µ���ͧ��");


	if (!IsPlayerNearPlayer(playerid, targetid, 1.0)) return SendClientMessage(playerid, COLOR_GREY, "   �����蹹��������������س");

    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "   �س�������ö�ѡ�����㹢�й��");
    if (AnimationCheck(targetid)) return SendClientMessage(playerid, COLOR_GREY, "   �����蹹���������ö�ѡ��¤س��㹢�й��");

	new type = GetPVarInt(targetid, "GreetType");

	ApplyAnimationEx(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	playerData[playerid][pAnimation] = 0;

	ApplyAnimationEx(targetid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
	SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
	playerData[targetid][pAnimation] = 0;

	SetPlayerFacePlayer(playerid, targetid);
	SetPlayerFacePlayer(targetid, playerid);


	if(type == 1)
	{
		ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 2.0, 0, 0, 1, 0, 0);
		ApplyAnimation(targetid, "KISSING", "Playa_Kiss_02", 2.0, 0, 0, 1, 0, 0);
	}
	else if(type == 2)
	{
		ApplyAnimation(playerid,"GANGS","hndshkfa_swt", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkfa_swt", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 3)
	{
		ApplyAnimation(playerid,"GANGS","hndshkba", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkba", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 4)
	{
		ApplyAnimation(playerid,"GANGS","hndshkca", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkca", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 5)
	{
		ApplyAnimation(playerid,"GANGS","hndshkcb", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkcb", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 6)
	{
		ApplyAnimation(playerid,"GANGS","hndshkda", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkda", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 7)
	{
		ApplyAnimation(playerid,"GANGS","hndshkea", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkea", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 8)
	{
		ApplyAnimation(playerid,"GANGS","hndshkfa", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkfa", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 9)
	{
		ApplyAnimation(playerid,"GANGS","hndshkaa", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","hndshkaa", 2.0, 0, 0, 0, 0, 0);
	}
	else if(type == 10)
	{
		ApplyAnimation(playerid,"GANGS","prtial_hndshk_biz_01", 2.0, 0, 0, 0, 0, 0);
		ApplyAnimation(targetid,"GANGS","prtial_hndshk_biz_01", 2.0, 0, 0, 0, 0, 0);
	}
	DeletePVar(GetPVarInt(playerid, "GreetFrom"), "SentGreet");
	DeletePVar(GetPVarInt(playerid, "GreetFrom"), "GreetType");
	DeletePVar(playerid, "GreetFrom");
	DeletePVar(playerid, "GettingGreet");
	return 1;
}


CMD:no(playerid, params[])
{
    if (AnimationCheck(playerid))
        return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");

    ApplyAnimation(playerid, "PED","endchat_02", 4.1, 0, 0, 0, 0, 0);
   	return 1;
}

CMD:punch(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    ApplyAnimation(playerid, "RIOT", "RIOT_PUNCHES", 4.1, 0, 1, 1, 0, 0, 0);
    return 1;
}

CMD:crawl(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    ApplyAnimation(playerid, "PED", "CAR_CRAWLOUTRHS", 4.1, 0, 0, 0, 0, 0, 0);
    return 1;
}

CMD:sipdrink(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    ApplyAnimation(playerid, "BAR", "DNK_STNDM_LOOP", 4.1, 0, 0, 0, 0, 0, 0);
    return 1;
}

CMD:sipdrink2(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    ApplyAnimation(playerid, "BAR", "DNK_STNDF_LOOP", 4.1, 0, 0, 0, 0, 0, 0);
    return 1;
}

CMD:surrender(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && !AnimationCheck(playerid))
	{
		playerData[playerid][pAnimation] = 1;
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  		return 1;
	}
	else return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
}

CMD:sit(playerid,params[])
{
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /sit [1-5]");

	playerData[playerid][pAnimation] = 1;

    switch(anim){
		case 1: ApplyAnimation(playerid,"BEACH","bather",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"BEACH","ParkSit_W_loop",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1, 1);
		default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /sit [1-5]");
		}
	}
	return 1;
}

CMD:sleep(playerid,params[])
{
	new anim;

	if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /sleep [1-2]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1: ApplyAnimation(playerid,"CRACK","crckdeth4",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"CRACK","crckidle2",4.1, 0, 1, 1, 1, 1, 1);
		default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /sleep [1-2]");
		}
	}
	return 1;
}

CMD:salute(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    playerData[playerid][pAnimation] = 1;

    ApplyAnimation(playerid, "GHANDS", "GSIGN5LH", 4.1, false, false, false, false, 0, false);
    return 1;
}

CMD:cheer(playerid,params[])
{
	new anim;

	if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /cheer [1-8]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1: ApplyAnimation(playerid,"ON_LOOKERS","shout_01",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"ON_LOOKERS","shout_02",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"ON_LOOKERS","shout_in",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"RIOT","RIOT_ANGRY_B",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"RIOT","RIOT_shout",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"STRIP","PUN_HOLLER",4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"OTB","wtchrace_win",4.1, 0, 1, 1, 1, 1, 1);
		default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /cheer [1-8]");
		}
	}
	return 1;
}

CMD:dj(playerid,params[]){
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /dj [1-4]");
	playerData[playerid][pAnimation] = 1;
    switch(anim){
		case 1: ApplyAnimation(playerid,"SCRATCHING","scdldlp",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"SCRATCHING","scdlulp",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"SCRATCHING","scdrdlp",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"SCRATCHING","scdrulp",4.1, 0, 1, 1, 1, 1, 1);
		default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /dj [1-4]");
		}
	}
	return 1;
}

CMD:breathless(playerid,params[]){
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /breathless [1-2]");
	playerData[playerid][pAnimation] = 1;
    switch(anim){
		case 1: ApplyAnimation(playerid,"PED","IDLE_tired",4.1, 1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"FAT","IDLE_tired",4.1, 1, 1, 1, 1, 1, 1);
        default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /breathless [1-2]");
		}
	}
	return 1;
}

CMD:poli(playerid,params[]){
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /poli [1-2]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1:ApplyAnimation(playerid,"POLICE","CopTraf_Come",4.1, 0, 1, 1, 1, 1, 1);
		case 2:ApplyAnimation(playerid,"POLICE","CopTraf_Stop",4.1, 0, 1, 1, 1, 1, 1);
		default: {
			return SendClientMessage(playerid, COLOR_GREY, "�����: /poli [1-2]");
		}
	}
	return 1;
}

CMD:seat(playerid,params[]){
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /seat [1-7]");
	if(anim < 1 || anim > 7) return SendClientMessage(playerid, COLOR_GREY, "�����: /seat [1-7]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1: ApplyAnimation(playerid,"Attractors","Stepsit_in",4.1, 0, 0, 0, 1, 0, 0);
		case 2: ApplyAnimation(playerid,"CRIB","PED_Console_Loop",4.1, 0, 0, 0, 1, 0, 0);
		case 3: ApplyAnimation(playerid,"INT_HOUSE","LOU_In",4.1, 0, 0, 0, 1, 0, 0);
		case 4: ApplyAnimation(playerid,"MISC","SEAT_LR",4.1, 0, 0, 0, 1, 0, 0);
		case 5: ApplyAnimation(playerid,"MISC","Seat_talk_01",4.1, 0, 0, 0, 1, 0, 0);
		case 6: ApplyAnimation(playerid,"MISC","Seat_talk_02",4.1, 0, 0, 0, 1, 0, 0);
		case 7: ApplyAnimation(playerid,"ped","SEAT_down",4.1, 0, 0, 0, 1, 0, 0);
	}
	return 1;
}

CMD:dance(playerid,params[]){
    new dancestyle;
    if(sscanf(params, "d", dancestyle)) return SendClientMessage(playerid, COLOR_GREY, "�����: /dance [1-3]");
	playerData[playerid][pAnimation] = 1;
	switch(dancestyle){
		case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	}
   	return 1;
}

CMD:cross(playerid,params[]){
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /cross [1-5]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_01", 4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"GRAVEYARD","prst_loopa",4.1, 0, 1, 1, 1, 1, 1);
		default: return SendClientMessage(playerid, COLOR_GREY, "�����: /cross [1-5]");
	}
	return 1;
}

CMD:jiggy(playerid,params[])
{
    new anim;
    if(sscanf(params, "d", anim)) return SendClientMessage(playerid, COLOR_GREY, "�����: /jiggy [1-10]");
	playerData[playerid][pAnimation] = 1;
	switch(anim){
		case 1: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1, 1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1, 1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1, 1, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.1, 1, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.1, 1, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1, 1, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1, 1, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1, 1, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1, 1, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid,"DANCING","dnce_M_d",4.1, 1, 1, 1, 1, 1, 1);
		default: return SendClientMessage(playerid, COLOR_GREY, "�����: /jiggy [1-10]");
	}
	return 1;
}

CMD:rap(playerid,params[]){
    new rapstyle;
    if(sscanf(params, "d", rapstyle)) return SendClientMessage(playerid, COLOR_GREY, "�����: /rap [1-3]");
	playerData[playerid][pAnimation] = 1;
	switch(rapstyle){
		case 1: ApplyAnimation(playerid,"RAPPING","RAP_A_Loop",4.1, 1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.1, 1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"RAPPING","RAP_C_Loop",4.1, 1, 1, 1, 1, 1, 1);
		default: return SendClientMessage(playerid, COLOR_GREY, "�����: /rap [1-3]");
	}
   	return 1;
}

CMD:gsign(playerid,params[]){
    new gesture;
    if(sscanf(params, "d", gesture)) return SendClientMessage(playerid, COLOR_GREY, "�����: /gsign [1-15]");
	playerData[playerid][pAnimation] = 1;
	switch(gesture){
		case 1: ApplyAnimation(playerid,"GHANDS","gsign1",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"GHANDS","gsign2",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"GHANDS","gsign3",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"GHANDS","gsign3LH",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"GHANDS","gsign4",4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"GHANDS","gsign4LH",4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid,"GHANDS","gsign5",4.1, 0, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid,"GHANDS","gsign5",4.1, 0, 1, 1, 1, 1, 1);
		case 11: ApplyAnimation(playerid,"GHANDS","gsign5LH",4.1, 0, 1, 1, 1, 1, 1);
		case 12: ApplyAnimation(playerid,"GANGS","Invite_No",4.1, 0, 1, 1, 1, 1, 1);
		case 13: ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1, 0, 1, 1, 1, 1, 1);
		case 14: ApplyAnimation(playerid,"GANGS","prtial_gngtlkD",4.1, 0, 1, 1, 1, 1, 1);
		case 15: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1, 0, 1, 1, 1, 1, 1);
		default: return SendClientMessage(playerid, COLOR_GREY, "�����: /gsign [1-15]");
	}
	return 1;
}

CMD:smoke(playerid,params[]){
    new gesture;
    if(sscanf(params, "d", gesture)) return SendClientMessage(playerid, COLOR_GREY, "�����: /smoke [1-2]");
	playerData[playerid][pAnimation] = 1;
	switch(gesture){
		case 1: ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"SMOKING","M_smklean_loop",4.1, 0, 1, 1, 1, 1, 1);
		default: return SendClientMessage(playerid, COLOR_GREY, "�����: /smoke [1-2]");
	}
	return 1;
}

CMD:chora(playerid,params[]) { ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_watch",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:relax(playerid,params[]) { ApplyAnimation(playerid, "CRACK", "crckidle1",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:crabs(playerid,params[]) { ApplyAnimation(playerid,"MISC","Scratchballs_01",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:stop(playerid,params[]) { ApplyAnimation(playerid,"PED","endchat_01",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:wash(playerid,params[]) { ApplyAnimation(playerid,"BD_FIRE","wash_up",4.1, 0, 0, 0, 0, 0, 0); return 1; }
CMD:mourn(playerid,params[]) { ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:followme(playerid,params[]) { ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:still(playerid,params[]) { ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:hitch(playerid,params[]) { ApplyAnimation(playerid,"MISC","Hiker_Pose", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:palmbitch(playerid,params[]) { ApplyAnimation(playerid,"MISC","bitchslap",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:cpranim(playerid,params[]) { ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:giftgiving(playerid,params[]) { ApplyAnimation(playerid,"KISSING","gift_give",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:slap2(playerid,params[]) { ApplyAnimation(playerid,"SWEET","sweet_ass_slap",4.1, 0, 1, 1, 0, 0, 1); return 1; }

CMD:taxiL(playerid) {
	ApplyAnimation(playerid,"MISC","Hiker_Pose_L",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:taxiR(playerid) {
	ApplyAnimation(playerid,"MISC","Hiker_Pose",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}


CMD:handstand(playerid) {
	ApplyAnimation(playerid,"DAM_JUMP","DAM_Dive_Loop",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:panicjump(playerid) {
	ApplyAnimation(playerid,"DODGE","Crush_Jump",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:drunk(playerid,params[]) {
	ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1, 1, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:pump(playerid,params[]) { ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 1, 1, 0, 1, 1); return 1; }
CMD:tosteal(playerid,params[]) { ApplyAnimation(playerid,"ped", "ARRESTgun", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:laugh(playerid,params[]) { ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:lookout(playerid,params[])  {
	ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.1, 0, 1, 1, 0, 0, 1);
	return 1;
}
CMD:robman(playerid,params[]) { ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:hide(playerid,params[]) {
	ApplyAnimation(playerid, "ped", "cower",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:vomit(playerid,params[]) { ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:crack(playerid,params[]) {
	new choice;
	if(sscanf(params, "d", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /crack [1-3]");
		return 1;
	}
	playerData[playerid][pAnimation] = 1;
	switch(choice) {
		case 1: ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "CRACK","crckidle3", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "CRACK","crckidle4", 4.1, 0, 1, 1, 1, 1, 1);
	}
	return 1;
}
CMD:fuck(playerid,params[]) { ApplyAnimation(playerid,"PED","fucku",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:taichi(playerid,params[]) {
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PARK","Tai_Chi_Loop", 4.1, 1, 1, 1, 1, 1, 1);
	return 1;
}
CMD:kiss(playerid,params[]) { ApplyAnimation(playerid,"KISSING","Playa_Kiss_01",4.1, 0, 1, 1, 0, 1, 1); return 1; }

CMD:handsup(playerid, params[])//19 1:00 pm , 4/27/2012
{
	playerData[playerid][pAnimation] = 1;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
    return 1;
}

CMD:lay(playerid, params[])//29
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"BEACH", "bather",4.1, 0, 1, 1, 1, 1, 1); // Lay down
	return 1;
}

CMD:foodeat(playerid, params[])//32
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 1, 1, 1, 1, 1); // Eat Burger
	return 1;
}

CMD:wave(playerid, params[])//33
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.1, 1, 1, 1, 1, 1, 1); // Wave
	return 1;
}

CMD:slapass(playerid, params[])//34
{
	ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.1, 0, 1, 1, 0, 0, 1); // Ass Slapping
 	return 1;
}

CMD:dealer(playerid, params[])//35
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.1, 0, 1, 1, 1, 1, 1); // Deal Drugs
	return 1;
}

CMD:groundsit(playerid, params[])//38
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1, 1); // Sit
	return 1;
}


CMD:fucku(playerid, params[])//40
{
	ApplyAnimation(playerid,"PED","fucku",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:chairsit(playerid, params[])//42
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","SEAT_idle",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fall(playerid, params[])//43
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","KO_skid_front",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fallback(playerid, params[])//44
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid, "PED","FLOOR_hit_f", 4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:injured(playerid, params[])//46
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:sup(playerid, params[])//47
{
	new number;
	if(sscanf(params, "i", number)) return SendClientMessage(playerid, COLOR_GREY, "�����: /sup [1-3]");
	if(number < 1 || number > 3) { SendClientMessage(playerid, COLOR_GREY, "�����: /sup [1-3]"); }
	playerData[playerid][pAnimation] = 1;
	if(number == 1) { ApplyAnimation(playerid,"GANGS","hndshkba",4.1, 0, 1, 1, 1, 1, 1); }
	if(number == 2) { ApplyAnimation(playerid,"GANGS","hndshkda",4.1, 0, 1, 1, 1, 1, 1); }
    if(number == 3) { ApplyAnimation(playerid,"GANGS","hndshkfa_swt",4.1, 0, 1, 1, 1, 1, 1); }
   	return 1;
}

CMD:push(playerid, params[])// 49
{
	ApplyAnimation(playerid,"GANGS","shake_cara",4.1, 0, 1, 1, 0, 1, 1);
    return 1;
}

CMD:akick(playerid, params)// 50
{
	ApplyAnimation(playerid,"POLICE","Door_Kick",4.1, 0, 1, 1, 0, 1, 1);
    return 1;
}

CMD:lowbodypush(playerid, params[])// 51
{
	ApplyAnimation(playerid,"GANGS","shake_carSH",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:spray(playerid, params[])// 52
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:headbutt(playerid, params[])//53
{
	ApplyAnimation(playerid,"WAYFARER","WF_Fwd",4.1, 0, 1, 1, 0, 0, 1);
	return 1;
}

CMD:medic(playerid, params[])//54
{
	ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:koface(playerid, params[])//55
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","KO_shot_face",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:kostomach(playerid, params[])//56
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","KO_shot_stom",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lifejump(playerid, params[])//57
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","EV_dive",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:exhaust(playerid, params[])//58
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","IDLE_tired",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:leftslap(playerid, params[])//59
{
	ApplyAnimation(playerid,"PED","BIKE_elbowL",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:rollfall(playerid, params[])//60
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","BIKE_fallR",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:carlock(playerid, params[])//61
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"PED","CAR_doorlocked_LHS",4.1, 0, 1, 1, 0, 0, 1);
	return 1;
}

CMD:hoodfrisked(playerid, params[])//66
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"POLICE","crm_drgbst_01",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lightcig(playerid, params[])//67
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:tapcig(playerid, params[])//68
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"SMOKING","M_smk_tap",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:bat(playerid, params[])//69
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"BASEBALL","Bat_IDLE",4.1, 1, 1, 1, 1, 1, 1);
    return 1;
}

CMD:box(playerid, params[])//70
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"GYMNASIUM","GYMshadowbox",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lay2(playerid, params[])//71
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"SUNBATHE","Lay_Bac_in",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:chant(playerid, params[])//72
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:fuckyou(playerid, params[])//73
{
	if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:fuckyou2(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    playerData[playerid][pAnimation] = 1;
    ApplyAnimation(playerid, "RIOT", "RIOT_FUKU", 4.0, 0, 0, 0, 0, 0, 0);
    return 1;
}

CMD:fixcar(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    playerData[playerid][pAnimation] = 1;
    ApplyAnimation(playerid, "CAR", "FIXN_CAR_LOOP", 4.1, 0, 0, 0, 1, 0, 0);
    return 1;
}

CMD:fixcarout(playerid, params[])
{
    if (AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
    playerData[playerid][pAnimation] = 1;
    ApplyAnimation(playerid, "CAR", "FIXN_CAR_OUT", 4.1, 0, 0, 0, 0, 0, 0);
    return 1;
}

CMD:shouting(playerid, params[])//74
{
	ApplyAnimation(playerid,"RIOT","RIOT_shout",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:cop(playerid,params[])//75
{
	ApplyAnimation(playerid,"SWORD","sword_block",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:elbow(playerid, params[])//76
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:kneekick(playerid, params[])//77
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_D","FightD_2",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fstance(playerid, params[])//78
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:gpunch(playerid, params[])//79
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_B","FightB_G",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:airkick(playerid, params[])//80
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_C","FightC_M",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:gkick(playerid, params[])//81
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"FIGHT_D","FightD_G",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lowthrow(playerid, params[])//82
{
	ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.1, 0, 1, 1, 0, 0, 1);
    return 1;
}

CMD:highthrow(playerid, params[])//83
{
	ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:dealstance(playerid, params[])//84
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"DEALER","DEALER_IDLE",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:pee(playerid, params[])//85
{
	if(AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�������ö��� Animation ��㹢�й��");
	playerData[playerid][pAnimation] = 1;
	SetPlayerSpecialAction(playerid, 68);
    return 1;
}

CMD:knife(playerid, params[])//86
{
	new nbr;
	if(sscanf(params, "i", nbr)) return SendClientMessage(playerid, COLOR_GREY, "�����: /knife [1-4]");
    if(nbr < 1 || nbr > 4) return SendClientMessage(playerid, COLOR_GREY, "�����: /knife [1-4]");
	playerData[playerid][pAnimation] = 1;
	switch(nbr)
	{
		case 1: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.1, 0, 1, 1, 1, 1, 1); }
		case 2: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1, 0, 1, 1, 1, 1, 1); }
		case 3: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Player",4.1, 0, 1, 1, 1, 1, 1); }
		case 4: { ApplyAnimation(playerid,"KNIFE","KILL_Partial",4.1, 0, 1, 1, 1, 1, 1); }
	}
	return 1;
}

CMD:basket(playerid, params[])//87
{
	new ddr;
	if (sscanf(params, "i", ddr)) return SendClientMessage(playerid, COLOR_GREY, "�����: /basket [1-6]");
    if(ddr < 1 || ddr > 6) return SendClientMessage(playerid, COLOR_GREY, "�����: /basket [1-6]");
    playerData[playerid][pAnimation] = 1;
	switch(ddr)
	{
		case 1: { ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop",4.1, 0, 1, 1, 1, 1, 1); }
		case 2: { ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.1, 0, 1, 1, 1, 1, 1); }
		case 3: { ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.1, 0, 1, 1, 1, 1, 1); }
		case 4: { ApplyAnimation(playerid,"BSKTBALL","BBALL_run",4.1, 0, 1, 1, 1, 1, 1); }
		case 5: { ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.1, 1, 1, 1, 1, 1, 1); }
		case 6: { ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.1, 0, 1, 1, 0, 1, 1); }
	}
   	return 1;
}

CMD:reload(playerid, params[])//88
{
	new result[128];
	if(sscanf(params, "s[24]", result)) return SendClientMessage(playerid, COLOR_GREY, "�����: /reload [deagle/smg/ak/m4]");
    if(strcmp(result,"deagle", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"COLT45","colt45_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
    else if(strcmp(result,"smg", true) == 0)
    {
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
	else if(strcmp(result,"ak", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
	else if(strcmp(result,"m4", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
   	else { SendClientMessage(playerid, COLOR_GREY, "�����: /reload [deagle/smg/ak/m4]"); }
   	return 1;
}

CMD:aim(playerid, params[])//90
{
	new lmb;
	if(sscanf(params, "i", lmb)) return SendClientMessage(playerid, COLOR_GREY, "�����: /aim [1-3]");
	playerData[playerid][pAnimation] = 1;
	if(lmb == 1) { ApplyAnimation(playerid,"PED","gang_gunstand",4.1, 0, 1, 1, 1, 1, 1); }
    if(lmb == 2) { ApplyAnimation(playerid,"PED","Driveby_L",4.1, 0, 1, 1, 1, 1, 1); }
    if(lmb == 3) { ApplyAnimation(playerid,"PED","Driveby_R",4.1, 0, 1, 1, 1, 1, 1); }
    else { SendClientMessage(playerid, COLOR_GREY, "�����: /aim [1-3]"); }
    return 1;
}

CMD:lean(playerid, params[])//91
{
	new mj;
	if(sscanf(params, "i", mj)) return SendClientMessage(playerid, COLOR_GREY, "�����: /lean [1-2]");
	if(mj < 1 || mj > 2) { SendClientMessage(playerid, COLOR_GREY, "�����: /lean [1-2]"); }
    playerData[playerid][pAnimation] = 1;
	if(mj == 1) { ApplyAnimation(playerid,"GANGS","leanIDLE",4.1, 0, 1, 1, 1, 1, 1); }
	if(mj == 2) { ApplyAnimation(playerid,"MISC","Plyrlean_loop",4.1, 0, 1, 1, 1, 1, 1); }
   	return 1;
}

CMD:strip(playerid, params[])//93
{
	new kj;
    if(sscanf(params, "i", kj)) return SendClientMessage(playerid, COLOR_GREY, "�����: /strip [1-7]");
	if(kj < 1 || kj > 7) { SendClientMessage(playerid, COLOR_GREY, "�����: /strip [1-7]"); }
	playerData[playerid][pAnimation] = 1;
	if(kj == 1) { ApplyAnimation(playerid,"STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1, 1 ); }
	if(kj == 2) { ApplyAnimation(playerid,"STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1, 1 ); }
    if(kj == 3) { ApplyAnimation(playerid,"STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1, 1 ); }
    if(kj == 4) { ApplyAnimation(playerid,"STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1, 1 ); }
    if(kj == 5) { ApplyAnimation(playerid,"STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1, 1 ); }
    if(kj == 6) { ApplyAnimation(playerid,"STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1, 1 ); }
    if(kj == 7) { ApplyAnimation(playerid,"STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1, 1 ); }
 	return 1;
}

CMD:inbedright(playerid, params[])//94
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:inbedleft(playerid, params[])//95
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_L",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

/*CMD:wank(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /wank [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"PAULNMAC","wank_in",4.1, 0, 1, 1, 1, 1, 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.1, 1, 1, 1, 1, 1, 1);
	}
	return 1;
}*/

CMD:bj(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /bj [1-4]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_P",4.1, 0, 1, 1, 1, 1, 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_W",4.1, 0, 1, 1, 1, 1, 1);
	}
	if(strcmp(choice, "3", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_P",4.1, 0, 1, 1, 1, 1, 1);
	}
	if(strcmp(choice, "4", true) == 0)
	{
		playerData[playerid][pAnimation] = 1;
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.1, 1, 0, 0, 1, 1, 1);

	}
	return 1;
}

CMD:stand(playerid, params[])
{
	playerData[playerid][pAnimation] = 1;
	ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop", 4.1, 0, 1, 1, 1, 1, 1);
	return 1;
}

CMD:follow(playerid, params[])
{
	ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
    return 1;
}

CMD:getup(playerid, params[])
{
	ApplyAnimation(playerid,"PED","getup",4.1, 0, 1, 1, 0, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:slapped(playerid, params[])
{
	ApplyAnimation(playerid,"SWEET","ho_ass_slapped",4.1, 0, 1, 1, 0, 0, 1);
	playerData[playerid][pAnimation] = 1;
    return 1;
}

CMD:win(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /win [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"CASINO","cards_win", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"CASINO","Roulette_win", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}

CMD:celebrate(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /celebrate [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"benchpress","gym_bp_celebrate", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GYMNASIUM","gym_tread_celebrate", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}

CMD:yes(playerid, params[])
{
	ApplyAnimation(playerid,"CLOTHES","CLO_Buy", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:deal(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /deal [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"DEALER","DRUGS_BUY", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}

CMD:thankyou(playerid, params[])
{
	ApplyAnimation(playerid,"FOOD","SHP_Thank", 4.1, 0, 1, 1, 0, 0, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:invite1(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /invite1 [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1, 0, 1, 1, 0, 0, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GANGS","Invite_No",4.1, 0, 1, 1, 0, 0, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}

CMD:scratch(playerid, params[])
{
	ApplyAnimation(playerid,"MISC","Scratchballs_01", 4.1, 0, 1, 1, 0, 0, 1);
	playerData[playerid][pAnimation] = 1;
    return 1;
}
CMD:checkout(playerid, params[])
{
	ApplyAnimation(playerid, "GRAFFITI", "graffiti_Chkout", 4.1, 0, 1, 1, 0, 0, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:nod(playerid, params[])
{
	ApplyAnimation(playerid,"COP_AMBIENT","Coplook_nod",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:think(playerid, params[])
{
	ApplyAnimation(playerid,"COP_AMBIENT","Coplook_think",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:cry(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /cry [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}
CMD:bed(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /bed [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_In_L",4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_In_R",4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_L", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}
CMD:carsmoke(playerid, params[])
{
	ApplyAnimation(playerid,"PED","Smoke_in_car", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:angry(playerid, params[])
{
	ApplyAnimation(playerid,"RIOT","RIOT_ANGRY",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:benddown(playerid, params[])
{
	ApplyAnimation(playerid, "BAR", "Barserve_bottle", 4.1, 0, 1, 1, 0, 0, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:facepalm(playerid, params[])
{
	ApplyAnimation(playerid, "MISC", "plyr_shkhead", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:cockgun(playerid, params[])
{
	ApplyAnimation(playerid, "SILENCED", "Silence_reload", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:bar(playerid, params[])
{
	new choice;
	if(sscanf(params, "d", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /bar [1-12]");
		return 1;
	}
	playerData[playerid][pAnimation] = 1;
	switch(choice) {
		case 1: ApplyAnimation(playerid, "BAR", "Barcustom_get", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "BAR","Barcustom_loop", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "BAR","Barcustom_order", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: ApplyAnimation(playerid, "BAR","BARman_idle", 4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "BAR","Barserve_bottle", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: ApplyAnimation(playerid, "BAR","Barserve_give", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: ApplyAnimation(playerid, "BAR","Barserve_glass", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: ApplyAnimation(playerid, "BAR","Barserve_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid, "BAR","Barserve_loop", 4.1, 1, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid, "BAR","Barserve_order", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 0, 1, 1, 1, 1, 1);
		case 12: ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 0, 1, 1, 1, 1, 1);
	}
	return 1;
}
CMD:camera(playerid, params[])
{
	new choice;
	if(sscanf(params, "d", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /camera [1-10]");
		return 1;
	}
	playerData[playerid][pAnimation] = 1;
	switch(choice) {
		case 1: ApplyAnimation(playerid,  "CAMERA","camcrch_cmon", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,  "CAMERA","camcrch_to_camstnd", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,  "CAMERA","camstnd_cmon", 4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,  "CAMERA","camstnd_idleloop", 4.1, 1, 0, 0, 1, 1, 1);
		case 5: ApplyAnimation(playerid,  "CAMERA","camstnd_lkabt", 4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,  "CAMERA","piccrch_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,  "CAMERA","piccrch_take", 4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,  "CAMERA","picstnd_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid, "CAMERA","picstnd_out", 4.1, 0, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid, "CAMERA","picstnd_take", 4.1, 0, 1, 1, 1, 1, 1);
	}
	return 1;
}

CMD:panic(playerid, params[])
{
	new choice;
	if(sscanf(params, "d", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /panic [1-4]");
		return 1;
	}
	playerData[playerid][pAnimation] = 1;
	switch(choice) {
		case 1: ApplyAnimation(playerid,"ON_LOOKERS","panic_cower", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"ON_LOOKERS","panic_hide", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"ON_LOOKERS","panic_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"ON_LOOKERS","panic_loop", 4.1, 1, 0, 0, 0, 0, 1);
	}
	return 1;
}

CMD:liftup(playerid, params[])
{
	ApplyAnimation(playerid, "CARRY", "liftup", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:putdown(playerid, params[])
{
	ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}

CMD:joint(playerid, params[])
{
	ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1, 0, 1, 1, 1, 1, 1);
	playerData[playerid][pAnimation] = 1;
	return 1;
}
CMD:die(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_GREY, "�����: /die [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid, "PARACHUTE", "FALL_skyDive_DIE", 4.1, 0, 1, 1, 1, 1, 1);
		playerData[playerid][pAnimation] = 1;
	}
	return 1;
}
CMD:liahee(playerid, params[])
{
    ApplyAnimation(playerid, "BIKEd", "BIKEd_hit", 4.0, 1, 1, 1, 0, 0);
	playerData[playerid][pAnimation] = 1;
	return 1;
}