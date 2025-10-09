/obj/item/gun/energy/laser
	name = "laser gun"
	desc = "The Type 5 Heat Delivery System, developed by Nanotrasen. The workhorse of Nanotrasen's security forces."
	icon_state = "laser"
	inhand_icon_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = TRUE

/obj/item/gun/energy/laser/Initialize(mapload)
	. = ..()
	// Only actual lasguns can be converted
	if(type != /obj/item/gun/energy/laser)
		return
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/xraylaser, /datum/crafting_recipe/hellgun, /datum/crafting_recipe/ioncarbine)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)
	add_deep_lore()

/obj/item/gun/energy/laser/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 18, \
		overlay_y = 12)

/obj/item/gun/energy/laser/practice
	name = "practice laser gun"
	desc = "A modified version of the Type 5 laser gun. Fires entirely harmless bolts of directed energy. Safe AND entertaining to fire with abandon."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = FALSE
	item_flags = NONE
	gun_flags = NOT_A_REAL_GUN

/obj/item/gun/energy/laser/practice/add_deep_lore()
	return

/obj/item/gun/energy/laser/retro
	name ="\improper Type 1 laser gun"
	desc = "An older model of the Type 5 laser gun. No longer used by Nanotrasen's private security or military forces. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	icon_state = "retro"
	ammo_x_offset = 3

/obj/item/gun/energy/laser/carbine
	name = "laser carbine"
	desc = "The fully automatic Type C1 Rapid Heat Delivery System. Capable of firing a sustained volley of directed energy projectiles, though each individual projectile lacks the punch of the Type 5."
	icon_state = "laser_carbine"
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/carbine)

/obj/item/gun/energy/laser/carbine/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS, allow_akimbo = FALSE)

/obj/item/gun/energy/laser/carbine/donk
	name = "\improper 'Donk-Bashed' laser carbine"
	desc = "A modified Type C1. Seems like Donk Co. got their mitts on a laser carbine and utterly butchered it. Perhaps out of spite?"
	icon_state = "donkbashed"
	inhand_icon_state = "donkbashed"
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/carbine/donk)
	spread = 14
	pin = /obj/item/firing_pin/implant/pindicate

/obj/item/gun/energy/laser/carbine/donk/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/energy/laser/carbine/practice
	name = "practice laser carbine"
	desc = "A modified version of the Type C1 laser carbine. Fires entirely harmless bolts of directed energy. Safe AND entertaining to fire with abandon."
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/carbine/practice)
	clumsy_check = FALSE
	item_flags = NONE
	gun_flags = NOT_A_REAL_GUN

/obj/item/gun/energy/laser/carbine/practice/add_deep_lore()
	return

/obj/item/gun/energy/laser/retro/old
	desc = "The NT Type 1 Heat Delivery System, developed by Nanotrasen. Although, this one looks downright ancient. What the hell happened to it?"
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/old)
	ammo_x_offset = 3

/obj/item/gun/energy/laser/retro/old/add_deep_lore()
	return

/obj/item/gun/energy/laser/hellgun
	name = "hellfire laser gun"
	desc = "The Type 2 Heat Delivery System, developed by Nanotrasen. Technically speaking, it is an improvement. Legally speaking, possession of this weapon is restricted in most occupied sectors of space. \
		The Type 2 is notorious for its ability to render victims a carbonized husk with ease, melting flesh and bone as easily as butter. A painful, gruesome death awaits anyone on the wrong ends of this gun."
	icon_state = "hellgun"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire)

/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with assistant leather and chrome. The object menaces with spikes of energy. On the item is an image of Space Station 13. The station is exploding."
	icon_state = "caplaser"
	w_class = WEIGHT_CLASS_NORMAL
	inhand_icon_state = null
	force = 10
	ammo_x_offset = 3
	selfcharge = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire)

/obj/item/gun/energy/laser/captain/scattershot
	name = "scatter shot laser rifle"
	desc = "An industrial-grade heavy-duty laser rifle with a modified laser lens to scatter its shot into multiple smaller lasers. The inner-core can self-charge for theoretically infinite use."
	icon_state = "lasercannon"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "laser"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)
	shaded_charge = FALSE

