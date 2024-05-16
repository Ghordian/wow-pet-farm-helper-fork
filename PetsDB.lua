
PFH_DB_BOSSES = {
		[9736]  = { name = "Quartermaster Zigris" },
	--[10596] = { name = "Mother Smolderweb" },
	--[11982] = { name = "Magmadar" },
	--[11988] = { name = "Golemagg the Incinerator" },
	--[12017] = { name = "Broodlord Lashlayer" },
	--[12098] = { name = "Sulfuron Harbinger" },
	--[12435] = { name = "Razorgore the Untamed" },
	--[14020] = { name = "Chromaggus" },
	--[15263] = { name = "The Prophet Skeram" },
	--[15276] = { name = "Emperor Vek'lor" },
	--[15299] = { name = "Viscidus" },
	--[15688] = { name = "Terestian Illhoof" },
	--[15690] = { name = "Prince Malchezaar" },
	--[15691] = { name = "The Curator" },
	--[15932] = { name = "Gluth" },
	--[15952] = { name = "Maexxna" },
	--[16011] = { name = "Loatheb" },
	--[17521] = { name = "The Big Bad Wolf"           , raid = "Opera Event" },
	--[17808] = { name = "Anetheron" },
	--[17842] = { name = "Azgalor" },
	--[17968] = { name = "Archimonde" },
	--[18805] = { name = "High Astromancer Solarian" },
	--[19514] = { name = "Al'ar" },
	--[19516] = { name = "Void Reaver" },
	--[21212] = { name = "Lady Vashj" },
	--[21213] = { name = "Morogrim Tidewalker" },
		[21216] = { name = "Hydross the Unstable" },
	--[22887] = { name = "High Warlord Naj'entus" },
		[22898] = { name = "Supremus" },
		[22947] = { name = "Mother Shahraz" },
		[23420] = { name = "Essence of Anger"           , raid = "Reliquary of Souls" },
		[24664] = { name = "Kael'thas Sunstrider" },
		[24882] = { name = "Brutallus" },
		[25165] = { name = "Lady Sacrolash"             , raid = "The Eredar Twins" },
		[25166] = { name = "Grand Warlock Alythess"     , raid = "The Eredar Twins" },
		[25840] = { name = "Entropius"                  , raid = "M'uru" },
		[32845] = { name = "Hodir" },
		[32857] = { name = "Stormcaller Brundir"        , raid = "Assembly of Iron" },
		[32867] = { name = "Steelbreaker"               , raid = "Assembly of Iron" },
		[32906] = { name = "Freya" },
		[32927] = { name = "Runemaster Molgeim"         , raid = "Assembly of Iron" },
		[33118] = { name = "Ignis the Furnace Master" },
		[33186] = { name = "Razorscale" },
		[33288] = { name = "Yogg-Saron" },
		[33350] = { name = "Mimiron" },
		[33515] = { name = "Auriaya" },
		[34564] = { name = "Anub'arak" },
		[34799] = { name = "Dreadscale"                 , raid = "Northrend Beasts" },
		[35144] = { name = "Acidmaw"                    , raid = "Northrend Beasts" },
		[36597] = { name = "The Lich King" },
		[36612] = { name = "Lord Marrowgar" },
		[36678] = { name = "Professor Putricide" },
		[36853] = { name = "Sindragosa" },
		[37813] = { name = "Deathbringer Saurfang" },

		[200960] = { name = "Warden Entrix"},						-- Warden Entrix <Hand of Lapisagos>, Forbidden Reach
		[201673] = { name = "Kretchenwrath" },					-- Kretchenwrath <Disciple of Fyrakk>
		[203411] = { name = "Shadeisethal" },						-- Shadeisethal <Disciple of Fyrakk>
		[203625] = { name = "Karokta" },								-- Karokta
		[203750] = { name = "Primalist Iceslinger" },		-- Primalist Iceslinger
		[200742] = { name = "Luttrok" },								-- Luttrok
		[200681] = { name = "Bonesifter Marwak" },			-- bonesifter-marwak
	--[203746] = { name = "Primalist Stormslinger" },	-- primalist-stormslinger
		[203740] = { name = "Primalist Landshaker" },		-- primalist-landshaker
	--[215146] = { name = "Dr. Boom" },								-- Dr. Boom <"Dr. 7">
	--[203462] = { name = "Kob'rok" },								-- Kob'rok
	--[203468] = { name = "Aquifon" },								-- Aquifon
	--[203753] = { name = "Primalist Flamestriker" },	-- Primalist Flamestriker
	--[205490] = { name = "Treasure Goblin" },				-- Treasure Goblin
	--[200584] = { name = "Vraken the Hunter" },			-- Vraken the Hunter
	--[203593] = { name = "Underlight Queen" },				-- Underlight Queen

	--[165686] = { name = "Ashen Amalgamation" },

}

PFH_DB_ZONES = {
	--[721] = { map  = "Hall of Blackhand" },  -- 1583 - sala de puño negro
	--[775] = { raid = "The Battle for Mount Hyjal" },-- 3606/hyjal-summit
	--[780] = { raid = "Coilfang: Serpentshrine Cavern" },
	--[789] = { raid = "The Sunwell" },
	--[798] = { raid = "Magister's Terrace" },
}

-- https://www.wowhead.com/items/miscellaneous/companions 
-- 1061 total
-- source type == drop
-- https://www.wowhead.com/items/miscellaneous/companions?filter=128;4;0
-- 571 sub-total

