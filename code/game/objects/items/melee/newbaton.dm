/obj/item/melee/tonfa
	name = "tonfa"
	desc = "A wooden truncheon for self defense."
	icon = 'icons/obj/weapons/transforming_tonfa.dmi'
	icon_state = "electric_tonfa"
	inhand_icon_state = "classic_baton"
	worn_icon_state = "classic_baton"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 15 //5 hit crit
	w_class = WEIGHT_CLASS_NORMAL
	wound_bonus = 15
	///Determines our active effects
	var/active_force = 40 //3 hit stamina crit
	var/active_damage_type = STAMINA
	var/on_stun_sound = 'sound/effects/woodhit.ogg'

/obj/item/melee/tonfa/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/transforming, \
		force_on = active_force, \
		hitsound_on = on_stun_sound, \
		damage_type_on = active_damage_type,)