/obj/item/gun/energy/laser/captain/scattershot/add_deep_lore()
	return

/obj/item/gun/energy/laser/cyborg
	can_charge = FALSE
	desc = "An energy-based laser gun that draws power from the cyborg's internal energy cell directly. So this is what freedom looks like?"
	use_cyborg_cell = TRUE

/obj/item/gun/energy/laser/cyborg/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)

/obj/item/gun/energy/laser/cyborg/add_deep_lore()
	return

/obj/item/gun/energy/laser/scatter
	name = "scatter laser gun"
	desc = "A laser gun equipped with a refraction kit that spreads bolts."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/laser/scatter/add_deep_lore()
	return

/obj/item/gun/energy/laser/scatter/shotty
	name = "energy shotgun"
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "cshotgun"
	inhand_icon_state = "shotgun"
	desc = "A combat shotgun gutted and refitted with an internal laser system. Can switch between taser and scattered disabler shots."
	shaded_charge = FALSE
	pin = /obj/item/firing_pin/implant/mindshield
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter/disabler, /obj/item/ammo_casing/energy/electrode)
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/laser/scatter/add_deep_lore()
	return

///Laser Cannon

/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is."
	icon_state = "lasercannon"
	inhand_icon_state = "laser"
	worn_icon_state = null
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	pin = null
	ammo_x_offset = 3

///X-ray gun

/obj/item/gun/energy/laser/xray
	name = "\improper X-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated X-ray blasts that pass through multiple soft targets and heavier materials."
	icon_state = "xray"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/xray)
	ammo_x_offset = 3
	shaded_charge = FALSE

////////Laser Tag////////////////////

/obj/item/gun/energy/laser/bluetag
	name = "laser tag gun"
	icon_state = "bluetag"
	desc = "A retro laser gun modified to fire harmless blue beams of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/blue
	ammo_x_offset = 2
	selfcharge = TRUE
	gun_flags = NOT_A_REAL_GUN

/obj/item/gun/energy/laser/bluetag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag/hitscan)

/obj/item/gun/energy/laser/bluetag/add_deep_lore()
	return

/obj/item/gun/energy/laser/redtag
	name = "laser tag gun"
	icon_state = "redtag"
	desc = "A retro laser gun modified to fire harmless beams red of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = TRUE
	gun_flags = NOT_A_REAL_GUN

/obj/item/gun/energy/laser/redtag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag/hitscan)

/obj/item/gun/energy/laser/redtag/add_deep_lore()
	return

// luxury shuttle funnies
/obj/item/firing_pin/paywall/luxury
	multi_payment = TRUE
	owned = TRUE
	payment_amount = 20

/obj/item/gun/energy/laser/luxurypaywall
	name = "luxurious laser gun"
	desc = "A laser gun modified to cost 20 credits to fire. Point towards poor people."
	pin = /obj/item/firing_pin/paywall/luxury

// The Deep Lore //

// Laser Gun

/obj/item/gun/energy/laser/proc/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "The NT Type 5 Heat Delivery System (sometimes referred to as the HDS5 in promotional material) is what truly put Nanotrasen \
		head and shoulders above most weapon manufacturers in the modern era. All modern energy weaponry offered by the company have \
		the success of the Type 5 to thank for setting the standard for energy-based weapon platforms.<br>\
		<br>\
		Adopted as the standard infantry firearm for Nanotrasen military forces, as well as private security lethal armaments, few can deny \
		the weapon's reliability. And at an affordable price! <br>\
		<br>\
		However, the weapon platform still possesses many of the vulnerabilities of previous energy-based weaponry. Onboard power supplies \
		cannot be adequately shielded from external electromagnetic pulses that might interfere with the weapon's functionality without \
		also severely jeopardizing thermal distribution into the weapon's heatsink. The Type 4, which never saw wider adoption, remains a \
		haunting example to Nanotrasen's weapons division as to the consequences when a HDS is unable to expel thermal buildup safely. <br>\
		<br>\
		Certainly, the Melted Veterans of Galpha 5 advocacy group will never let them forget it." \
	)

