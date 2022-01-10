local f = CreateFrame("Frame", "LetMeTaxi", UIParent)
f:RegisterEvent("TAXIMAP_OPENED")

f:SetScript(
	"OnEvent",
	function(self, event, arg1, arg2, ...)
		if event == "TAXIMAP_OPENED" then
			Dismount()
			DEFAULT_CHAT_FRAME.editBox:SetText("/cancelform")
			ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
		end
	end
)

f:Hide()
