RegisterServerEvent("BSC:AntiAFK:kick")
AddEventHandler("BSC:AntiAFK:kick", function()
	DropPlayer(source, Config.PlayerDroppedmsg)
end)  