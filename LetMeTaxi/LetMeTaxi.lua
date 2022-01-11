local function CancelForm()
	DEFAULT_CHAT_FRAME.editBox:SetText("/cancelform")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

local function OnEvent(self, event, arg1, arg2, ...)
	if event == "UI_ERROR_MESSAGE" then
		if arg2 == ERR_TAXIPLAYERALREADYMOUNTED then
			Dismount()
		elseif arg2 == ERR_TAXIPLAYERSHAPESHIFTED then
			CancelForm()
		end
	elseif event == "TAXIMAP_OPENED" then
		Dismount()
		CancelForm()
	end
end

local f = CreateFrame("Frame", "LetMeTaxi", UIParent)
f:RegisterEvent("TAXIMAP_OPENED")
f:RegisterEvent("UI_ERROR_MESSAGE")
f:SetScript("OnEvent", OnEvent)
f:Hide()