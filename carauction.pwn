//�к�������ö ��¹�� Emperor_Fiw
//FB: Thewaphithak Butkhot
//YouTube: Emperor Fiw

#include <YSI_Coding\y_hooks>

new CarID;
new BidPrice, StartPrice, CarPrice, AuctionPrice, AuctionPriceCurrent, NumberOneForAuction = 0;
new bool:AuctionStart = false;

hook OnGameModeInit()
{
    AuctionStart = false;
    return 1;
}
Dialog:DIALOG_SETTING_AUCTION(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
			case 0:
			{
                if (AuctionStart)
                    return SendClientMessage(playerid, COLOR_RED, "��û����������������");
                Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[��駤�ҡ�û�����]", "�ʹ�ö����ͧ��û�����\n�Ҥ��������\n�ӹǹ Bid ��鹵��\n�������û�����", "���͡", "�Դ");
            }
            case 1:
            {
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ��¡��ԡ��û�����ö����!");
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ��¡��ԡ��û�����ö����!");
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ��¡��ԡ��û�����ö����!");
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ��¡��ԡ��û�����ö����!");
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ��¡��ԡ��û�����ö����!");
                BidPrice=0;
                StartPrice=0;
                CarPrice=0;
                AuctionPrice=0;
                AuctionPriceCurrent=0;
                NumberOneForAuction = 0;
                AuctionStart = false;
            }
            case 2:
            {
                new query[512];
                SendClientMessageToAll(COLOR_RED, "> ��û����Ũ�ŧ����!");
                SendClientMessageToAllEx(COLOR_RED, "> %s ���Ѻö��� %s", GetPlayerNameEx(NumberOneForAuction), g_arrVehicleNames[CarID - 400]);
                SendClientMessageToAllEx(COLOR_RED, "> ��Ҥҷ������� %s", FormatMoney(AuctionPriceCurrent));
                GivePlayerMoneyEx(playerid, -AuctionPriceCurrent);
                mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', %d, %d, %.1f, '562.3970', '-1283.8485', '17.0007', '0.0000')", playerData[NumberOneForAuction][pID], GetPlayerNameEx(NumberOneForAuction), CarID, 0, 100.0);
	            mysql_tquery(g_SQL, query);
                AuctionStart = false;
            }
        }
    }
    return 1;
}

