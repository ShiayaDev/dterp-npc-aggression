local processedPeds = {}

CreateThread(function()
    while true do
        Wait(Config.ScanInterval)

        local peds = GetGamePool('CPed')

        for _, ped in ipairs(peds) do
            if DoesEntityExist(ped)
            and not IsPedAPlayer(ped)
            and not IsEntityAMissionEntity(ped)
            and not processedPeds[ped] then

                processedPeds[ped] = true

                SetBlockingOfNonTemporaryEvents(ped, true)
                SetPedCanSwitchWeapon(ped, false)
                RemoveAllPedWeapons(ped, true)

                SetPedFleeAttributes(ped, 0, true)
                SetPedCombatAttributes(ped, 17, true)
                SetPedCombatAttributes(ped, 46, true)
                SetPedAsEnemy(ped, false)

                SetPedAlertness(ped, 0)
                SetPedSeeingRange(ped, 0.0)
                SetPedHearingRange(ped, 0.0)
            end
        end
    end
end)