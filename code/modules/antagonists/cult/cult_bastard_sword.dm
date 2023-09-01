
/// Cult Bastard Sword, earned by cultists when they manage to sacrifice a heretic.
/obj/item/melee/cultblade/bastard
	name = "bloody bastard sword"
	desc = "An enormous sword used by Nar'Sien cultists to rapidly harvest the souls of non-believers."
	w_class = WEIGHT_CLASS_HUGE
	block_chance = 50
	throwforce = 20
	force = 35
	armour_penetration = 45
	throw_speed = 1
	throw_range = 3
	light_color = "#ff0000"
	icon_state = "cultbastard"
	inhand_icon_state = "cultbastard"
	item_flags = SLOWS_WHILE_IN_HAND
	///if we are using our attack_self ability
	var/spinning = FALSE

/obj/item/melee/cultblade/bastard/Initialize(mapload)
	. = ..()
	set_light(4)
	AddComponent(/datum/component/butchering, 50, 80)
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

	AddComponent(\
		/datum/component/soul_stealer,\
		soulstone_type = /obj/item/soulstone,\
	)

	AddComponent( \
		/datum/component/spin2win, \
		spin_cooldown_time = 25 SECONDS, \
		on_spin_callback = CALLBACK(src, PROC_REF(on_spin)), \
		on_unspin_callback = CALLBACK(src, PROC_REF(on_unspin)), \
		start_spin_message = span_danger("%USER begins swinging the sword around with inhuman strength!"), \
		end_spin_message = span_warning("%USER's inhuman strength dissipates and the sword's runes grow cold!") \
	)
	RegisterSignal(src, COMSIG_OBJECT_PRE_SPIN2WIN, PROC_REF(start_spin))
	RegisterSignal(src, COMSIG_OBJECT_PRE_SOUL_STEAL, PROC_REF(check_valid_soulsteal))

/obj/item/melee/cultblade/bastard/attack(mob/living/target, mob/living/user, params)
	if(IS_CULTIST(target) && spinning)
		return //Friendly fire protection for the spin attack
	. = ..()

/obj/item/melee/cultblade/bastard/proc/start_spin(mob/living/user)
	SIGNAL_HANDLER
	if(!ishuman(user))
		return COMPONENT_CANCEL_SPIN2WIN

	var/mob/living/carbon/human/sacrificial_chump = user
	if(!IS_CULTIST(sacrificial_chump))
		if(IS_HERETIC(sacrificial_chump))
			to_chat(sacrificial_chump, "<span class='cultlarge'>\"Send your masters my regards in your new oblivion, worm.\"</span>")
			to_chat(sacrificial_chump, span_userdanger("A horrible force yanks at your arm!"))
			INVOKE_ASYNC(sacrificial_chump, TYPE_PROC_REF(/mob/living/carbon/human, emote), "scream")
			sacrificial_chump.apply_damage(30, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
			sacrificial_chump.dropItemToGround(src, TRUE)
			sacrificial_chump.Paralyze(50)
		else
			to_chat(sacrificial_chump, "<span class='cultlarge'>\"This is no mere toy. Do not presume to make use of my tools without my permission.\"</span>")
		return COMPONENT_CANCEL_SPIN2WIN

/obj/item/melee/cultblade/bastard/proc/on_spin(mob/living/user, duration)
	var/oldcolor = user.color
	user.color = "#ff0000"
	user.add_stun_absorption(
		source = name,
		duration = duration,
		priority = 2,
		message = span_warning("%EFFECT_OWNER doesn't even flinch as the sword's power courses through [user.p_them()]!"),
		self_message = span_boldwarning("You shrug off the stun!"),
		examine_message = span_warning("%EFFECT_OWNER_THEYRE glowing with a blazing red aura!"),
	)
	user.spin(duration, 1)
	animate(user, color = oldcolor, time = duration, easing = EASE_IN)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/atom, update_atom_colour)), duration)
	slowdown += 1.5
	spinning = TRUE

/obj/item/melee/cultblade/bastard/proc/on_unspin(mob/living/user)
	slowdown -= 1.5
	spinning = FALSE

/obj/item/melee/cultblade/bastard/proc/check_valid_soulsteal(mob/living/victim, mob/living/captor)
	SIGNAL_HANDLER

	if(IS_CULTIST(victim) || !IS_CULTIST(captor))
		return COMPONENT_CANCEL_SOUL_STEAL

/obj/item/melee/cultblade/bastard/IsReflect(def_zone)
	if(!spinning)
		return FALSE
	return TRUE

/obj/item/melee/cultblade/bastard/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(spinning)
		final_block_chance *= 2
	if(IS_CULTIST(owner) && prob(final_block_chance))
		new /obj/effect/temp_visual/cult/sparks(get_turf(owner))
		owner.visible_message(span_danger("[owner] parries [attack_text] with [src]!"))
		return TRUE
	else
		return FALSE
