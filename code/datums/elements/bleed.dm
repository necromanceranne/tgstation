/// A simple element that allows an attached object to inflict bleed stacks on hit
/datum/element/bleed
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2

	/// The amount of bleed stacks our element does on hit
	var/bleed_stacks = 3

/datum/element/bleed/Attach(datum/target, bleed_stacks)
	. = ..()

	if (!isitem(target))
		return ELEMENT_INCOMPATIBLE

	if (!isnull(bleed_stacks))
		src.bleed_stacks = bleed_stacks

	target.AddElementTrait(TRAIT_ON_HIT_EFFECT, REF(src), /datum/element/on_hit_effect)
	RegisterSignal(target, COMSIG_ON_HIT_EFFECT, PROC_REF(do_bleeder))

/datum/element/eyestab/Detach(datum/source, ...)
	. = ..()

	UnregisterSignal(source, COMSIG_ON_HIT_EFFECT)
	REMOVE_TRAIT(source, TRAIT_ON_HIT_EFFECT, REF(src))

/datum/element/bleed/proc/do_bleeder(datum/source, mob/living/target, mob/living/user)
	SIGNAL_HANDLER

	if(!isliving(target))
		return NONE
	var/mob/living/mauled = target
	if(!(mauled.mob_biotypes & MOB_ORGANIC))
		return
	var/datum/status_effect/stacking/saw_bleed/bloodletting/bleeder = mauled.has_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting)
	if(!bleeder)
		mauled.apply_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting, bleed_stacks)
	else
		bleeder.add_stacks(bleed_stacks)

	return
