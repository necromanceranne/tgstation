/datum/job/medsci
	title = JOB_MEDSCI_SPECIALIST
	description = "An experienced specialist in biotech, research and medical science. \
		Ensure the crew remains healthy and provide technological advancements to the crew."
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#8857D6"
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MEDSCI"

	outfit = /datum/outfit/job/medsci
	plasmaman_outfit = /datum/outfit/plasmaman

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SCI

	liver_traits = list(TRAIT_ROYAL_METABOLISM) // finally upgraded

	display_order = JOB_DISPLAY_ORDER_MEDSCI
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/medical,
		/datum/job_department/science,
		/datum/job_department/command,
		)
	family_heirlooms = list(/obj/item/toy/plush/slimeplushie)
	mail_goodies = list(
		/obj/item/healthanalyzer/advanced = 15,
		/obj/item/scalpel/advanced = 6,
		/obj/item/retractor/advanced = 6,
		/obj/item/cautery/advanced = 6,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 6,
		/obj/effect/spawner/random/medical/organs = 5,
		/obj/effect/spawner/random/medical/memeorgans = 1,
		/obj/item/raw_anomaly_core/random = 10,
		/obj/item/disk/tech_disk/spaceloot = 2,
		/obj/item/camera_bug = 1
	)
	rpg_title = "Mystic Theurge"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN
	ignore_human_authority = TRUE

/datum/outfit/job/medsci
	name = "Medical Science Specialist"
	jobtype = /datum/job/medsci
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		/obj/item/defibrillator/compact = 1,
		/obj/item/reagent_containers/hypospray/cmo = 1,
	)
	id_trim = /datum/id_trim/job/medsci
	id = /obj/item/card/id/advanced/silver
	uniform = /obj/item/clothing/under/rank/rnd/research_director/turtleneck
	belt = /obj/item/modular_computer/tablet/pda/heads/medsci
	neck = /obj/item/clothing/neck/stethoscope
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/hud/health
	gloves = /obj/item/clothing/gloves/color/latex
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/armband/science
	l_hand = /obj/item/storage/medkit/surgery

	chameleon_extras = /obj/item/stamp/cmo

