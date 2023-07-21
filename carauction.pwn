//ระบบประมูลรถ เขียนโดย Emperor_Fiw
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
                    return SendClientMessage(playerid, COLOR_RED, "การประมูลเริ่มต้นอยู่");
                Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[ตั้งค่าการประมูล]", "ไอดีรถที่ต้องการประมูล\nราคาเริ่มต้น\nจำนวน Bid ขั้นต่ำ\nเริ่มการประมูล", "เลือก", "ปิด");
            }
            case 1:
            {
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้ยกเลิกการประมูลรถแล้ว!");
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้ยกเลิกการประมูลรถแล้ว!");
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้ยกเลิกการประมูลรถแล้ว!");
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้ยกเลิกการประมูลรถแล้ว!");
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้ยกเลิกการประมูลรถแล้ว!");
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
                SendClientMessageToAll(COLOR_RED, "> การประมูลจบลงแล้ว!");
                SendClientMessageToAllEx(COLOR_RED, "> %s ได้รับรถรุ่น %s", GetPlayerNameEx(NumberOneForAuction), g_arrVehicleNames[CarID - 400]);
                SendClientMessageToAllEx(COLOR_RED, "> ในราคาที่ประมูล %s", FormatMoney(AuctionPriceCurrent));
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
                Dialog_Show(playerid, DIALOG_CARID_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[ตั้งค่าการประมูล]","{FFFFFF}กรุณาระบุไอดีรถที่ต้องการ","ตกลง","ออก");
            }
            case 1:
            {
                Dialog_Show(playerid, DIALOG_START_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[ตั้งค่าการประมูล]","{FFFFFF}กรุณาระบุราคาเริ่มต้น","ตกลง","ออก");
            }
            case 2:
            {
                Dialog_Show(playerid, DIALOG_BID_AUCTION, DIALOG_STYLE_INPUT, "{F92605}[ตั้งค่าการประมูล]","{FFFFFF}กรุณาระบฺุ Bid ขั้นต่ำ","ตกลง","ออก");
            }
            case 3:
            {
                SendClientMessageToAll(COLOR_RED, "> แอดมินได้เริ่มการประมูลรถแล้ว!");
                SendClientMessageToAllEx(COLOR_RED, "รถที่ประมูล:{FFFFFF} %s", g_arrVehicleNames[CarID - 400]);
                SendClientMessageToAllEx(COLOR_RED, "ราคาเริ่มต้น:{FFFFFF} %s", FormatMoney(StartPrice));
                SendClientMessageToAllEx(COLOR_RED, "จำนวน Bid ขั้นต่ำ:{FFFFFF} %s", FormatMoney(BidPrice));
                SendClientMessageToAllEx(COLOR_RED, "ราคาประมูลปัจจุบัน:{FFFFFF} %s", FormatMoney(AuctionPriceCurrent));
                SendClientMessageToAll(COLOR_RED, "คำแนะนำ : {FFFFFF}/ประมูล เพื่อประมูลรถ!");
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

    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[ตั้งค่าการประมูล]", "ไอดีรถที่ต้องการประมูล\nราคาเริ่มต้น\nจำนวน Bid ขั้นต่ำ\nเริ่มการประมูล", "เลือก", "ปิด");
	return 1;
}

Dialog:DIALOG_START_AUCTION(playerid, response, listitem, inputtext[])
{
	if (!response)
	    return 1;

    new amount = strval(inputtext);
	StartPrice = amount;
    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[ตั้งค่าการประมูล]", "ไอดีรถที่ต้องการประมูล\nราคาเริ่มต้น\nจำนวน Bid ขั้นต่ำ\nเริ่มการประมูล", "เลือก", "ปิด");
	return 1;
}

Dialog:DIALOG_BID_AUCTION(playerid, response, listitem, inputtext[])
{
	if (!response)
	    return 1;

    new amount = strval(inputtext);
	BidPrice = amount;
    Dialog_Show(playerid, DIALOG_SETTING_AUCTION1, DIALOG_STYLE_LIST, "[ตั้งค่าการประมูล]", "ไอดีรถที่ต้องการประมูล\nราคาเริ่มต้น\nจำนวน Bid ขั้นต่ำ\nเริ่มการประมูล", "เลือก", "ปิด");
	return 1;
}

Dialog:DIALOG_CARAUCTION(playerid, response, listitem, inputtext[])
{
    new amount = strval(inputtext);
	if (response)
    {
        if (amount == AuctionPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{e30022}ราคาต้องมากกว่าราคาประมูลปัจจุบัน","ตกลง","ออก");

        if (amount < AuctionPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{e30022}ราคาเริ่มต้น %s","ตกลง","ออก", FormatMoney(AuctionPrice));

        if (amount > playerData[playerid][pMoney])
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{e30022}จำนวนเงินของคุณไม่เพียงพอ","ตกลง","ออก");
    
        if (!AuctionStart)
            return SendClientMessage(playerid, COLOR_RED, "การประมูลรถจบลงแล้ว");

        if (amount < AuctionPrice+BidPrice || amount < AuctionPriceCurrent+BidPrice)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{e30022}บิดขั้นต่ำ %s","ตกลง","ออก", FormatMoney(BidPrice));

        if (amount <= 0 || amount >= 1000000)
            return Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{e30022}จำนวนต้องไม่น้อยกว่า 1 และไม่มากกว่า 1,000,000 %s","ตกลง","ออก", g_arrVehicleNames[CarID - 400]);
              
            NumberOneForAuction = playerid;
            AuctionPriceCurrent = amount;
            SendClientMessageEx(playerid, COLOR_GREEN, "คุณได้ทำการประมูลรถ ในราคา %s", FormatMoney(amount));
            SendClientMessageToAllEx(COLOR_GREEN, "%s ได้ทำการประมูลรถในราคา %s", GetPlayerNameEx(NumberOneForAuction), FormatMoney(AuctionPriceCurrent));

            SendClientMessageToAllEx(COLOR_RED, "รถที่ประมูล:{FFFFFF} %s", g_arrVehicleNames[CarID - 400]);
            SendClientMessageToAllEx(COLOR_RED, "ราคาเริ่มต้น:{FFFFFF} %s", FormatMoney(StartPrice));
            SendClientMessageToAllEx(COLOR_RED, "จำนวน Bid ขั้นต่ำ:{FFFFFF} %s", FormatMoney(BidPrice));
            SendClientMessageToAllEx(COLOR_RED, "ราคาประมูลปัจจุบัน:{FFFFFF} %s", FormatMoney(AuctionPriceCurrent));
    }
    return 1;
}

alias:CarAuction("ประมูล")
CMD:CarAuction(playerid, params[])
{
    if (!AuctionStart)
        return SendClientMessage(playerid, COLOR_RED, "ผิดพลาด: {FFFFFF}การประมูลยังไม่เริ่มขึ้น");
    
    Dialog_Show(playerid, DIALOG_CARAUCTION, DIALOG_STYLE_INPUT, "{F92605}[ประมูลรถ]","{FFFCCC}กรอกราคาที่ต้องการประมูล","ตกลง","ออก");

    return 1;
}

CMD:setauction(playerid, params[])
{
    if (playerData[playerid][pAdmin] < 6)
        return 1;

    Dialog_Show(playerid, DIALOG_SETTING_AUCTION, DIALOG_STYLE_LIST, "[เมนูการประมูล]", "- ตั้งค่าการประมูล\n- ยกเลิกการประมูล\n- ปิดการประมูลและให้รถแก่ผู้เล่น", "เลือก", "ปิด");
    return 1;
}  