// Retro Laser Gun

/obj/item/gun/energy/laser/retro/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "The NT Type 1 Heat Delivery System (sometimes referred to as the HDS1 in older weapon catalogs) was a weapon that \
		marked the beginning of a new era of firearm development. <br>\
		<br>\
		Invented in the thinktank laboritories of Nanotrasen's weapon development team towards the end of the 24th century, the Type 1 found \
		itself adopted broadly by various factions and military entities vying for control over the frontier once it hit the market. One \
		hallmark of those who stood successful in these conflicts were those groups that had adopted the Type 1 as a standard infantry \
		weapon. The logistics required to maintain the operational peak of the HDS1 allowed most quartermasters to merely dump a half \
		dozen of the weapons into the hands of bloodythirsty marines, knowing full well the weapons were rugged enough to survive \
		most anything thrown at them, and only needing a recharging station with a power supply to keep operational once they run empty. <br>\
		<br>\
		So many of these weapons exist today that even modern conflicts may see more usage of the HDS1 than the updated and equally \
		reliable HDS5 employed by Nanotrasen's modern combat forces. Nanotrasen, despite their best efforts, still have not managed \
		to encourage potential customers to swap for the new model despite a generous exchange discount." \
	)

// hellfire laser gun

/obj/item/gun/energy/laser/hellgun/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "The NT Type 2 Heat Delivery System (sometimes referred to as the HDS2 in legal documentation) is considered a notable \
		example of Nanotrasen flying too close to the sun for its own good. <br>\
		<br>\
		The success of the Type 1 resulted in shareholders urging marketing to bring out the 'next best thing' in energy-based weaponry. \
		At the time, Nanotrasen's weapons division had a prototype still in the works. However, there were some concerns raised amongst \
		researchers as to the 'moral implications' that might result from unleashing 'that much directed radioactive material' towards \
		a living being. Executives at the time brushed off such concerns, as there was money to be made and already ultrawealthy shareholders \
		to feed the earnings.<br>\
		<br>\
		The Type 2 was rushed onto the market within the next quarter, even before most common safety mechanisms had been properly tested and implemented.\
		Reports immediately began flooding in of horrific accidental dischargess, battlefield atrocities and unexpected spontaneous combustion \
		from excessive exposure to the untested experimental heat distribution systems 'taking its pound of flesh' for the 'hell it unleashed'.<br>\
		<br>\
		News outlets and tabloids alike railed against the company for creating what was now being called the 'hellfire' laser gun. In response, most \
		legal bodies rushed to ban the firearm from sales within their region of space, and the weapon became infamous for its unethical means of ending \
		sentient life. Laws were passed to ensure power regulators were installed in all future energy-based weaponry sold by Nanotrasen. Nanotrasen quickly \
		discontinued the Type 2 in response, and it never saw production from that day forth. However, retrofit kits still exist \
		on the black market and in some of Nanotrasen's own warehouses. While legally, it is unlawful to sell and possess a Type 2, Nanotrasen itself \
		does not regulate possession of the firearm aboard its own stations. Nor does any legal body intend on preventing them from utilizing it in defense \
		of its own assets." \
	)

// Antique Laser Gun

/obj/item/gun/energy/laser/captain/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "For a brief period, Nanotrasen produced a series of custom-made Type 2 laser guns for a select group of \
		clients. Largely, various wealthy starship captains, politicians and military leaders looking to demonstrate prestige before \
		the common folk. <br>\
		<br>\
		The Type 2 was a commercial failure, but this particular variant earned its own infamy, linked to narratives of crazed \
		despots using it to put down political rivals and dissidents. As well as tales of mad generals marching ahead of their \
		forces, this weapon brandished, running hot, in an outstretched arm towards any moving target they could find on the \
		battlefield. <br>\
		<br>\
		Copies of this firearm are now prohibited within TerraGov space, and any captured are quickly decommissioned.\
		This is largely why Nanotrasen <i>insists</i> that any examples held by ranking officers be kept under lock and key. \
		All records of the schematics surrounding this variant of the Type 2 were seized and destroyed, and the creator behind \
		it detained in a maximum security TerraGov sanitorium. When they found her, she appeared to have smeared the walls in her \
		own blood, claiming that 'She' was coming, and that she had paid dearly for the knowledge of how to make the weapon. <br\
		<br>\
		Even the microfusion breeder cell housed inside the weapon is practically a lost technology, and Nanotrasen have been unable \
		to reverse engineer the devices exact means of functionality.<br>\
		<br>\
		The Syndicate are obviously just as interested in exactly how this weapon is capable of self-perpetuation. Hence why the collective \
		seem hell-bent on capturing them whenever possible. Maybe keep this somewhere safe. Or don't." \
	)

