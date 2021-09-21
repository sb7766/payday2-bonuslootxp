levels = {"kenaz", "welcome_to_the_jungle_1_night", "welcome_to_the_jungle_1", "branchbank", "mex", "sah", "dah", 
"firestarter_1", "firestarter_2", "firestarter_3", "four_stores", "nightclub", "fish", "ukrainian_job", "alex_must_die_2",
"dinner", "arm_cro", "arm_hcm", "arm_fac", "arm_par", "arm_und", "election_day_2", "election_day_3", "bex", "pex", "fex"}
loot = {
kenaz = {money = 500, painting = 500}, 
welcome_to_the_jungle_1_night = {money = 1000, coke = 1000, weapon = 1000},
welcome_to_the_jungle_1 = {money = 1000, coke = 1000, weapon = 1000},
branchbank = {money = 1000, gold = 1000},
mex = {money = 500, coke = 500, weapon = 500, meth = 1000, roman_armor = 1500},
sah = {mus_artifact = 500},
dah = {diamonds_dah = 600, diamondheist_big_diamond = 250},
firestarter_1 = {money = 1000},
firestarter_2 = {coke = 500, gold = 500, weapon = 500, money = 500, goat = 1000},
firestarter_3 = {gold = 1000, money = 1000},
four_stores = {jewelry = 1000},
nightclub = {money = 500, coke = 1000},
fish = {mus_artifact = 1000},
ukrainian_job = {diamonds = 500},
alex_must_die_2 = {money = 1000},
dinner = {din_pig = 1500},
arm_cro = {gold = 500, money = 500, jewelry = 500},
arm_hcm = {gold = 500, money = 500, jewelry = 500},
arm_fac = {gold = 500, money = 500, jewelry = 500},
arm_par = {gold = 500, money = 500, jewelry = 500},
arm_und = {gold = 500, money = 500, jewelry = 500},
election_day_2 = {money = 1000, gold = 500},
election_day_3 = {money = 500},
bex = {faberge_egg = 1000, treasure = 500},
pex = {coke_pure = 1000, weapon = 1000},
fex = {coke = 500, weapon = 100}
}

Hooks:PostHook(LootManager, "sync_secure_loot", "sync", function(self, carry_id)
	log(tostring(managers.job:current_level_id()))
	log(tostring(carry_id))
	if has_value(levels, managers.job:current_level_id()) then
		managers.experience:mission_xp_award(loot[Global.level_data.level_id][carry_id] or 0)
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