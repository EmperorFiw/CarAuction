//Author : EMPEROR
#include 	<YSI_Coding\y_hooks>

#if !defined COLOR_GREEN         	0x00FF00FF
    #define     COLOR_GREEN         	0x00FF00FF
#endif

CMD:ooc(playerid, params[])
{
	if (playerData[playerid][pVip] == 0 && playerData[playerid][pAdmin] == 0)
	{
		if (!OOC)
		    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}OOC ถูกปิดใช้งาน");

		if (playerData[playerid][pOOCSpam] > 0)
		    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ป้องกันการ Spam ข้อความ คุณเหลือเวลาอีก %d วินาที ในการใช้คำสั่งใหม่อีกครั้ง", playerData[playerid][pOOCSpam]);
	}
	if (playerData[playerid][pFaction] == -1)
	{
	    if (playerData[playerid][pVip] > 0)
		{
			new length = strlen(params);
			new nums[4], userid, Pos = strfind(params, "@", true); 

			if (strfind(params, "@", true) != -1) 
			{
				new count = 0;  
				for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
				{
					if (params[x] >= '0' && params[x] <= '9') 
					{

						nums[count] = params[x];
						count++;
					}
				}
				nums[count] = '\0';
				userid = strToNum(nums);
				foreach (new i : Player)
				{
					if (userid == i && userid != playerid)
					{
						new string[64], stringp[560];
						format(stringp, sizeof(stringp), "%s", params);
						format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
						strins(stringp, string, Pos+count+1);
						strdel(stringp, Pos, Pos+count+1);
						SendClientMessageToAllEx(COLOR_WHITE, "#VIP [ประชาชน] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), stringp);
						SendClientMessageEx(userid, COLOR_GREEN, "มีคนกำลังกล่าวถึงคุณ");
					}
					else
					{
						SendClientMessageToAllEx(COLOR_WHITE, "#VIP [ประชาชน] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
					}
				}
			}
			else
			{
				SendClientMessageToAllEx(COLOR_WHITE, "#VIP [ประชาชน] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "[ประชาชน] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
		}
	}
	else
	{
	    if (playerData[playerid][pVip] > 0)
		{
			new length = strlen(params);
			new nums[4], userid, Pos = strfind(params, "@", true); 

			if (strfind(params, "@", true) != -1) 
			{
				new count = 0;  
				for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
				{
					if (params[x] >= '0' && params[x] <= '9') 
					{

						nums[count] = params[x];
						count++;
					}
				}
				nums[count] = '\0';
				userid = strToNum(nums);
				foreach (new i : Player)
				{
					if (userid == i && userid != playerid)
					{
						new string[64], stringp[560];
						format(stringp, sizeof(stringp), "%s", params);
						format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
						strins(stringp, string, Pos+count+1);
						strdel(stringp, Pos, Pos+count+1);
						SendClientMessageToAllEx(COLOR_WHITE, "#VIP {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), stringp);
						SendClientMessageEx(userid, COLOR_GREEN, "มีคนกำลังกล่าวถึงคุณ");
					}
					else
					{
						SendClientMessageToAllEx(COLOR_WHITE, "#VIP {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
					}
				}
			}
			else
			{
				SendClientMessageToAllEx(COLOR_WHITE, "#VIP {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "{%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
		}
	}
	playerData[playerid][pOOCSpam] = 20;
	return 1;
}
alias:ooc("o")

strToNum(const str[]) 
{
    new num = 0, i = 0;
    while (str[i] != '\0') 
	{
        if (str[i] >= '0' && str[i] <= '9') 
		{
            num = num * 10 + (str[i] - '0');
        }
        i++;
    }
    return num;
}