PFH_DB_PETS = {
	--[7545] = 
		[8498] = {--drop - feralas - 39384/noxious-whelp
			npc_id = 7545,
				from = {
						{		type = 'world', npc_id = 39384,
								zone_id = 357, -- feralas
								level = 30, for_sort = 1,
						},
				},
		},
		[12264] = { -- Worg Carrier
				npc_id = 10259,
				from = {
						{		type = 'dungeon', npc_id = 9736, -- rare elite
								zone_id = 1583, -- Cumbre de Roca Negra [721]
								level = 31, for_sort = 63,
						},
				},
		},
		[35504] = { -- Phoenix Hatchling
				npc_id = 26119,
				from = {
						{		type = 'dungeon', npc_id = 24664, -- kaelthas-caminante-del-sol
								zone_id = 4131, -- bancal-del-magister [798]
								level = 30, for_sort = 115,
						},
				},
		},
		[68673] = { -- Smolderweb Egg
				npc_id = 10598,
				from = {
						{		type = 'dungeon', npc_id = 10596,
								zone_id = 1583, -- Cumbre de Roca Negra [721]
								level = 30, for_sort = 60,
						},
				},
		},
		[93029] = { -- Gluth's Bone - 5.1.0
				npc_id = 68654,
				from = {
						{		type = 'raid', npc_id = 15932,
								zone_id = 3456, -- naxxramas [535]
								level = 30, for_sort = 200,
						},
				},
		},
		[93030] = { -- Dusty Clutch of Eggs
				npc_id = 68656,
				from = {
						{		type = 'raid', npc_id = 15952, -- gluth
								zone_id = 3456, -- naxxramas [535]
								level = 30, for_sort = 200,
						},
				},
		},
		[93032] = { -- Blighted Spore
				npc_id = 68657,
				from = {
						{		type = 'raid', npc_id = 16011,
								zone_id = 3456, -- naxxramas [535]
								level = 30, for_sort = 200,
						},
				},
		},
		[93033] = { -- Mark of Flame
				npc_id = 68665,
				from = {
						{		type = 'raid', npc_id = 12098,
								zone_id = 2717, -- núcleo-de-magma [696]
								level = 30, for_sort = 66,
						},
				},
		},
		[93034] = { -- Blazing Rune
				npc_id = 68664,
				from = {
						{		type = 'raid', npc_id = 11982,
								zone_id = 2717, -- núcleo-de-magma [696]
								level = 30, for_sort = 71,
						},
				},
		},
		[93035] = { -- Core of Hardened Ash
				npc_id = 68666,
				from = {
						{		type = 'raid', npc_id = 11988,
								zone_id = 2717, -- núcleo-de-magma [696]
								level = 30, for_sort = 71,
						},
				},
		},
		[93036] = { -- Unscathed Egg
				npc_id = 68661,
				from = {
						{		type = 'raid', npc_id = 12435,
								zone_id = 2677, -- Guarida de Alanegra [755]
								level = 30, for_sort = 76,
						},
				},
		},
		[93037] = { -- Blackwing Banner
				npc_id = 68663,
				from = {
						{		type = 'raid', npc_id = 12017,
								zone_id = 2677, -- Guarida de Alanegra [755]
								level = 30, for_sort = 76,
						},
				},
		},
		[93038] = { -- Whistle of Chromatic Bone
				npc_id = 68662,
				from = {
						{		type = 'raid', npc_id = 14020,
								zone_id = 2677, -- Guarida de Alanegra [755]
								level = 30, for_sort = 77,
						},
				},
		},
		[93039] = { -- Viscidus Globule
				npc_id = 68660,
				from = {
						{		type = 'raid', npc_id = 15299,
								zone_id = 3428, -- ahnqiraj [766]
								level = 30, for_sort = 78,
						},
				},
		},
		[93040] = { -- Anubisath Idol
				npc_id = 68659,
				from = {
						{		type = 'raid', npc_id = 15276,
								zone_id = 3428, -- ahnqiraj [766]
								level = 30, for_sort = 81,
						},
				},
		},
		[93041] = { -- Jewel of Maddening Whispers
				npc_id = 68658,
				from = {
						{
								type = 'raid', npc_id = 15263,
								zone_id = 3428, -- ahnqiraj [766]
								level = 30, for_sort = 75,
						},
				},
		},
		[97548] = { -- Spiky Collar
				npc_id = 71014,
				from = {
						{
								type = 'raid', npc_id = 17521,
								zone_id = 3457, -- Karazhan [799]
								level = 30, for_sort = 115,
						},
				},
		},
		[97549] = { -- Instant Arcane Sanctum Security Kit
				npc_id = 71015,
				from = {
						{
								type = 'raid', npc_id = 15691,
								zone_id = 3457, -- Karazhan [799]
								level = 30, for_sort = 115,
						},
				},
		},
		[97550] = { -- Netherspace Portal-Stone
				npc_id = 71016,
				from = {
						{
								type = 'raid', npc_id = 15690,
								zone_id = 3457, -- Karazhan [799]
								level = 30, for_sort = 125,
						},
				},
		},
		[97551] = { -- Satyr Charm
				npc_id = 71033,
				from = {
						{
								type = 'raid', npc_id = 15688,
								zone_id = 3457, -- Karazhan [799]
								level = 30, for_sort = 115,
						},
				},
		},
		[97552] = { -- Shell of Tide-Calling
				npc_id = 71017,
				from = {
						{
								type = 'raid', npc_id = 21213,
								zone_id = 3607, -- Caverna Santuario Serpiente [780]
								level = 35, for_sort = 134,
						},
				},
		},
		[97553] = { -- Tainted Core
				npc_id = 71018,
				from = {
						{
								type = 'raid', npc_id = 21216,
								zone_id = 3607, -- Caverna Santuario Serpiente [780]
								level = 35, for_sort = 128,
						},
				},
		},
		[97554] = { -- Dripping Strider Egg
				npc_id = 71019,
				from = {
						{
								type = 'raid', npc_id = 21212,
								zone_id = 3607, -- Caverna Santuario Serpiente
								level = 35, for_sort = 141,
						},
				},
		},
		[97555] = { -- Tiny Fel Engine Key
				npc_id = 71020,
				from = {
						{
								type = 'raid', npc_id = 19516,
								zone_id = 3845, -- El Castillo de la Tempestad [782]
								level = 30, for_sort = 128,
						},
				},
		},
		[97556] = { -- Crystal of the Void
				npc_id = 71021,
				from = {
						{
								type = 'raid', npc_id = 18805,
								zone_id = 3845, -- El Castillo de la Tempestad [782]
								level = 30, for_sort = 134,
						},
				},
		},
		[97557] = { -- Brilliant Phoenix Hawk Feather
				npc_id = 71022,
				from = {
						{
								type = 'raid', npc_id = 19514,
								zone_id = 3845, -- El Castillo de la Tempestad [782]
								level = 30, for_sort = 134,
						},
				},
		},
		[122104] = { -- Leviathan Egg
				npc_id = 90201,
				from = {
						{
								type = 'raid', npc_id = 22887,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122105] = { -- Grotesque Statue
				npc_id = 90200,
				from = {
						{
								type = 'raid', npc_id = 17842, -- azgalor
								zone_id = 3606, -- la-cima-hyjal [775]
								level = 30, for_sort = 141,
						},
				},
		},
		[122106] = { -- Shard of Supremus
				npc_id = 90202,
				from = {
						{
								type = 'raid', npc_id = 22898,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122107] = { -- Fragment of Anger
				npc_id = 90203,
				from = {
						{
								type = 'raid', npc_id = 23420,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122108] = { -- Fragment of Suffering
				npc_id = 90204,
				from = {
						{
								type = 'raid', npc_id = 23420,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122109] = { -- Fragment of Desire
				npc_id = 90205,
				from = {
						{
								type = 'raid', npc_id = 23420,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122110] = { -- Sultry Grimoire
				npc_id = 90206,
				from = {
						{
								type = 'raid', npc_id = 22947,
								zone_id = 3959, -- black-temple [796]
								level = 30, for_sort = 141,
						},
				},
		},
		[122111] = { -- Smelly Gravestone
				npc_id = 90207,
				from = {
						{
								type = 'raid', npc_id = 17808,
								zone_id = 3606, -- la-cima-hyjal [775]
								level = 30, for_sort = 141,
						},
				},
		},
		[122112] = { -- Hyjal Wisp
				npc_id = 90208,
				from = {
						{
								type = 'raid', npc_id = 17968,
								zone_id = 3606, -- la-cima-hyjal [775]
								level = 30, for_sort = 151,
						},
				},
		},
		[122113] = { -- Sunblade Rune of Activation
				npc_id = 90212,
				from = {
						{
								type = 'raid', npc_id = 24882,
								zone_id = 4075, -- Meseta de La Fuente del Sol [789]
								level = 30, for_sort = 159,
						},
				},
		},
		[122114] = { -- Void Collar
				npc_id = 90213,
				from = {
						{
								type = 'raid', npc_id = 25840,
								zone_id = 4075, -- Meseta de La Fuente del Sol [789]
								level = 30, for_sort = 159,
						},
				},
		},
		[122115] = { -- Servant's Bell
				npc_id = 90214,
				from = {
						{
								type = 'raid', npc_id = 25165,
								zone_id = 4075, -- Meseta de La Fuente del Sol [789]
								level = 30, for_sort = 159,
						},
						{
								type = 'raid', npc_id = 25166,
								zone_id = 4075, -- Meseta de La Fuente del Sol [789]
								level = 30, for_sort = 159,
						},
				},
		},
		[142094] = { -- Fragment of Frozen Bone
				npc_id = 115146,
				from = {
						{
								type = 'raid', npc_id = 36612,
								zone_id = 188, -- Icecrown Citadel - The Lower Citadel, 4812
								level = 30, for_sort = 251,
						},
				},
		},
		[142095] = { -- Remains of a Blood Beast
				npc_id = 115147,
				from = {
						{
								type = 'raid', npc_id = 37813,
								zone_id = 189, -- Icecrown Citadel - Deathbringer's Rise, 4812
								level = 30, for_sort = 251,
						},
				},
		},
		[142096] = { -- Putricide's Alchemy Supplies
				npc_id = 115148,
				from = {
						{
								type = 'raid', npc_id = 36678,
								zone_id = 190, -- Icecrown Citadel - The Upper Reaches, 4812
								level = 30, for_sort = 251,
						},
				},
		},
		[142097] = { -- Skull of a Frozen Whelp
				npc_id = 115149,
				from = {
						{
								type = 'raid', npc_id = 36853,
								zone_id = 189, -- Icecrown Citadel - The Frost Queen's Lair, 4812
								level = 30, for_sort = 251,
						},
				},
		},
		[142098] = { -- Drudge Remains
				npc_id = 115150,
				from = {
						{
								type = 'raid', npc_id = 36597,
								zone_id = 192, -- Icecrown Citadel - The Frozen Throne, AreaID=4812, UiMapID=192
								level = 30, for_sort = 258,
						},
				},
		},
		[142099] = { -- Call of the Frozen Blade
				npc_id = 115152,
				from = {
						{
								type = 'raid', npc_id = 36597,
								zone_id = 192, -- Icecrown Citadel - The Frozen Throne, 4812
								level = 30, for_sort = 258,
						},
				},
		},
		[142085] = { -- Nerubian Relic
				npc_id = 115137,
				from = {
						{
								type = 'raid', npc_id = 34564,
								zone_id = 4722, -- trial-of-the-crusader, 543
								level = 30, for_sort = 232,
						},
				},
		},
		[142083] = { -- Giant Worm Egg
				npc_id = 115135,
				from = {
						{
								type = 'raid', npc_id = 35144,
								zone_id = 4722, -- trial-of-the-crusader, 543
								level = 30, for_sort = 232,
						},
						{
								type = 'raid', npc_id = 34799,
								zone_id = 4722, -- trial-of-the-crusader, 543
								level = 30, for_sort = 232,
						},
				},
		},
		[142086] = { -- Red-Hot Coal
				npc_id = 115138,
				from = {
						{
								type = 'raid', npc_id = 33118,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142087] = { -- Ironbound Collar
				npc_id = 115139,
				from = {
						{
								type = 'raid', npc_id = 33186,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142088] = { -- Stormforged Rune
				npc_id = 115140,
				from = {
						{
								type = 'raid', npc_id = 32857,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
						{
								type = 'raid', npc_id = 32867,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
						{
								type = 'raid', npc_id = 32927,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142089] = { -- Glittering Ball of Yarn
				npc_id = 115141,
				from = {
						{
								type = 'raid', npc_id = 33515,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142090] = { -- Ominous Pile of Snow
				npc_id = 115142,
				from = {
						{
								type = 'raid', npc_id = 32845,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142091] = { -- Blessed Seed
				npc_id = 115143,
				from = {
						{
								type = 'raid', npc_id = 32906,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142092] = { -- Overcomplicated Controller
				npc_id = 115144,
				from = {
						{
								type = 'raid', npc_id = 33350,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},
		[142093] = { -- Wriggling Darkness
				npc_id = 115145,
				from = {
						{
								type = 'raid', npc_id = 33288,
								zone_id = 4722, -- trial-of-the-crusader, 529,
								level = 30, for_sort = 219,
						},
				},
		},

	-- 

		[86563] = { -- [64633] = 86563;
				npc_id = 64633, -- 
				from = {
						{		type = 'world', npc_id = 50776, -- Nalash Verdantis
								zone_id = 6138, -- Desierto del Pavor
								level = 35, for_sort = 1,
						},
				},
		},
		[86564] = { -- [64634] = 86564;
				npc_id = 64634, -- 
				from = {
						{		type = 'world', npc_id = 50347, -- karr-el-oscurecedor
								zone_id = 6138, -- Desierto del Pavor
								level = 35, for_sort = 1,
						},
				},
		},
		[64403] = { -- [48641] = 64403;
				npc_id = 48641, -- 
				from = {
						{		type = 'world', npc_id = 47676, -- zorro-de-baradin
								zone_id = 5389, -- Península de Tol Barad
								level = 35, for_sort = 1,
						},
				},
		},
		[64494] = { -- [48982] = 64494;
				npc_id = 48982, -- Tiny Shale Spider
				from = {
						{		type = 'world', npc_id = 49822, -- Jadefang
								zone_id = 5042, -- Infralar
								level = 35, for_sort = 1,
						},
				},
		},

	-- Mists of Pandaria 

		[80008] = { -- conejo-de-la-luna-negra
				npc_id = 59358, -- 
				from = {
						{		type = 'world', npc_id = 58336, -- Darkmoon Rabbit
								zone_id = 5861, -- isla-luna-negra
								level = 72, for_sort = 1,
						},
				},
		},
		[101570] = { -- [72160] = 101570;
				npc_id = 72160, -- 
				from = {
						{		type = 'world', npc_id = 71992, -- Moonfang
								zone_id = 5861, -- isla-luna-negra
								level = 72, for_sort = 1,
						},
				},
		},
		[104168] = { -- [73366] = 104168;
				npc_id = 73366, -- Spineclaw Crab
				from = {
						{		type = 'world', npc_id = 73166, -- Monstrous Spineclaw
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[104167] = { -- [73367] = 104167;
				npc_id = 73367, -- 
				from = {
						{		type = 'world', npc_id = 71919, -- zhu-gon-el-agrio
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[104159] = { -- [73356] = 104159;
				npc_id = 73356, -- 
				from = {
						{		type = 'world', npc_id = 73282, -- Garnia
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[97959] = { -- [71199] = 97959;
				npc_id = 71199, -- 
				from = {
						{		type = 'raid', npc_id = 69017, -- primordius
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[104165] = { -- [73354] = 104165;
				npc_id = 73354, -- 
				from = {
						{		type = 'raid', npc_id = 71154, -- karoz-la-langosta
								zone_id = 6738, -- Asedio de Orgrimmar
								level = 35, for_sort = 1,
						},
				},
		},
		[104307] = { -- [73738] = 104307;
				npc_id = 73738, -- Jadefire Spirit
				from = {
						{		type = 'world', npc_id = 72769, -- Spirit of Jadefire
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[94126] = { -- [69796] = 94126;
				npc_id = 69796, -- 
				from = {
						{		type = 'world', npc_id = 70008, -- demosaurio-primigenio
								zone_id = 6661, -- Isla de los Gigantes
								level = 35, for_sort = 1,
						},
				},
		},
		[94124] = { -- [69778] = 94124;
				npc_id = 69778, -- Sunreaver Micro-Sentry
				from = {
						{		type = 'world', npc_id = 50358, -- Haywire Sunreaver Construct
								zone_id = 6507, -- Isla del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[94574] = { -- [70083] = 94574;
				npc_id = 70083, -- 
				from = {
						{		type = 'raid', npc_id = 68476, -- horridonte
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[95422] = { -- [70451] = 95422;
				npc_id = 70451, -- 
				from = {
						{		type = 'world', npc_id = 69925, -- dinomántico-zandalari
								zone_id = 6661, -- Isla de los Gigantes
								level = 35, for_sort = 1,
						},
				},
		},
		[104169] = { -- [73359] = 104169;
				npc_id = 73359, -- 
				from = {
						{		type = 'world', npc_id = 72775, -- buffo
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[94152] = { -- [69820] = 94152;
				npc_id = 69820, -- 
				from = {
						{		type = 'raid', npc_id = 69427, -- animus-oscuro
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[94835] = { -- [70144] = 94835;
				npc_id = 70144, -- 
				from = {
						{		type = 'raid', npc_id = 69712, -- ji-kun
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[104156] = { -- [73533] = 104156;
				npc_id = 73533, -- Ashleaf Spriteling
				from = {
						{		type = 'world', npc_id = 73277, -- Leafmender
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[104161] = { -- [73364] = 104161;
				npc_id = 73364, -- Death Adder Hatchling
				from = {
						{		type = 'world', npc_id = 73163, -- Imperial Python
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[97961] = { -- [71201] = 97961;
				npc_id = 71201, -- Half-Empty Food Container
				from = {
						{		type = 'world', npc_id = 69251, -- Quivering Filth
								zone_id = 6507, -- Isla del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[104160] = { -- [73532] = 104160;
				npc_id = 73532, -- Dandelion Frolicker
				from = {
						{		type = 'world', npc_id = 71823, -- Nice Sprite
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[104164] = { -- [73355] = 104164;
				npc_id = 73355, -- Jademist Dancer
				from = {
						{		type = 'world', npc_id = 72767, -- Jademist Dancer
								zone_id = 6757, -- Isla Intemporal
								level = 35, for_sort = 1,
						},
				},
		},
		[94125] = { -- [69748] = 94125;
				npc_id = 69748, -- Living Sandling
				from = {
						{		type = 'world', npc_id = 69944, -- Sand Elemental
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[94595] = { -- [70098] = 94595;
				npc_id = 70098, -- 
				from = {
						{		type = 'world', npc_id = 66467, -- G'nathus
								zone_id = 5842, -- 
								level = 35, for_sort = 1,
						},
				},
		},
		[94573] = { -- [70154] = 94573; 5.2.0
				npc_id = 70154, -- 
				from = {
						{		type = 'world', npc_id = 70018, -- cuernoatroz-primigenio
								zone_id = 6661, -- Isla de los Gigantes
								level = 35, for_sort = 1,
						},
				},
		},
		[95423] = { -- [70452] = 95423;
				npc_id = 70452, -- 
				from = {
						{		type = 'world', npc_id = 69925, -- dinomántico-zandalari
								zone_id = 6661, -- Isla de los Gigantes
								level = 35, for_sort = 1,
						},
				},
		},
		[95424] = { -- [70453] = 95424; - 5.2.0
				npc_id = 70453, -- 
				from = {
						{		type = 'world', npc_id = 70014, -- prole-de-cuernoatroz-primigenio
								zone_id = 6661, -- Isla de los Gigantes
								level = 35, for_sort = 1,
						},
				},
		},
		[97960] = { -- [71200] = 97960; -- 5.3.0
				npc_id = 71200, -- 
				from = {
						{		type = 'raid', npc_id = 69017, -- primordius
								zone_id = 6622, -- Solio del Trueno
								level = 35, for_sort = 1,
						},
				},
		},
		[104158] = { -- [73352] = 104158;
				npc_id = 73352, -- 
				from = {
						{		type = 'raid', npc_id = 71504, -- asediador-mechanegra
								zone_id = 6738, -- asedio-de-orgrimmar
								level = 35, for_sort = 1,
						},
				},
		},
		[104166] = { -- [73357] = 104166; -- 5.4.0
				npc_id = 73357, -- Ominous Flame
				from = {
						{		type = 'world', npc_id = 73162, -- Foreboding Flame
								zone_id = 6757, -- 
								level = 35, for_sort = 1,
						},
				},
		},
		[104291] = { -- [73730] = 104291; - 5.4.0
				npc_id = 73730, -- Swarmling of Gu'chi
				from = {
						{		type = 'world', npc_id = 72909, -- Gu'chi the Swarmbringer
								zone_id = 6757, -- 
								level = 35, for_sort = 1,
						},
				},
		},

	-- Warlords of Draenor

		[117528] = { -- Lanticore Spawnling
			npc_id = 86532,
			from = {
				{	type = 'dungeon', npc_id = 77081, -- la-lantícora
					zone_id = 7307, -- Cumbre de Roca Negra Superior
					level = 40, for_sort = 1,
				--class = 'rare'
				},
			},
		},
		[113554] = { -- 
				npc_id = 83562, -- 
				from = {
						{		type = 'world', npc_id = 82261, -- caparahueso-marea-oscura
								zone_id = 6719, -- Valle Sombraluna
								level = 40, for_sort = 1,
						},
				},
		},
		[116402] = { -- stonegrinder
				npc_id = 85231, -- 
				from = {
						{		type = 'world', -- npc_id = 0,
								zone_id = 6662, -- Talador
								level = 40, for_sort = 1,
								objects_ids = { 228570 }, -- Ketya's Stash
						},
				},
		},
		[116815] = { -- [86081] = 116815;
				npc_id = 86081, -- 
				from = {
						{		type = 'world', npc_id = 83401, -- engendro-abisal
								zone_id = 6755, -- Nagrand
								level = 40, for_sort = 1,
						},
				},
		},
		[118107] = { -- [86719] = 118107;
				npc_id = 86719, -- 
				from = {
						{		type = 'world', npc_id = 85504, -- Rotcap
								zone_id = 6722, -- cumbres-de-arak
								level = 40, for_sort = 1,
						},
				},
		},
		[118574] = { -- [87669] = 118574;
				npc_id = 87669, -- Hatespark the Tiny
				from = {
						{		type = 'raid', npc_id = 11502, -- Ragnaros
								zone_id = 2717, -- Núcleo de Magma
								level = 40, for_sort = 1,
						},
				},
		},
		[118709] = { -- [88103] = 118709;
				npc_id = 88103, -- Doom Bloom
				from = {
						{		type = 'world', npc_id = 84406, -- Mandrakor
								zone_id = 6721, -- gorgrond
								level = 40, for_sort = 1,
						},
				},
		},
		[119170] = { -- [88490] = 119170;
				npc_id = 88490, -- Eye of Observation
				from = {
						{		type = 'world', npc_id = 87668, -- Orumo the Observer
								zone_id = 6662, -- Talador
								level = 40, for_sort = 1,
						},
				},
		},
		[119431] = { -- [88692] = 119431;
				npc_id = 88692, -- Servant of Demidos
				from = {
						{		type = 'world', npc_id = 84911, -- Demidos
								zone_id = 6719, -- Valle Sombraluna
								level = 40, for_sort = 1,
						},
				},
		},
		[129217] = { -- [98237] = 129217;--
				npc_id = 98237, -- Warm Arcane Crystal
				from = {
						{		type = 'world', npc_id = 98199, -- Pugg
								zone_id = 6755, -- Nagrand
								level = 40, for_sort = 1,
						},
				},
		},
		[129216] = { -- [98236] = 129216;
				npc_id = 98236, -- 
				from = {
						{		type = 'world', npc_id = 98198, -- Rukdug
								zone_id = 6755, -- Nagrand
								level = 40, for_sort = 1,
						},
				},
		},
		[129218] = { -- [98238] = 129218;
				npc_id = 98238, -- 
				from = {
						{		type = 'world', npc_id = 98200, -- guk
								zone_id = 6755, -- Nagrand
								level = 40, for_sort = 1,
						},
				},
		},

-- Legion

		[153195] = { -- 
				npc_id = 128396, -- Uuna's Doll
				from = {
						{		type = 'world', npc_id = 127581, -- The Many-Faced Devourer
								zone_id = 8899, -- Baldío Antoran
								level = 45, for_sort = 1,
						},
				},
		},
		[153252] = { -- [128388] = 153252;
				npc_id = 128388, -- Rebellious Imp
				from = {
						{		type = 'world', npc_id = 127705, -- Mother Rosula
								zone_id = 8899, -- Baldío Antoran
								level = 45, for_sort = 1,
						},
				},
		},
		[136903] = { -- [112015] = 136903;
				npc_id = 112015, -- Nightmare Whelpling
				from = {
						{		type = 'raid', npc_id = 102679, -- Ysondre
								zone_id = 8026, -- Pesadilla Esmeralda
								level = 45, for_sort = 1,
						},
				},
		},
		[152967] = { -- [127852] = 152967;--
				npc_id = 127852, -- 
				from = {
						{		type = 'raid', npc_id = 41378, -- maloriak
								zone_id = 5094, -- Descenso de Alanegra
								level = 35, for_sort = 1,
						},
				},
		},
		[152969] = { -- [127857] = 152969;--
				npc_id = 127857, -- 
				from = {
						{		type = 'raid', npc_id = 45992, -- valiona
								zone_id = 5334, -- El Bastión del Crepúsculo
								level = 35, for_sort = 1,
						},
				},
		},
		[152977] = { -- [127950] = 152977;--
				npc_id = 127950, -- 
				from = {
						{		type = 'world', npc_id = 53494, -- baleroc
								zone_id = 5723, -- 
								level = 35, for_sort = 1,
						},
				},
		},
		[156851] = { -- [133064] = 156851;--
				npc_id = 133064, -- 
				from = {
						{		type = 'world', npc_id = 132580, -- ssinkrix
								zone_id = 1377, -- silithus
								level = 30, for_sort = 1,
						},
				},
		},
		[129175] = { -- [98077] = 129175;--
				npc_id = 98077, -- 
				from = {
						{		type = 'world', npc_id = 97203, -- Tenpak Flametotem
								zone_id = 7503, -- monte-alto
								level = 45, for_sort = 1,
						},
				},
		},
		[152979] = { -- [127952] = 152979;--
				npc_id = 127952, -- 
				from = {
						{		type = 'raid', npc_id = 55312, -- yorsahj-el-velador
								zone_id = 5892, -- Alma de Dragón
								level = 35, for_sort = 1,
						},
				},
		},
		[152966] = { -- [127850] = 152966;--
				npc_id = 127850, -- 
				from = {
						{		type = 'raid', npc_id = 42179, -- electron
								zone_id = 5094, -- Descenso de Alanegra
								level = 35, for_sort = 1,
						},
				},
		},
		[153056] = { -- [128159] = 153056;--
				npc_id = 128159, -- 
				from = {
						{		type = 'raid', npc_id = 126887, -- Ataxon
								zone_id = 8701, -- 
								level = 35, for_sort = 1,
						},
				},
		},
		[152972] = { -- [127859] = 152972;--
				npc_id = 127859, -- 
				from = {
						{		type = 'raid', npc_id = 43324, -- chogall
								zone_id = 5334, -- el-bastión-del-crepúsculo
								level = 35, for_sort = 1,
						},
				},
		},
		[140934] = { -- [113136] = 140934;--
				npc_id = 113136, -- 
				from = {
						{		type = 'world', npc_id = 111197, -- anax
								zone_id = 7637, -- suramar
								level = 45, for_sort = 1,
						},
				},
		},
		[152970] = { -- [127858] = 152970;--
				npc_id = 127858, -- 
				from = {
						{		type = 'raid', npc_id = 43688, -- arion
								zone_id = 5334, -- El Bastión del Crepúsculo
								level = 35, for_sort = 1,
						},
				},
		},
		[152976] = { -- [127948] = 152976;--
				npc_id = 127948, -- 
				from = {
						{		type = 'raid', npc_id = 52498, -- bethtilac
								zone_id = 5723, -- Tierras de Fuego
								level = 35, for_sort = 1,
						},
				},
		},
		[130154] = { -- [108568] = 130154;--
				npc_id = 108568, -- Pygmy Owl
				from = {
						{		type = 'world', npc_id = 92117, -- Gorebeak
								zone_id = 7558, -- valsharah
								level = 45, for_sort = 1,
						},
				},
		},
		[152968] = { -- [127853] = 152968;--
				npc_id = 127853, -- 
				from = {
						{		type = 'raid', npc_id = 41376, -- nefarian
								zone_id = 5094, -- Descenso de Alanegra
								level = 35, for_sort = 1,
						},
				},
		},
		[152974] = { -- [127863] = 152974;--
				npc_id = 127863, -- 
				from = {
						{		type = 'raid', npc_id = 45871, -- nezir
								zone_id = 5638, -- Trono de los Cuatro Vientos
								level = 35, for_sort = 1,
						},
				},
		},
		[152975] = { -- [127947] = 152975;--
				npc_id = 127947, -- 
				from = {
						{		type = 'raid', npc_id = 53691, -- shannox
								zone_id = 5723, -- Tierras de Fuego
								level = 35, for_sort = 1,
						},
				},
		},

-- Battle for Azeroth

-- achievement=13469/raiding-with-leashes-vi-pets-of-pandaria

		[167047] = { -- stoneclaw
				npc_id = 150354, -- garrapétrea
				from = {
						{		type = 'raid', npc_id = 60051, -- cobalt-guardian
								zone_id = 6125, -- mogushan-vaults
								level = 35, for_sort = 1,
						},
				},
		},
		[167048] = { -- wayward-spirit
				npc_id = 150356, -- wayward-spirit
				from = {
						{		type = 'raid', npc_id = 60143, -- garajal-the-spiritbinder
								zone_id = 6125, -- mogushan-vaults
								level = 35, for_sort = 2,
						},
				},
		},
		[167049] = { -- celestial-gift
				npc_id = 150357, -- comet
				from = {
						{		type = 'raid', -- npc_id = 0,
								zone_id = 6125, -- mogushan-vaults
								level = 35, for_sort = 3,
								object_ids = { 214383, 214384, 214385, 214386, 214387 }, --cache-of-pure-energy
						},
				},
		},
		[167050] = { -- Mogu Statue
				npc_id = 150360, -- baoh-xi
				from = {
						{		type = 'raid', npc_id = 60399, -- qin-xi
								zone_id = 6125, -- mogushan-vaults
								level = 35, for_sort = 4,
						},
				},
		},
		[167051] = { -- azure-cloud-serpent-egg
				npc_id = 150365, -- azure-windseeker
				from = {
						{		type = 'raid', -- npc_id = 0,
								zone_id = 6067, -- terrace-of-endless-spring
								level = 35, for_sort = 5,
								object_ids = { 212922, 215355, 215356, 215357, 215358 }, -- cache-of-tsulong
						},
				},
		},
		[167052] = { -- espíritu-de-la-primavera
				npc_id = 150372, -- spirit-of-the-spring
				from = {
						{		type = 'raid', npc_id = 62983, -- lei-shi
								zone_id = 6067, -- terrace-of-endless-spring
								level = 35, for_sort = 6,
								object_ids = { 213073, 213074, 213075, 213076, 213077 }, -- box-of-fancy-stuff
						},
				},
		},
		[167058] = { -- cría-de-plaga-korthik
				npc_id = 150374, -- korthik-swarmling
				from = {
						{		type = 'raid', npc_id = 62980, -- imperial-vizier-zorlok
								zone_id = 6297, -- heart-of-fear
								level = 35, for_sort = 7,
						},
				},
		},
		[167053] = { -- aguijonero-del-resplandor-ámbar - Tiny Amber Wings
				npc_id = 150375, -- amberglow-stinger
				from = {
						{		type = 'raid', npc_id = 62543, -- blade-lord-tayak
								zone_id = 6297, -- heart-of-fear
								level = 35, for_sort = 8,
						},
				},
		},
		[167054] = { -- engendro-de-garalon
				npc_id = 150377, -- spawn-of-garalon
				from = {
						{		type = 'raid', npc_id = 63191, -- garalon
								zone_id = 6297, -- heart-of-fear
								level = 35, for_sort = 9,
						},
				},
		},
		[167055] = { -- ámbar-viviente - amber-goo-puddle
				npc_id = 150380, -- living-amber
				from = {
						{		type = 'world', npc_id = 62511, -- amber-shaper-unsok
								zone_id = 6297, -- heart-of-fear
								level = 35, for_sort = 10,
						},
				},
		},
		[167056] = { -- cría-orgullosa-voraz - essence-of-pride
				npc_id = 150381, -- ravenous-prideling
				from = {
						{		type = 'world', npc_id = 62837, -- grand-empress-shekzeer
								zone_id = 6297, -- heart-of-fear
								level = 35, for_sort = 11,
						},
				},
		},

	[160704] = {
		npc_id = 139049,
		from = {
			{	type = 'world', npc_id = 135448, -- golthan-el-maloliente
				zone_id = 9327, -- tol-dagor
				level = 0, for_sort = 20,
			},
		},
	},

	[163648] = {
		npc_id = 143499,
		from = {
			{	type = 'world', npc_id = 142438, -- Venomarus
				zone_id = 45, -- Tierras Altas de Arathi
				level = 52, for_sort = 1,
			},
		},
	},
	[163650] = {
		npc_id = 143503,
		from = {
			{	type = 'world', npc_id = 142508, -- Branchlord Aldrus
				zone_id = 45,
				level = 52, for_sort = 2,
			},
		},
	},
	[163684] = {
		npc_id = 143533,
		from = {
			{	type = 'world', npc_id = 142440, -- Yogursa
				zone_id = 45,
				level = 52, for_sort = 3,
			},
		},
	},
	[163712] = {
		npc_id = 143628,
		from = {
			{	type = 'world', npc_id = 142716, -- Man-Hunter Rog
				zone_id = 45,
				level = 52, for_sort = 4,
			},
		},
	},
	[163711] = {
		npc_id = 143627,
		from = {
			{	type = 'world', npc_id = 142433, -- Fozruk
				zone_id = 45,
				level = 52, for_sort = 5,
			},
		},
	},
	[163652] = {
		npc_id = 143507,
		from = {
			{	type = 'world', npc_id = 142688, -- Darbel Montrose
				zone_id = 45,
				level = 52, for_sort = 6,
			},
		},
	},
	[163677] = {
		npc_id = 143515,
		from = {
			{	type = 'world', npc_id = 141668, -- Echo of Myzrael
				zone_id = 45,
				level = 52, for_sort = 7,
			},
		},
	},
	[163689] = {
		npc_id = 143563,
		from = {
			{	type = 'world', npc_id = 142436, -- Ragebeak
				zone_id = 45,
				level = 52, for_sort = 9,
			},
		},
	},
	[163690] = {
		npc_id = 143564,
		from = {
			{	type = 'world', npc_id = 142435, -- Plaguefeather
				zone_id = 45,
				level = 52, for_sort = 10,
			},
		},
	},

	[165722] = {
		npc_id = 147221, -- Redridge Tarantula Egg
		from = {
			{	type = 'world', npc_id = 147222, -- Gnollfeaster
				zone_id = 44, -- redridge-mountains
				level = 70, for_sort = 0,
			},
		},
	},

	[165848] = {
		npc_id = 147585,
		from = {
			{	type = 'raid', npc_id = 144747, -- pakus-aspect
				zone_id = 10076, -- battle-of-dazaralor
				level = 50, for_sort = 0,
			},
		},
	},
	[165847] = {
		npc_id = 147587,
		from = {
			{	type = 'raid', npc_id = 144747, -- pakus-aspect 
				zone_id = 10076, -- battle-of-dazaralor
				level = 50, for_sort = 0,
			},
		},
	},
	[165846] = {
		npc_id = 147586,
		from = {
			{	type = 'raid', npc_id = 144747, -- pakus-aspect 
				zone_id = 10076, -- battle-of-dazaralor
				level = 50, for_sort = 0,
			},
		},
	},

	[166345] = {
		npc_id = 148520, -- Zandalari Raptor Egg
		from = {
			{	type = 'world', npc_id = 149147, -- N'chala the Egg Thief
				zone_id = 8499, -- zuldazar
				level = 0, for_sort = 0,
			},
		},
	},

	[166449] = {
		npc_id = 148781,
		from = {
			{	type = 'world', npc_id = 148037, -- athil-dewfire
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166453] = {
		npc_id = 148843,
		from = {
			{	type = 'world', npc_id = 147664, -- zimkaga
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
			{	type = 'world', npc_id = 147758, -- onu
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166451] = {
		npc_id = 148825,
		from = {
			{	type = 'world', npc_id = 147260, -- conflagros
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166452] = {
		npc_id = 148841,
		from = {
			{	type = 'world', npc_id = 147240, -- Hydrath
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166455] = {
		npc_id = 148846,
		from = {
			{	type = 'world', npc_id = 147942, -- Twilight Prophet Graeme
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166448] = {
		npc_id = 148784,
		from = {
			{	type = 'world', npc_id = 147241, -- Cyclarus
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},
	[166454] = {
		npc_id = 148844,
		from = {
			{	type = 'world', npc_id = 147897, -- Soggoth the Slitherer
				zone_id = 148, -- darkshore
				level = 52, for_sort = 0,
			},
		},
	},

	-- 8.2.0 Rise of Azshara

	[169348] = {
		npc_id = 154819,
		from = {
			{	type = 'raid', npc_id = 155126, -- queen-azshara
				zone_id = 10425, -- the-eternal-palace
				level = 52, for_sort = 1,
			},
		},
	},
	[169362] = {
		npc_id = 154835,
		from = {
			{	type = 'raid', npc_id = 150859, -- zaqul
				zone_id = 10425, -- the-eternal-palace
				level = 52, for_sort = 2,
			},
		},
	},
	[169358] = {
		npc_id = 154831,
		from = {
			{	type = 'raid', npc_id = 152236, -- lady-ashvane
				zone_id = 10425, -- the-eternal-palace
				level = 52, for_sort = 3,
			},
		},
	},
	[169360] = {
		npc_id = 154833,
		from = {
			{	type = 'raid', npc_id = 150653, -- blackwater-behemoth
				zone_id = 10425, -- the-eternal-palace
				level = 52, for_sort = 4,
			},
		},
	},

	-- 8.2.0 rares in nazjatar [16]

	[169363] = {
		npc_id = 154836,
		from = {
			{	type = 'world', npc_id = 152794, -- Amethyst Spireshell
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 1,
			},
		},
	},
	[169374] = {
		npc_id = 154846,
		from = {
			{	type = 'world', npc_id = 150583, -- Rockweed Shambler
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 2,
			},
		},
	},
	[169370] = {
		npc_id = 154843,
		from = {
			{	type = 'world', npc_id = 152548, -- scale-matriarch-gratinax
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 3,
			},
		},
	},
	[169371] = {
		npc_id = 154820,
		from = {
			{	type = 'world', npc_id = 152323, -- King Gakula
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 4,
			},
		},
	},
	[169367] = {
		npc_id = 154840,
		from = {
			{	type = 'world', npc_id = 152681, -- Prince Typhonus
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 5,
			},
		},
	},
	[169372] = {
		npc_id = 154821,
		from = {
			{	type = 'world', npc_id = 152712, -- Blindlight
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 6,
			},
		},
	},
	[169369] = {
		npc_id = 154842,
		from = {
			{	type = 'world', npc_id = 151870, -- Sandcastle
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 7,
			},
		},
	},
	[169355] = {
		npc_id = 154828,
		from = {
			{	type = 'world', npc_id = 152465, -- Needlespine
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 8,
			},
		},
	},
	[169375] = {
		npc_id = 154847,
		from = {
			{	type = 'world', npc_id = 149653, -- Carnivorous Lasher
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 9,
			},
		},
	},
	[169373] = {
		npc_id = 154845,
		from = {
			{	type = 'world', npc_id = 150191, -- Avarius
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 10,
			},
		},
	},
	[169359] = {
		npc_id = 154832,
		from = {
			{	type = 'world', npc_id = 152555, -- Elderspawn Nalaada
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 11,
			},
		},
	},
	[169350] = {
		npc_id = 154823,
		from = {
			{	type = 'world', npc_id = 152795, -- Sandclaw Stoneshell
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 12,
			},
		},
	},
	[169376] = {
		npc_id = 154848,
		from = {
			{	type = 'world', npc_id = 150468, -- Vor'koth
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 13,
			},
		},
	},
	[169361] = {
		npc_id = 154834,
		from = {
			{	type = 'world', npc_id = 152756, -- Daggertooth Terror
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 14,
			},
		},
	},
	[169366] = {
		npc_id = 154839,
		from = {
			{	type = 'world', npc_id = 144644, -- Mirecrawler
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 15,
			},
		},
	},
	[169368] = {
		npc_id = 154841,
		from = {
			{	type = 'world', npc_id = 152682, -- Prince Vortran
				zone_id = 10052, -- nazjatar
				level = 51, for_sort = 16,
			},
		},
	},

	[169378] = {
		npc_id = 154850,
		from = {
			{	type = 'world', npc_id = 150397, -- king-mechagon
				zone_id = 10225, -- operation-mechagon
				level = 0, for_sort = 0,
			},
		},
	},
	[169379] = {
		npc_id = 154851, -- Snowsoft Nibbler
		from = {
			{	type = 'world', npc_id = 135497, -- Mushroom
				zone_id = 10290, -- mechagon
				level = 50, for_sort = 0,
			},
		},
	},
	[169382] = {
		npc_id = 154854, -- Lost Robogrip
		from = {
			{	type = 'world', npc_id = 151933, -- Malfunctioning Beastbot
				zone_id = 10290, -- mechagon
				level = 0, for_sort = 0,
			},
		},
	},
	[169385] = {
		npc_id = 154857, -- Microbot 8D
		from = {
			{	type = 'dungeon', npc_id = 150190, -- hk-8-aerial-oppression-unit
				zone_id = 10225, -- operation-mechagon
				level = 52, for_sort = 0,
			},
		},
	},
	[169392] = {
		npc_id = 154893, -- Bonebiter
		from = {
			{	type = 'world', npc_id = 152001, -- Bonepicker
				zone_id = 10290, -- mechagon
				level = 51, for_sort = 0,
			},
		},
	},
	[169393] = {
		npc_id = 154894, -- Arachnoid Skitterbot
		from = {
			{	type = 'world', npc_id = 151672, -- Mecharantula
				zone_id = 10290, -- mechagon
				level = 51, for_sort = 0,
			},
		},
	},
	[169886] = {
		npc_id = 155600, -- Spraybot 0D
		from = {
			{	type = 'world', npc_id = 152113, -- The Kleptoboss"
				zone_id = 10290, -- mechagon
				level = 51, for_sort = 0,
			},
		},
	},

	[172493] = {
		npc_id = 158685, -- Snarling Butterfly Crate
		from = {
			{	type = 'world', npc_id = 154154, -- Honey Smasher
				zone_id = 9042, -- stormsong-valley
				level = 60, for_sort = 0,
			},
		},
	},

	[174473] = {
		npc_id = 161954,
		from = {
			{	type = 'world', npc_id = 157176, -- The Forgotten
				zone_id = 9105, -- vale-of-eternal-blossoms
				level = 51, for_sort = 0,
			},
		},
	},
	[174474] = {
		npc_id = 161992,
		from = {
			{	type = 'world', npc_id = 154495, -- Will of N'Zoth
				zone_id = 9105, -- vale-of-eternal-blossoms
				level = 51, for_sort = 0,
			},
		},
	},

	[174475] = {
		npc_id = 161997, -- Stinky Sack
		from = {
			{	type = 'world', npc_id = 154604, -- Lord Aj'qirai
				zone_id = 10833, -- uldum
				level = 52, for_sort = 1,
			},
		},
	},
	[174476] = { -- Black Chitinous Plate
		npc_id = 162004,
		from = {
			{	type = 'world', npc_id = 162140, -- Skikx'traz
				zone_id = 10833, -- uldum
				level = 52, for_sort = 2,
			},
		},
	},
	[174478] = { -- Wicked Lurker
		npc_id = 162012,
		from = {
			{	type = 'world', npc_id = 157593, -- Amalgamation of Flesh
				zone_id = 10833, -- uldum
				level = 52, for_sort = 3,
			},
		},
	},

	-- 8.3.0 10522/nyalotha-the-waking-city [5]

	[174446] = {
		npc_id = 161919,
		from = {
			{	type = 'raid', npc_id = 156523, -- maut
				zone_id = 10522, -- nyalotha-the-waking-city
				level = 51, for_sort = 1,
			},
		},
	},
	[174447] = { -- Void-Scarred Anubisath
		npc_id = 161921,
		from = {
			{	type = 'raid', npc_id = 156866, -- ra-den
				zone_id = 10522, -- nyalotha-the-waking-city
				level = 51, for_sort = 2,
			},
		},
	},
	[174448] = { -- Aqir Hivespawn
		npc_id = 161923,
		from = {
			{	type = 'raid', npc_id = 157254, -- tekris
				zone_id = 10522, -- nyalotha-the-waking-city
				level = 51, for_sort = 3,
			},
		},
	},
	[174449] = { -- Ra'kim
		npc_id = 161924,
		from = {
			{	type = 'raid', npc_id = 157254, -- tekris
				zone_id = 10522, -- nyalotha-the-waking-city
				level = 51, for_sort = 4,
			},
		},
	},
	[174452] = { -- eye-of-corruption
		npc_id = 161946,
		from = {
			{	type = 'raid', npc_id = 158041, -- nzoth-the-corruptor
				zone_id = 10522, -- nyalotha-the-waking-city
				level = 51, for_sort = 5,
			},
		},
	},

--[[
	[0] = {
		npc_id = 0,
		from = {
			{	type = 'world', npc_id = 0, -- 
				zone_id = 0,
				level = 0, for_sort = 0,
			},
		},
	},
	[0] = {
		npc_id = 0,
		from = {
			{	type = 'world', npc_id = 0, -- 
				zone_id = 0,
				level = 0, for_sort = 0,
			},
		},
	},
--]]

-- https://warcraft.wiki.gg/wiki/UiMapID

-- DragonFlight [16]

		[191930] = { -- wakyn, item
				npc_id = 188821, -- wakyn, mascota
				from = {
						{		type = 'world', npc_id = 200960, -- Celadora Entrix
								zone_id = 14433, -- The Forbidden Reach
								level = 72, for_sort = 1,
							  quest_id = 74348,
						},
				},
		},
		[205003] = { -- ambre, item
				npc_id = 204221, -- ambre, mascota
				from = {
						{		type = 'world', npc_id = 201673, -- discipulo de fyrakk
								zone_id = 13645, -- Ohn'ahran Plains - llanuras-de-ohnahra
								level = 72, for_sort = 2,
								quest_id = 74568,
						},
						{
								type = 'world', npc_id = 203411, -- discipulo de fyrakk
								zone_id = 13646, -- the azure span - tierras-azures
								level = 72, for_sort = 3,
								quest_id = 75372,
						},
				},
		},
		[205147] = { -- item - alaesquisto-con-cresta
				npc_id = 204339, -- mascota - alaesquisto-con-cresta
				from = {
						{
								type = 'world', npc_id = 203625, -- karokta
								zone_id = 14022, --  zaralek cavern [2133]
								level = 72, for_sort = 4,
								quest_id = 75334, -- karokta
							--classification = 'Rare Elite',
						},
				},
		},
		[205002] = { -- item - blaise
				npc_id = 204217, -- mascota - blaise
				from = {
						{
								type = 'world', npc_id = 201673, -- discipulo de fyrakk
								zone_id = 13645, -- Ohn'ahran Plains
								level = 72, for_sort = 5,
								quest_id = 74568,
						},
						{
								type = 'world', npc_id = 203411, -- discipulo de fyrakk
								zone_id = 13646, -- the azure span
								level = 72, for_sort = 5,
								quest_id = 75372,
						},
				},
		},
		[200260] = { -- item - eco-de-las-profundidades
				npc_id = 189130, -- mascota - eco-de-las-profundidades
				from = {
						{
								type = 'world', npc_id = 203750, -- primalista-lanzahielo
								zone_id = 13646, -- the azure span
								level = 60, for_sort = 7,
							-- classification = 'trash',
						},
				},
		},
		[193235] = { -- item - luvvy
				npc_id = 189106, -- mascota - luvvy
				from = {
						{
								type = 'world', npc_id = 200742, -- luttrok
								zone_id = 14433, -- The Forbidden Reach
								level = 72, for_sort = 8,
								quest_id = 74332,
						},
				},
		},
		[193374] = { -- item - alacinérea
				npc_id = 189118, -- mascota - alacin%C3%A9rea
				from = {
						{
								type = 'world', npc_id = 200681, -- bonesifter-marwak
								zone_id = 14433, -- 
								level = 72, for_sort = 9,
								quest_id = 74341,
						},
				},
		},
		[200263] = { -- item - eco-de-las-alturas
				npc_id = 189132, -- mascota - eco-de-las-alturas
				from = {
						{
								type = 'world', npc_id = 203746, -- primalist-stormslinger
								zone_id = 13646, -- the azure span
								level = 72, for_sort = 10,
							-- classification = 'Rare Elite',
						},
				},
		},
		[200183] = { -- item - eco-de-la-cueva
				npc_id = 192258, -- mascota - eco-de-la-cueva
				from = {
						{
								type = 'world', npc_id = 203740, -- primalist-landshaker
								zone_id = 13646, -- the azure span
								level = 72, for_sort = 11,
							-- classification = 'Rare Elite',
						},
				},
		},
		[212606] = { -- item - sarge
				npc_id = 216179, -- mascota - sarge
				from = {
						{		type = 'world', npc_id = 215146, -- dr-bum
								zone_id = 2131, -- 
								level = 72, for_sort = 12,
							-- classification = 'Rare Elite',
							-- world_event = event=1462/hearthstones-10th-anniversary,
						},
				},
		},
		[205152] = { -- item - skaarn
				npc_id = 204345, -- mascota - skaarn
				from = {
						{
								type = 'world', npc_id = 203462, -- kobrok
								zone_id = 14022, --  zaralek cavern [2133]
								level = 72, for_sort = 13,
								quest_id = 75267, -- kobrok
							-- classification = 'Rare Elite',
						},
				},
		},
		[205154] = { -- item - aquapo
				npc_id = 204359, -- mascota - aquapo
				from = {
						{
								type = 'world', npc_id = 203468, -- aquifon
								zone_id = 14022, --  zaralek cavern [2133]
								level = 72, for_sort = 14,
								quest_id = 75271, --aquifon
							-- classification = 'Rare Elite',
						},
				},
		},
		[200255] = { -- item - eco-del-inferno
				npc_id = 189112, -- mascota - eco-del-inferno
				from = {
						{
								type = 'world', npc_id = 203753, -- primalista-flamador
								zone_id = 13646, -- the azure span
								level = 72, for_sort = 15,
							-- classification = 'Rare Elite',
						},
				},
		},
		[206018] = { -- item - piedra-de-alma-de-baalial
				npc_id = 205637, -- mascota - baalial
				from = {
						{
								type = 'world', npc_id = 205490, -- goblin-del-tesoro
								zone_id = 2131, -- 
								level = 72, for_sort = 16,
							-- classification = 'Rare Elite',
							-- world_event = event=1382/a-greedy-emissary,
						},
				},
		},
		[193364] = { -- item - trifulcas
				npc_id = 189115, -- mascota - trifulcas
				from = {
						{
								type = 'world', npc_id = 200584, -- vraken-el-cazador
								zone_id = 14433, -- The Forbidden Reach
								level = 72, for_sort = 17,
								quest_id = 74336, -- 
							-- classification = 'Rare Elite',
						},
				},
		},
		[205159] = { -- item - polilla-lágrima
				npc_id = 204363, -- mascota - polilla-lágrima
				from = {
						{
								type = 'world', npc_id = 203593, -- reina-sondaluz
								zone_id = 14022, --  zaralek cavern [2133]
								level = 72, for_sort = 18,
								quest_id = 75298, -- underlight-queen
							-- classification = 'Rare Elite',
						},
				},
		},

-- Shadowlands [44]

	[186564] = { -- item - Golden Eye
				npc_id = 179228, -- pet - golden-eye
				from = {
						{		type = 'world', npc_id = 177132, -- helsworn-soulseeker
								zone_id = 11400, -- The Maw [11400]
								level = 60, for_sort = 1,
								quest_id = 64273, -- containing-the-helsworn
						},
				},
	}, 
	[180602] = { -- Crimson Dredwing Pup
				npc_id = 171150, -- pet - crimson-dredwing-pup
				from = {
						{		type = 'world', npc_id = 156077, -- fiendish-terrorwing
								zone_id = 10413, -- Revendreth [1688]
								level = 60, for_sort = 2,
						},
				},
		}, 
	[183191] = { -- Maw Crawler
				npc_id = 173988, -- mascota - maw-crawler
				from = {
						{		type = 'raid', npc_id = 153451, -- kosarus-the-fallen
								zone_id = 1618, -- Skoldus Hall - Torghast
								level = 62, for_sort = 3,
						},
				},
		}, 
	[183395] = { -- Pommel Jewel of Remornia
				npc_id = 173994, -- mascota - will-of-remornia
				from = {
						{		type = 'raid', npc_id = 167406, -- sire-denathrius
								zone_id = 13224, -- Castle Nathria - Nightcloak Sanctum [1747]
								level = 60, for_sort = 4,
						},
				},
		}, 
	[180869] = { -- Devoured Wader
				npc_id = 171714, -- mascota- devoured-wader
				from = {
						{		type = 'world', npc_id = 171041, -- worldfeaster-chronn
								zone_id = 10534, -- Bastion [1813]
								level = 60, for_sort = 5,
						},
				},
		}, 
	[183195] = { -- Torghast Lurker
				npc_id = 173992, -- mascota- torghast-lurker
				from = {
						{		type = 'raid', npc_id = 153011, -- binder-baritas
								zone_id = 13412, -- Mort'regar - Torghast [1618]
								level = 62, for_sort = 6,
								quest_id = 64850, --traversing-torghast
						},
				},
		}, 
	[186449] = { -- Amaranthine Stinger
				npc_id = 179181, -- mascota - amaranthine-stinger
				from = {
						{		type = 'world', npc_id = 177979, -- gralebboih
								zone_id = 11400, -- The Maw [1743]
								level = 60, for_sort = 7,
								quest_id = 63949, -- shaping-fate
						},
				},
	}, 
	[183194] = { -- Maw Stalker
				npc_id = 173991, -- mascota - maw-stalker
				from = {
						{		type = 'raid', npc_id = 171422, -- arch-suppressor-laguas
								zone_id = 13412, -- Mort'regar - Torghast [1618]
								level = 62, for_sort = 8,
								quest_id = 64850, --traversing-torghast
						},
				},
	}, 
	[181270] = { -- Invertebrate Oil
				npc_id = 172149, -- mascota - invertebrate-oil
				from = {
						{		type = 'world', npc_id = 157312, -- oily-invertebrate
								zone_id = 11462, -- Maldraxxus [1689]
								level = 60, for_sort = 9,
						},
				},
	}, 
	[180584] = { -- Blushing Spiderling
				npc_id = 171117, -- mascota - blushing-spiderling
				from = {
						{		type = 'world', npc_id = 155779, -- Tomb Burster <Dread Crawler Queen>
								zone_id = 10413, -- Revendreth [1688]
								level = 60, for_sort = 10,
						},
				},
	}, 
	[180586] = { -- Lightbinders
				npc_id = 171119, -- mascota - bound-lightspawn
				from = {
						{		type = 'world', npc_id = 164388, -- amalgamation-of-light
								zone_id = 10413, -- Revendreth [1688]
								level = 60, for_sort = 11,
						},
				},
	}, 
	[180644] = { -- Rocky
				npc_id = 171246, -- mascota - rocky
				from = {
						{		type = 'world', npc_id = 164093, -- macabre
								zone_id = 11510, -- Ardenweald [2005]
								level = 60, for_sort = 12,
						},
				},
	}, 
	[184397] = { -- Lost Featherling
				npc_id = 175560, -- mascota - lost-featherling
				from = {
						{		type = 'world', npc_id = 157054, -- fallacious-aspirant
								zone_id = 10534, -- Bastion [1813]
								level = 60, for_sort = 13,
						},
				},
	}, 
	[184401] = { -- Larion Pouncer
				npc_id = 175562, -- mascota - larion-pouncer
				from = {
						{		type = 'world', npc_id = 156340, -- larionrider-orstus
								zone_id = 10534, -- Bastion [1813]
								level = 62, for_sort = 14,
						},
				},
	}, 
	[181265] = { -- Corpselouse Larva
				npc_id = 172136, -- mascota - corpselouse-larva
				from = {
						{		type = 'world', npc_id = 162528, -- smorgas-the-feaster
								zone_id = 11462, -- Maldraxxus [1689]
								level = 60, for_sort = 15,
						},
				},
	}, 
	[180587] = { -- Animated Tome
				npc_id = 171120, -- mascota - animated-tome
				from = {
						{		type = 'world', npc_id = 160675, -- scrivener-lenua
								zone_id = 10413, -- Revendreth [1688]
								level = 60, for_sort = 16,
						},
				},
	}, 
	[180585] = { -- Bottled Up Rage
				npc_id = 171118, -- mascota - wrathling
				from = {
						{		type = 'world', npc_id = 165175, -- prideful-hulk
								zone_id = 10413, -- Revendreth [1688]
								level = 60, for_sort = 17,
						},
				},
	}, 
	[183115] = { -- Tower Deathroach
				npc_id = 173849, -- mascota - tower-deathroach
				from = {
						{		type = 'raid', npc_id = 155250, -- decayspeaker
								zone_id = 13411, -- Coldheart Interstitia - torghast
								level = 62, for_sort = 18,
						},
				},
	},
	[186534] = { -- Gizmo
				npc_id = 179166, -- mascota - gizmo
				from = {
						{		type = 'dungeon', npc_id = 175646, -- P.O.S.T. Master
								zone_id = 13577, -- Tazavesh, the Veiled Market - The Veiled Market [1989]
								level = 62, for_sort = 19,
						},
				},
	},
	[183107] = { -- Pile of Ashen Dust
				npc_id = 173842, -- mascota - dripping-candle
				from = {
						{		type = 'world', npc_id = 165686, -- Ashen Amalgamation
								zone_id = 13329, -- The Ember Court - Revendreth [1644]
								level = 60, for_sort = 20,
							-- Rare Elite
						},
				},
	},
	[180588] = { -- Bucket of Primordial Sludge
				npc_id = 171121, -- mascota - primordial-bogling
				from = {
						{		type = 'world', npc_id = 166292, -- bog-beast
								zone_id = 10413, -- Revendreth [1688]
								level = 62, for_sort = 21,
						},
				},
	},
	[183116] = { -- Hissing Deathroach
				npc_id = 173850, -- mascota - hissing-deathroach
				from = {
						{		type = 'world', npc_id = 155250, -- decayspeaker
								zone_id = 13411, -- Coldheart Interstitia - torghast
								level = 62, for_sort = 22,
						},
				},
	},
	[183117] = { -- Severs
				npc_id = 173851, -- mascota- severs
				from = {
						{		type = 'dungeon', npc_id = 171422, -- arch-suppressor-laguas
								zone_id = 13413, -- The Soulforges - Torghast la-parte-alta
								level = 62, for_sort = 23,
						},
				},
	},
	[183193] = { -- Jar of Ashes
				npc_id = 173989, -- ashen-chomper
				from = {
						{		type = 'raid', npc_id = 153165, -- custodio-thonar
								zone_id = 13400, -- skoldus hall - torghast - sala-de-skoldus
								level = 62, for_sort = 24,
						},
				},
	},
	[186550] = { -- Mawsworn Minion
				npc_id = 179240, -- mascota- mawsworn-minion
				from = {
						{		type = 'raid', npc_id = 175559, -- kelthuzad
								zone_id = 13561, -- Sanctum of Domination - Crown of Gorgoa [2001]
								level = 62, for_sort = 25,
						},
				},
	},
	[181172] = { -- Boneweave Hatchling
				npc_id = 171986, -- mascota - boneweave-hatchling
				from = {
						{		type = 'world', npc_id = 159886, -- sister-chelicerae
								zone_id = 11462, -- Maldraxxus [1689]
								level = 62, for_sort = 26,
							--  Rare Elite
						},
				},
	},
	[181267] = { -- Writhing Spine
				npc_id = 172139, -- mascota- writhing-spine
				from = {
						{		type = 'world', npc_id = 158406, -- scunner
								zone_id = 11462, -- Maldraxxus [1689]
								level = 62, for_sort = 27,
							-- Rare Elite
						},
				},
	},
	[181271] = { -- 9.0.1 - Sludge Feeler
				npc_id = 172150, -- mascota - sludge-feeler
				from = {
						{		type = 'dungeon', npc_id = 164267, -- margrave-stradama
								zone_id = 13228, -- 
								level = 62, for_sort = 28,
						},
				},
	},
	[180812] = { -- 9.0.1
				npc_id = 171565, -- mascota
				from = {
						{		type = 'world', npc_id = 170932, -- 
								zone_id = 10534, -- 
								level = 62, for_sort = 29,
						},
				},
	},
	[183410] = { -- 9.0.1
				npc_id = 174084, -- mascota
				from = {
						{		type = 'world', npc_id = 172521, -- 
								zone_id = 11400, -- 
								level = 62, for_sort = 30,
						},
				},
	},
	[186542] = { -- 9.1.0
				npc_id = 179251, -- mascota
				from = {
						{		type = 'world', npc_id = 177336, -- Zelnithop
								zone_id = 13570, -- Korthia ??
								level = 60, for_sort = 33,
							--subtype = 'Zelnithop',
							--dont_autoupdate = false,
								quest_id = 64753,
						},
				},
	},
	[180591] = { -- 9.0.1
				npc_id = 171124, -- mascota
				from = {
						{		type = 'dungeon', npc_id = 162102, -- gran-procuradora-beryllia
								zone_id = 12842, -- Cavernas Sanguinas
								level = 62, for_sort = 34,
						},
				},
	},
	[181263] = { -- 9.0.1
				npc_id = 172134, -- mascota
				from = {
						{		type = 'world', npc_id = 162711, -- 
								zone_id = 11462, -- 
								level = 62, for_sort = 35,
						},
				},
	},
	[180643] = { -- 9.0.1
				npc_id = 171239, -- mascota
				from = {
						{		type = 'world', npc_id = 164391, -- 
								zone_id = 11510, -- 
								level = 62, for_sort = 36,
						},
				},
	},
	[181266] = { -- 9.0.1
				npc_id = 172137, -- mascota
				from = {
						{		type = 'world', npc_id = 162528, -- Smorgas the Feaster
								zone_id = 11462, -- 
								level = 62, for_sort = 37,
						},
				},
	},
	[186549] = { 
				npc_id = 179239, -- mascota
				from = {
						{		type = 'world', npc_id = 179526, -- trozigal-el-opresor
								zone_id = 13575, -- Torghast - Cámaras de Adamantita
								level = 62, for_sort = 38,
						},
				},
	},
--[[
	[186559] = { 
				npc_id = 179220, -- mascota
				from = {
						{		type = 'world', npc_id = -1, -- botín de 137 npc's
								zone_id = -1, -- 
								level = 60, for_sort = 39,
						},
				},
	},
--]]
	[181283] = { 
				npc_id = 172155, -- mascota
				from = {
						{		type = 'world', npc_id = 159753, -- Ravenomous
								zone_id = 11462, -- 
								level = 62, for_sort = 40,
						},
				},
	},
	[180631] = { 
				npc_id = 171231, -- mascota
				from = {
						{		type = 'world', npc_id = 164238, -- Deifir the Untamed
								zone_id = 11510, -- 
								level = 62, for_sort = 41,
						},
				},
	},
	[183192] = { -- Frenzied Mawrat
				npc_id = 173990, -- mascota
				from = {
						{		type = 'raid', npc_id = 151329, -- warden-skoldus
								zone_id = 13400, -- Skoldus Hall - Torghast 1618
								level = 62, for_sort = 42,
						},
				},
	},
	[183196] = { 
				npc_id = 173993, -- mascota
				from = {
						{		type = 'world', npc_id = 163370, -- 
								zone_id = 11510, -- 
								level = 62, for_sort = 43,
						},
				},
	},
	[186555] = { 
				npc_id = 179233, -- mascota
				from = {
						{		type = 'raid', npc_id = 180018, -- mirada-del-carcelero
								zone_id = 13561, -- Sagrario de Dominación
								level = 62, for_sort = 44,
						},
				},
	},
	[186554] = { 
				npc_id = 179232, -- mascota
				from = {
						{		type = 'raid', npc_id = 175725, -- mirada-del-carcelero
								zone_id = 13561, --  sagrario-de-dominación
								level = 62, for_sort = 45,
						},
				},
	},
	[186558] = { 
				npc_id = 179222, -- mascota
				from = {
						{		type = 'raid', npc_id = 175727, -- desgarrador-de-almas-dormazain
								zone_id = 13561, -- 
								level = 62, for_sort = 46,
						},
				},
	},
	[183623] = { 
				npc_id = 174089, -- mascota
				from = {
						{		type = 'dungeon', npc_id = 164517, -- tredova
								zone_id = 13334, -- nieblas-de-tirna-scithe
								level = 60, for_sort = 47,
						},
				},
	},
	[183407] = { 
				npc_id = 174081, -- mascota
				from = {
						{		type = 'world', npc_id = 154330, -- Eternas the Tormentor
								zone_id = 11400, -- 
								level = 62, for_sort = 48,
						},
				},
	},

}

--[[
		[0] = { -- item - 
				npc_id = 0, -- mascota
				from = {
						{
								type = 'world', -- npc_id = 0, -- 
								zone_id = 0, -- 
								level = 72, for_sort = 1,
							-- quest_id = 0, -- 
							-- classification = 'Rare Elite',
							-- world_event = false,
						},
				},
		},
--]]
