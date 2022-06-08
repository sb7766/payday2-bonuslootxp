levels = {"kenaz", "welcome_to_the_jungle_1_night", "welcome_to_the_jungle_1", "branchbank", "mex", "dah", 
"firestarter_1", "firestarter_3", "four_stores", "ukrainian_job", "alex_must_die_2",
"dinner", "election_day_2", "election_day_3", "pex", "fex"}
escapes = {"escape_cafe_day", "escape_park_day", "escape_cafe", "escape_park", "escape_street", "escape_overpass", "escape_overpass_night", "escape_garage"}
loot = {
kenaz = {money = 500, painting = 1000, unknown = 250}, 
welcome_to_the_jungle_1_night = {money = 1000, coke = 1000, weapon = 1000},
welcome_to_the_jungle_1 = {money = 1000, coke = 1000, weapon = 1000},
branchbank = {money = 1000, gold = 1000},
mex = {meth = 500, roman_armor = 1000},
dah = {diamonds_dah = 600, diamondheist_big_diamond = 250},
firestarter_1 = {money = 1000},
firestarter_3 = {gold = 1000, money = 1000},
four_stores = {jewelry = 1000},
ukrainian_job = {diamonds = 500},
alex_2 = {money = 1000},
dinner = {din_pig = 1000},
election_day_2 = {money = 1000, gold = 500},
election_day_3 = {money = 500},
pex = {coke_pure = 1000, weapon = 1000},
fex = {coke = 500, weapon = 100}
}

Hooks:PostHook(LootManager, "sync_secure_loot", "sync", function(self, carry_id)
	if has_value(levels, managers.job:current_level_id()) then
		managers.experience:mission_xp_award(loot[Global.level_data.level_id][carry_id] or 0)
	elseif has_value(escapes, managers.job:current_level_id()) then
		managers.experience:mission_xp_award(500)
	end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end