Dialog:DIALOG_SETTING_AUCTION1(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
			case 0:
			{
                Dialog_Show(playerid, DIALOG_CARID_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[��駤�ҡ�û�����]","{FFFFFF}��س��к��ʹ�ö����ͧ���","��ŧ","�͡");
            }
            case 1:
            {
                Dialog_Show(playerid, DIALOG_START_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[��駤�ҡ�û�����]","{FFFFFF}��س��к��Ҥ��������","��ŧ","�͡");
            }
            case 2:
            {
                Dialog_Show(playerid, DIALOG_BID_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[��駤�ҡ�û�����]","{FFFFFF}��س��к�� Bid ��鹵��","��ŧ","�͡");
            }
            case 3:
            {
                SendClientMessageToAll(COLOR_RED, "> �ʹ�Թ���������û�����ö����!");
                SendClientMessageToAllEx(COLOR_RED, "ö��������:{FFFFFF} %s", g_arrVehicleNames[CarID - 400]);
                SendClientMessageToAllEx(COLOR_RED, "�Ҥ��������:{FFFFFF} %s", FormatMoney(StartPrice));
                SendClientMessageToAllEx(COLOR_RED, "�ӹǹ Bid ��鹵��:{FFFFFF} %s", FormatMoney(BidPrice));
                SendClientMessageToAllEx(COLOR_RED, "�Ҥһ����ŻѨ�غѹ:{FFFFFF} %s", FormatMoney(AuctionPriceCurrent));
                SendClientMessageToAll(COLOR_RED, "���й� : {FFFFFF}/������ ���ͻ�����ö!");
                AuctionStart = true;
            }
        }
    }
    return 1;
}


Dialog:DIALOG_CARID_AUCTION(playerid, response, listitem, inputtext[])
{
	if (!response)
	    return 1;

    new id;
    id = strval(inputtext[0]);
    CarID = id;
    SendClientMessageEx(playerid, COLOR_RED, "%s", g_arrVehicleNames[CarID - 400]);

    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[��駤�ҡ�û�����]", "�ʹ�ö����ͧ��û�����\n�Ҥ��������\n�ӹǹ Bid ��鹵��\n�������û�����", "���͡", "�Դ");
	return 1;
}

Dialog:DIALOG_START_AUCTION(playerid, response, listitem, inputtext[])
{
	if (!response)
	    return 1;

    new amount = strval(inputtext);
	StartPrice = amount;
    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[��駤�ҡ�û�����]", "�ʹ�ö����ͧ��û�����\n�Ҥ��������\n�ӹǹ Bid ��鹵��\n�������û�����", "���͡", "�Դ");
	return 1;
}

Dialog:DIALOG_BID_AUCTION(playerid, response, listitem, inputtext[])
{
	if (!response)
	    return 1;

    new amount = strval(inputtext);
	BidPrice = amount;
    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[��駤�ҡ�û�����]", "�ʹ�ö����ͧ��û�����\n�Ҥ��������\n�ӹǹ Bid ��鹵��\n�������û�����", "���͡", "�Դ");
	return 1;
}

Dialog:DIALOG_CARAUCTION(playerid, response, listitem, inputtext[])
{
    new amount = strval(inputtext);
	if (response)
    {
        if (amount == AuctionPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{e30022}�Ҥҵ�ͧ�ҡ�����Ҥһ����ŻѨ�غѹ","��ŧ","�͡");

        if (amount < AuctionPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{e30022}�Ҥ�������� %s","��ŧ","�͡", FormatMoney(AuctionPrice));

        if (amount > playerData[playerid][pMoney])
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{e30022}�ӹǹ�Թ�ͧ�س�����§��","��ŧ","�͡");
    
        if (!AuctionStart)
            return SendClientMessage(playerid, COLOR_RED, "��û�����ö��ŧ����");

        if (amount < AuctionPrice+BidPrice || amount < AuctionPriceCurrent+BidPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{e30022}�Դ��鹵�� %s","��ŧ","�͡", FormatMoney(BidPrice));

        if (amount <= 0 || amount >= 1000000)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{e30022}�ӹǹ��ͧ�����¡��� 1 �������ҡ���� 1,000,000 %s","��ŧ","�͡", g_arrVehicleNames[CarID - 400]);
              
            NumberOneForAuction = playerid;
            AuctionPriceCurrent = amount;
            SendClientMessageEx(playerid, COLOR_GREEN, "�س��ӡ�û�����ö ��Ҥ� %s", FormatMoney(amount));
            SendClientMessageToAllEx(COLOR_GREEN, "%s ��ӡ�û�����ö��Ҥ� %s", GetPlayerNameEx(NumberOneForAuction), FormatMoney(AuctionPriceCurrent));

            SendClientMessageToAllEx(COLOR_RED, "ö��������:{FFFFFF} %s", g_arrVehicleNames[CarID - 400]);
            SendClientMessageToAllEx(COLOR_RED, "�Ҥ��������:{FFFFFF} %s", FormatMoney(StartPrice));
            SendClientMessageToAllEx(COLOR_RED, "�ӹǹ Bid ��鹵��:{FFFFFF} %s", FormatMoney(BidPrice));
            SendClientMessageToAllEx(COLOR_RED, "�Ҥһ����ŻѨ�غѹ:{FFFFFF} %s", FormatMoney(AuctionPriceCurrent));
    }
    return 1;
}

alias:CarAuction("������")
CMD:CarAuction(playerid, params[])
{
    if (!AuctionStart)
        return SendClientMessage(playerid, COLOR_RED, "�Դ��Ҵ: {FFFFFF}��û������ѧ�����������");
    
    Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[������ö]","{FFFCCC}��͡�Ҥҷ���ͧ��û�����","��ŧ","�͡");

    return 1;
}

CMD:setauction(playerid, params[])
{
    if (playerData[playerid][pAdmin] < 6)
        return 1;

    Dialog_Show(playerid, DIALOG_SETTING_AUCTION, DIALOG_STYLE_LIST, "[���١�û�����]", "- ��駤�ҡ�û�����\n- ¡��ԡ��û�����\n- �Դ��û�����������ö�������", "���͡", "�Դ");
    return 1;
}  