// X-ray Laser Gun

/obj/item/gun/energy/laser/xray/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "The NT Type 6 Heat Delivery System (sometimes referred to as the HDS6 in research notes) is a breakthrough in the \
		development of directed energy weaponry. <br>\
		<br>\
		Very little is known about the Type 6, as it is a relatively new experimental weapon only accessible to Nanotrasen security forces.\
		Somehow, Nanotrasen has found a means to 'slip' the energy beams produced by the Type 6 through unintended targets, only impacting \
		once it has made contact with a pre-designated target by the weapon's user. It appears to be unable to slip past organic matter reliably, \
		which hampers its potential for eliminating friendly-fire. However, inorganic targets are left unscathed unless the weapon is directed towards \
		firing upon the object. This makes the weapon exceptional for asset recovery and defense entrenchment and assaults on defensive structures. <br>\
		<br>\
		Nanotrasen claims that this phenomenon is achieved 'through the power of X-rays'. Most critics have highlighted that this is total nonsense. Some claim \
		that Nanotrasen has discovered a yet uknown state of matter that the company is exploiting for weapons development and manufacturing. The most \
		conspiratorially minded of Nanotrasen's critics have even gone as far as to claim it is 'proof of ectoplasm as the sixth element'.\
		And that, perhaps, the weapon may be operating through supernatural means. Maybe even powered by the 'spirits of the damned'.<br>\
		<br>\
		Whatever the truth may be, the weapon seems to function as advertized, and is even more energy efficient than the Type 5. Nanotrasen \
		expects full commercial rollout sometime in the next quarter." \
	)

// Laser Carbine

/obj/item/gun/energy/laser/carbine/add_deep_lore()
	AddElement(/datum/element/examine_lore, \
		lore_hint = span_notice("You can [EXAMINE_HINT("look closer")] to learn a little more about [src]."), \
		lore = "The NT Type C1 Rapid Heat Delivery System (sometimes referred to as the RHDSC1 in briefing manuals, and 'that piece if shit flashlight' amongst \
		TGMC troopers) was a shaky first step into fully automatic directed energy weaponry. <br>\
		<br>\
		Intended for use in special operations, particularly in the hands of orbital drop shock troopers, the Type C1 was foreseen to be an excellent \
		addition to Nanotrasen's arsenal of offerings to military forces across occupied space. However, there quickly proved various problems faced \
		by the intended users of the weapon. The advantages of directed energy weapons is the lightweight impacts felt on the supply chain for logistical \
		officers and quartermasters due to the only upkeep need for the weapon is a consistent power supply, either established or brought to the front.<br>\
		<br>\
		This, however, is not a benefit that soldiers operating behind enemy lines or during tactical deployments are capable of exploiting. As a result, \
		soldiers often found themselves having discharged their weapons without a reliable way to sustain their fire past the first several volleys. <br>\
		<br>\
		Instead, the weapon found more functional use in the hands of private security teams, who enjoyed the volume of fire it provided, while maintaining \
		exceptional accuracy even at long ranges, as well as being compact enough to allow a high degree of mobility. The weapon is also often utilized by \
		rim pirates and marauders, giving the weapon something of an ill reputation. Nanotrasen is currently working on a Type C2 prototype that will hit \
		markets in the near future, hoping to address these potential problems." \
	)
