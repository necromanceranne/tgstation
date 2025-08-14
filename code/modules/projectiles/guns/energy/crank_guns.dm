/obj/item/gun/energy/laser/musket
	name = "lightning musket"
	desc = "The power of Zeus himself in your hands."
	icon_state = "musket"
	inhand_icon_state = "musket"
	worn_icon_state = "las_musket"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket)
	slot_flags = ITEM_SLOT_BACK
	obj_flags = UNIQUE_RENAME
	can_bayonet = TRUE
	knife_x_offset = 22
	knife_y_offset = 11
	/// How quickly our musket charges up.
	var/current_capacitors_rating = 1
	/// The crank time on our gun. Determined by capacitor rating.
	var/crank_time = 4 SECONDS
	/// The multiplier for charge rate.
	var/current_charge_amount = 0.5
	/// Var to add a special prefix before any construction defining prefixes.
	var/special_prefix = ""
	/// The base name of our weapon
	var/base_name = "laser musket"

/obj/item/gun/energy/laser/musket/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE * current_charge_amount, \
		cooldown_time = crank_time, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
	)

/obj/item/gun/energy/laser/musket/update_icon_state()
	inhand_icon_state = "[initial(inhand_icon_state)][(get_charge_ratio() == 4 ? "charged" : "")]"
	return ..()

/obj/item/gun/energy/laser/musket/CheckParts(list/parts_list)
	var/obj/item/stock_parts/capacitor/our_capacitor = locate(/obj/item/stock_parts/capacitor) in parts_list

	var/capacitor_rating = 1
	if(our_capacitor)
		capacitor_rating = our_capacitor.rating
		parts_list -= our_capacitor
		qdel(our_capacitor)

	var/capacitor_prefix = ""

	switch(capacitor_rating)
		if(4)
			capacitor_prefix = "quadratic "
		if(3)
			capacitor_prefix = "super "
		if(2)
			capacitor_prefix = "advanced "
		if(1)
			capacitor_prefix = ""

	if(capacitor_rating > current_capacitors_rating)
		var/capacitor_rating_differential = capacitor_rating - current_capacitors_rating
		crank_time -= capacitor_rating_differential * 10
		var/datum/component/crank_recharge/our_crank = GetComponent(/datum/component/crank_recharge)
		our_crank.cooldown_time = crank_time

	name = "[special_prefix][capacitor_prefix][base_name]"

	current_capacitors_rating = capacitor_rating

	return ..()

/obj/item/gun/energy/laser/musket/tier_2
	name = "advanced laser musket"
	current_capacitors_rating = 2
	crank_time = 3 SECONDS

/obj/item/gun/energy/laser/musket/tier_3
	name = "super laser musket"
	current_capacitors_rating = 3
	crank_time = 2 SECONDS

/obj/item/gun/energy/laser/musket/tier_4
	name = "quadratic laser musket"
	current_capacitors_rating = 4
	crank_time = 1 SECONDS

/obj/item/gun/energy/laser/musket/prime
	name = "heroic laser musket"
	desc = "A well-engineered, hand-charged laser weapon. Its capacitors hum with potential."
	icon_state = "musket_prime"
	inhand_icon_state = "musket_prime"
	worn_icon_state = "las_musket_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket/prime)
	special_prefix = "heroic "
	current_charge_amount = 1

/obj/item/gun/energy/laser/musket/prime/tier_2
	name = "heroic advanced laser musket"
	current_capacitors_rating = 2
	crank_time = 3 SECONDS

/obj/item/gun/energy/laser/musket/prime/tier_3
	name = "heroic super laser musket"
	current_capacitors_rating = 3
	crank_time = 2 SECONDS

/obj/item/gun/energy/laser/musket/prime/tier_4
	name = "heroic quadratic laser musket"
	current_capacitors_rating = 4
	crank_time = 1 SECONDS

/obj/item/gun/energy/disabler/smoothbore
	name = "smoothbore disabler"
	desc = "A hand-crafted disabler, using a hard knock on an energy cell to fire the stunner laser. A lack of proper focusing means it has no accuracy whatsoever."
	icon_state = "smoothbore"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore)
	shaded_charge = 1
	charge_sections = 1
	spread = 22.5

/obj/item/gun/energy/disabler/smoothbore/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
	)

/obj/item/gun/energy/disabler/smoothbore/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 18, \
		overlay_y = 12, \
	) //i swear 1812 being the overlay numbers was accidental

/obj/item/gun/energy/disabler/smoothbore/prime //much stronger than the other prime variants, so dont just put this in as maint loot
	name = "elite smoothbore disabler"
	desc = "An enhancement version of the smoothbore disabler pistol. Improved optics and cell type result in good accuracy and the ability to fire twice. \
	The disabler bolts also don't dissipate upon impact with armor, unlike the previous model."
	icon_state = "smoothbore_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore/prime)
	charge_sections = 2
	spread = 0 //could be like 5, but having just very tiny spread kinda feels like bullshit

//Inferno and Cryo Pistols

/obj/item/gun/energy/laser/thermal //the common parent of these guns, it just shoots hard bullets, somoene might like that?
	name = "nanite pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit globs of angry robots into the bad guys."
	icon_state = "infernopistol"
	inhand_icon_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/nanite)
	shaded_charge = TRUE
	ammo_x_offset = 1
	obj_flags = UNIQUE_RENAME
	can_bayonet = TRUE
	knife_x_offset = 19
	knife_y_offset = 13
	w_class = WEIGHT_CLASS_NORMAL
	dual_wield_spread = 5 //as intended by the coders

/obj/item/gun/energy/laser/thermal/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)
	AddComponent( \
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		spin_to_win = TRUE, \
		charge_amount = LASER_SHOTS(8, STANDARD_CELL_CHARGE), \
		cooldown_time = 0.8 SECONDS, \
		charge_sound = 'sound/weapons/kinetic_reload.ogg', \
		charge_sound_cooldown_time = 0.8 SECONDS, \
	)

/obj/item/gun/energy/laser/thermal/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 15, \
		overlay_y = 9)

/obj/item/gun/energy/laser/thermal/inferno //the magma gun
	name = "inferno pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit globs of molten angry robots into the bad guys. \
		While it doesn't manipulate temperature in and of itself, it does cause an violent eruption in anyone who is severely cold. Able to generate \
		ammunition by manually spinning the weapon's nanite canister."
	icon_state = "infernopistol"
	ammo_type = list(/obj/item/ammo_casing/energy/nanite/inferno)

/obj/item/gun/energy/laser/thermal/cryo //the ice gun
	name = "cryo pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit shards of frozen angry robots into the bad guys. \
		While it doesn't manipulate temperature in and of itself, it does cause an internal explosion in anyone who is severely hot. Able to generate \
		ammunition by manually spinning the weapon's nanite canister."
	icon_state = "cryopistol"
	ammo_type = list(/obj/item/ammo_casing/energy/nanite/cryo)
