function()
    if aura_env.state then
        local start, duration

        -- Cooldown Progress (Spell)
        if not aura_env.state.trigger.itemName and aura_env.state.trigger.spellName then
           start, duration = GetSpellCooldown(aura_env.state.trigger.spellName)
        end

        -- Cooldown Progress (Item)
        if aura_env.state.trigger.itemName and aura_env.state.trigger.spellName then
            start, duration = GetItemCooldown(aura_env.state.trigger.itemName)
        end


        if start and duration then
            local cooldown = start + duration - GetTime()
            if cooldown > 0 then
                if cooldown < 60 then
                    return string.format("%.0f", cooldown) .. ""
                else
                    local rounded = math.floor(cooldown / 60 + 0.5)
                    return string.format("%.0f", rounded) .. "m"
                end
            end
        end
    end
end
