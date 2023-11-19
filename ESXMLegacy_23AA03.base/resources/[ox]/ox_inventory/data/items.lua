return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	--------------------#### Food Items ####---------------------
	-------------------------------------------------------------

	['sandwich'] = { -- A simple sandwich for a simple day
        label = 'Sandwich',
        weight = 350,
        stack = true,
        close = true,
        description = "A simple sandwich for a simple day",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_sandwich_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

	['burger'] = { -- A test hamburger that you can eat
        label = 'Hamburger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

	['burger_chs'] = { -- A test hamburger that you can eat
        label = 'Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

	['burger_chsbcn'] = { -- A test hamburger that you can eat
        label = 'Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese & bacon",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

	['hotdog'] = { -- A test hamburger that you can eat
        label = 'Hotdog',
        weight = 350,
        stack = true,
        close = true,
        description = "Not made with real dogs or meat",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_hotdog_01', 
            pos = vec3(0.06, -0.01, -0.03), rot = vec3(60.0, -90.0, 0.0) },
            usetime = 7500,
        },
    },

	['noodles'] = { -- Fuck those baked shits are good af
        label = 'Thai Noodles',
        weight = 350,
        stack = true,
        close = true,
        description = "นี่คือบะหมี่",
        client = {
            status = { hunger = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_ret_fh_noodle', 
            pos = vec3(-0.03, 0.01, 0.05), 
            rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

	['fr_fries'] = { -- A test hamburger that you can eat
        label = 'French Fries',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_food_chips', 
            pos = vec3(-0.01, 0.0, -0.02), rot = vec3(0.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

	['pizza_pep'] = { -- A simple sandwich for a simple day
        label = 'Peperoni Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Who put cheese on my pepperoni",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice5', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

	['pizza_msh'] = { -- A simple sandwich for a simple day
        label = 'Mushroom Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Fungi on my pizza? Who thought of this?",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice3', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

	['pizza_chs'] = { -- A simple sandwich for a simple day
        label = 'Cheese Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Is it enough cheese? No",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice4', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

	['pizza_mgt'] = { -- A simple sandwich for a simple day
        label = 'Margherita Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "I know, I thought it was alcohol pizza too",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice2', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

	['pizza_dmt'] = { -- A simple sandwich for a simple day
        label = 'Double Meat Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "When one meat isn't enough and 3 is weird",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice1', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

	['phatc_rib'] = { -- A skeletons favorite snack
        label = 'Phat Chips: Ribs',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01b', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

	['phatc_bch'] = { -- Biggie Cheese
        label = 'Phat Chips: Big Cheese',
        weight = 350,
        stack = true,
        close = true,
        description = "Cheese flavored chips, made with real rats",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01a', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

	['ps_qs'] = { -- is that candy
        label = 'P\'s & Q\'s',
        weight = 350,
        stack = true,
        close = true,
        description = "Candy make your tongue go brrrr",
        client = {
            status = { hunger = 650000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_candy_pqs', 
            pos = vec3(0.0, 0.02, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

	['apple'] = { -- Apple good
        label = 'Apple',
        weight = 350,
        stack = true,
        close = true,
        description = "Yes, from the trees comes deez apples",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'sf_prop_sf_apple_01a', 
            pos = vec3(0.03, -0.02, -0.03), rot = vec3(300.0, 340.0, 170.0) },
            usetime = 3000,
        },
    },

    ['banana'] = { -- banana good
        label = 'Banana',
        weight = 350,
        stack = true,
        close = true,
        description = "b a n a n a n a n a n a",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_tre_banana', 
            pos = vec3(0.05, -0.02, 0.01), rot = vec3(270.0, 90.0, 0.0) },
            usetime = 3000,
        },
    },

	['donut_chc'] = { -- Fuck those baked shits are good af
        label = 'Chocolate Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut002', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['donut_sby'] = { -- Fuck those baked shits are good af
        label = 'Strawberry Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut001', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['smore'] = { -- Fuck those baked shits are good af
        label = 'Smore',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_food_dessert_a', 
            bone = 18905,
            pos = vec3(0.15, 0.03, 0.03), 
            rot = vec3(-42.0, -36.0, 0.0) },
            usetime = 7500,
        },
    },

    ['icecream_chr'] = { -- brain cold go brrrrr
        label = 'Cherry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_cherry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_chc'] = { -- brain cold go brrrrr
        label = 'Chocolate Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_chocolate', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_lmn'] = { -- brain cold go brrrrr
        label = 'Lemon Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_lemon', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_pso'] = { -- brain cold go brrrrr
        label = 'Pistachio Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_pistachio', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_rpy'] = { -- brain cold go brrrrr
        label = 'Raspberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_raspberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_ckd'] = { -- brain cold go brrrrr
        label = 'Cookie Dough Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_stracciatella', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_sby'] = { -- brain cold go brrrrr
        label = 'Strawberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_strawberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

	['icecream_vna'] = { -- brain cold go brrrrr
        label = 'Vanilla Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_walnut', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

	-- Main meals
    ['mre_chilimac'] = { 
        label = 'MRE - Chili Mac',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_beefstew'] = { 
        label = 'MRE - Beef Stew',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chkenchilada'] = { 
        label = 'MRE - Chkn Enchiladas',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_veggieomelet'] = { 
        label = 'MRE - Veggie Omelet',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chknking'] = { 
        label = 'MRE - Chicken-a-la-king',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    -- Supp. food
    ['mre_tmsoup'] = { 
        label = 'MRE Tom. soup',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side soup",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tintomsoup', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_corn'] = { 
        label = 'MRE Canned Corn',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side dish",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_bread'] = { 
        label = 'MRE Bread',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military bread",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_fa_bread03', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

	['mre_1'] = { 
        label = 'MRE-001',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_2'] = { 
        label = 'MRE-002',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_3'] = { 
        label = 'MRE-003',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_4'] = { 
        label = 'MRE-004',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_5'] = { 
        label = 'MRE-005',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

	----------------#### Drinks #### -----------------
	--------------------------------------------------

	['water'] = { -- Carbonized syrup is good for the soul
        label = 'Water Bottle',
        weight = 350,
        stack = true,
        close = true,
        description = "If you think you need more, you do",
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'vw_prop_casino_water_bottle_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ["citrus_drink"] = { --Refreshing citrus drink
		label = "Sprunt",
		weight = 1,
		stack = true,
		close = true,
        description = "Refreshing citrus drink",
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_ecola_can',
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        }
	},

    ['milk'] = { -- milky milky milky
        label = 'Milk Carton',
        weight = 350,
        stack = true,
        close = true,
        description = "You need strong bones for crimes",
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_tt_milk', 
            bone = 18905,
            pos = vec3(0.10, 0.008, 0.070), 
            rot = vec3(240.0, -60.0, 0.0) },
            usetime = 7500,
        },
    },


    -- COFFEES


    ['coffee_black'] = { -- Carbonized syrup is good for the soul
        label = 'Black Coffee',
        weight = 350,
        stack = true,
        close = true,
        description = "As black as the color wheel lets it be",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_mocha'] = { -- Carbonized syrup is good for the soul
        label = 'Mocha',
        weight = 350,
        stack = true,
        close = true,
        description = "What even is a mocha",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_cpcno'] = { -- Carbonized syrup is good for the soul
        label = 'Cappuccino',
        weight = 350,
        stack = true,
        close = true,
        description = "That might wake you up a smidge",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_amrcno'] = { -- Carbonized syrup is good for the soul
        label = 'Americano',
        weight = 350,
        stack = true,
        close = true,
        description = "American coffee, with an o",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },


    -- SODAS


    ['ecola'] = { -- Carbonized syrup is good for the soul
        label = 'eCola',
        weight = 350,
        stack = true,
        close = true,
        description = "Hey, there is soda in my cocaine",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_ecola_can', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['sprunk'] = { -- Carbonized syrup is good for the soul
        label = 'Sprunk',
        weight = 350,
        stack = true,
        close = true,
        description = "It tastes like water punched you in the throat",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_sodacan_01b', 
            pos = vec3(0.005, -0.001, 0.08), rot = vec3(0.0, 0.0, 160.0) },
            usetime = 5000,
        },
    },

    ['orangotang'] = { -- Carbonized syrup is good for the soul
        label = 'Orang-o-tang',
        weight = 350,
        stack = true,
        close = true,
        description = "I didn't even know people wanted this",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_orang_can_01', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['ejunk'] = { -- Drinking too much of this wont kill you. I think.
        label = 'Junk Energy',
        weight = 350,
        stack = true,
        close = true,
        description = "Drinking too much of this wont kill you. I think.",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'sf_prop_sf_can_01a', 
            pos = vec3(0.025, 0.010, 0.05), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 5000,
        },
    },

	-- ALCOHOL: Beers
    ['rancho_beer'] = { -- Good ol imported beer from mexico
        label = 'Cerbesa Barracho',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from mexico",
        client = {
            status = { drunk = 90000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['dusche_beer'] = { -- Good ol imported beer from germany
        label = 'Dusche Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from germany",
        client = {
            status = { drunk = 90000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beerdusche', 
            pos = vec3(0.01, -0.01, -0.12), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['stronzo_beer'] = { -- Good ol imported beer from italy
        label = 'Stronzo Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from italy",
        client = {
            status = { drunk = 90000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_stz', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['patriot_beer'] = { -- Good ol homemade beer from the brewery
        label = 'Patriot Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol homemade beer from the brewery",
        client = {
            status = { drunk = 90000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_patriot', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    -- ALCOHOL: Bottles
    ['bb_bourgeoix'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_cognac', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['bb_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_brandy', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['cb_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "For those fancy events",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_champ_01b', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['rb_ragga'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Ragga Rum',
        weight = 290,
        stack = true,
        close = true,
        description = "A pirates drink for me",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_rum_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['tb_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Tequilya Tequila',
        weight = 290,
        stack = true,
        close = true,
        description = "For extra kick, add snake venom",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_tequila_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['vb_nogo'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Chilled like the mountains of Siberia",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_vodka_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_mount'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "The cowboy's choice for getting plastered",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_cs_whiskey_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_richards'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "For the refined taste buds you so clearly have",
        client = {
            status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_richard', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    -- ALCOHOL: Glasses
    ['bg_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bg_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Glass of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bs_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Shot of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['bs_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Shot of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['cg_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_champ', 
            pos = vec3(0.16, -0.19, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_martini'] = { -- Good ol imported beer from mexico
        label = 'Martini',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequila', 
            pos = vec3(0.16, -0.12, -0.06), 
            rot = vec3(280.00, 90.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_sunrise'] = { -- Good ol imported beer from mexico
        label = 'Tequilya Sunrise',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequsunrise', 
            pos = vec3(0.16, -0.1, -0.05), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Glass of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ts_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Shot of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['vg_nogo'] = { -- Good ol imported beer from mexico
        label = 'Glass of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['vs_nogo'] = { -- Good ol imported beer from mexico
        label = 'Shot of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['wg_mount'] = { -- Good ol imported beer from mexico
        label = 'Glass of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['wg_richards'] = { -- Good ol imported beer from mexico
        label = 'Glass of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ws_mount'] = { -- Good ol imported beer from mexico
        label = 'Shot of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['ws_richards'] = { -- Good ol imported beer from mexico
        label = 'Shot of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 10000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

	-- USABLES: Beer crates

    ['box_rancho_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Rancho Beer',
        weight = 3500,
        --consume = 0,
        description = "Oh boy I love beer",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'v_ind_cfbox2', -- need badge props repo
            pos = vec3(-0.05, 0.8, -0.25), 
            rot = vec3(0.00, 0.00, 0.00), 
            bone = 56604 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_dusche_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Dusche Beer',
        weight = 3500,
        --consume = 0,
        description = "Oh boy I love beer",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'v_ind_cfbox2', -- need badge props repo
            pos = vec3(-0.05, 0.8, -0.25), 
            rot = vec3(0.00, 0.00, 0.00), 
            bone = 56604 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_stronzo_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Stronzo Beer',
        weight = 3500,
        --consume = 0,
        description = "Oh boy I love beer",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'v_ind_cfbox2', -- need badge props repo
            pos = vec3(-0.05, 0.8, -0.25), 
            rot = vec3(0.00, 0.00, 0.00), 
            bone = 56604 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_patriot_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Patriot Beer',
        weight = 3500,
        --consume = 0,
        description = "Oh boy I love beer",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'v_ind_cfbox2', -- need badge props repo
            pos = vec3(-0.05, 0.8, -0.25), 
            rot = vec3(0.00, 0.00, 0.00), 
            bone = 56604 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

	---------------------######---------######-----------------------
	-----------------------------------------------------------------
    -- USABLES: Ammo cases
    ['box_ammo_rifle1'] = { -- idea: Player uses item to show badge prop
        label = 'Ammo Case: 5.56x45 (x120)',
        weight = 5,
        --consume = 0,
        description = "A case of stuff to make problems go away",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'prop_box_ammo02a', -- need badge props repo
            pos = vec3(0.0, 0.7, -0.40), 
            rot = vec3(0.00, 0.00, 90.00), 
            bone = 56604  },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_ammo_rifle2'] = { -- idea: Player uses item to show badge prop
        label = 'Ammo Case: 7.62x39 (x120)',
        weight = 5,
        --consume = 0,
        description = "A case of stuff to make problems go away",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'prop_box_ammo02a', -- need badge props repo
            pos = vec3(0.0, 0.7, -0.40), 
            rot = vec3(0.00, 0.00, 90.00), 
            bone = 56604  },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_ammo_shotgun'] = { -- idea: Player uses item to show badge prop
        label = 'Ammo Case: 12 Gauge (x60)',
        weight = 5,
        --consume = 0,
        description = "A case of stuff to make problems go away",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'prop_box_ammo02a', -- need badge props repo
            pos = vec3(0.0, 0.7, -0.40), 
            rot = vec3(0.00, 0.00, 90.00), 
            bone = 56604  },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_ammo_sniper'] = { -- idea: Player uses item to show badge prop
        label = 'Ammo Case: 7.62x51 (x30)',
        weight = 5,
        --consume = 0,
        description = "A case of stuff to make problems go away",
        client = {
            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
            clip = 'machinic_loop_mechandplayer', flag = 3 },
            prop = { model = 'prop_box_ammo02a', -- need badge props repo
            pos = vec3(0.0, 0.7, -0.40), 
            rot = vec3(0.00, 0.00, 90.00), 
            bone = 56604  },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

	-- USABLES: Pizza boxes
    ['box_pizza_chs'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Cheese Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_pep'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Pepperoni Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_msh'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Mushroom Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_mgt'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Margherita Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_dmt'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Double Meat Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

	-----------------------------------------------------------------------------
	-----------------------------------------------------------------------------

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = { -- Player currency
        label = 'Dirty Money',
        description = "If you don't wash this, you're gonna be stinky",
    },

	['money'] = { -- Player currency
        label = 'Money',
        description = "The root of all evil and payer of rent",
    },

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['clothing_bag'] = { -- If you aren't using NPWD, remove the client section of this item
        label = 'Clothing Bag',
        weight = 100,
        description = "For changing your outfit on the fly",
        stack = false,
        consume = 1,
       
    },

	-- TESTING Cigarettes script

	['redwoods'] = {
        label = 'Redwoods',
        weight = 0,
        stack = false,
        close = true,
        description = 'Pack of Original Red Wood Killer Cigarettes',
        consume = 0,
        client = {
            status = { stress = -100000 },
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig002', 
            pos = { x = 0.00, y = 0.0, z = -0.00}, 
            rot = { x = 0.0, y = 0.0, z = 0.0}, 
            bone = 28422 },
            usetime = 15000,
        },
        buttons = {
            {
                label = 'Remove Cigarette',
                action = function(slot)
                    TriggerServerEvent('gr8_stuff:item:removeCig', slot, {indent=true})
                end
            },
        }
    },

	['cigarette'] = { -- social item that causes slight damage to health
        label = 'Cigarettes',
        weight = 115,
        description = "These probably aren't good for you, but fuck it",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig002', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['cigar'] = { -- social item that causes slight damage to health
        label = 'Cigar',
        weight = 115,
        description = "These REALLY aren't good for you, but fuck it",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig001', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 15000,
        }
    },

	-- If you are below the mpchristmas3 update, change the prop to 'ba_prop_battle_vape_01'
    ['vape'] = { -- social item that causes slight damage to health
        label = 'Vape',
        weight = 115,
        description = "Vape-nash bruh, tastes like dissapointment",
        consume = 0,
        degrade = 60,
        client = {
            anim = { dict = 'amb@world_human_smoking@male@male_b@base', clip = 'base', flag = 49 },
            prop = { model = 'xm3_prop_xm3_vape_01a',
            pos = vec3(-0.02, -0.02, 0.02), rot = vec3(70.0, 110.0, 10.0), bone = 28422 },

            disable = { move = false, car = false, combat = false },
            usetime = 7000,
        }
    },

	['bodyarmor_1'] = { --  Use to set body armor to 30%
        label = 'Light Ballistic Vest',
        weight = 3000,
        stack = false,
        description = "Bullts hurt a bit less with this",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

    ['bodyarmor_2'] = { --  Use to set body armor to 60%
        label = 'Medium Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Bullets hurt a lot less with this",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

    ['bodyarmor_3'] = { --  Use to set body armor to 100%
        label = 'Heavy Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Keep the extra bullets for personal vest flair",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

	['parachute'] = { -- Use to equip parachute tool.
        label = 'Parachute',
        weight = 8000,
        stack = false,
        description = "For your sake, I hope it opens at the last second",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

	---------------######--------------######--------------
	---------------######    Drugs     ######--------------

	-- DRUGS: Weed
    ['weed_sativa'] = { -- idea: use for player to hype up
        label = '1oz Amnesia Haze',
        consume = 0.267,
        weight = 1,
        description = "Nice looking bag of weed",
    },

    ['sativa_joint'] = { -- idea: use for player to hype up
        label = 'Amnesia Haze Joint',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Nice smelling joint",
        client = {
            status = { stress = -100000 },
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(-0.01, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['weed_indica'] = { -- idea: use for player to relax
        label = '1oz Afghan Kush',
        consume = 0.267,
        weight = 1,
        description = "Nice looking bag of weed",
    },

    ['indica_joint'] = { -- idea: use for player to hype up
        label = 'Afghan Kush Joint',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Nice smelling joint",
        client = {
            status = { stress = -100000 },
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(-0.01, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['weed_hybrid'] = { -- idea: higher end weed
        label = '1oz White Widow',
        consume = 0.267,
        weight = 1,
        description = "Nice looking bag of weed",
    },

    ['hybrid_joint'] = { -- idea: higher end weed
        label = 'White Widow Joint',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Nice smelling joint",
        client = {
            status = { stress = -100000 },
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },
    ---------------#####--Other Drugs--#####---------------

    ['drug_meth'] = { -- Drug Methamphetamine
        label = 'Methamphetamine',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Blue Meth at its finest",
        client = {
            anim = { dict = 'amb@snort_coke_a_male1@male@idle_a', clip = 'idle_c', flag = 49 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['drug_lsd'] = { -- Drug LSD
        label = 'LSD',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Take a trip",
        client = {
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['drug_ecstasy'] = { -- Drug Ecstasy
        label = 'Ecstasy',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "Take a trip",
        client = {
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['drug_lean'] = { -- Drug Lean
        label = 'Lean',
        consume = 0.267,
        weight = 1,
        stack = true,
        description = "The relaxing Codeine drink",
        client = {
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

	---------------######--------------######--------------
	---------------######    Items     ######--------------

	

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

    ['motelcard'] = {
        label = 'Motel Card',
        weight = 200,
        stack = false
    },
    
    ['doorlockpick'] = {
        label = 'Lockpick',
        weight = 200,
        stack = false
    },

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

    ['lockpick'] = { -- Use for doors and cars
        label = 'Lockpicks',
        weight = 100,
        description = "Modern problems require sneaky solutions",
    },

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	['phone'] = {
		label = 'Phone',
		weight = 10,
		stack = false,
		consume = 0,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["accesscard"] = {
		label = "Access Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldwatch"] = {
		label = "Gold Watch",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackerdevice"] = {
		label = "Hacker Device",
		weight = 1,
		stack = true,
		close = true,
	},

	["hammerwirecutter"] = {
		label = "Hammer And Wire Cutter",
		weight = 1,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Drill",
		weight = 1,
		stack = true,
		close = true,
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackerDevice"] = {
		label = "Hacker Device",
		weight = 1,
		stack = true,
		close = true,
	},

	["ammonium_nitrate"] = {
		label = "Ammonium nitrate",
		weight = 1,
		stack = true,
		close = true,
	},

	["ampul1"] = {
		label = "Ampulemine no 1",
		weight = 1,
		stack = true,
		close = true,
	},

	["ampul2"] = {
		label = "Ampulemine no 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["ampul3"] = {
		label = "Ampulemine no 3",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["codeine"] = {
		label = "Codeine",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygen"] = {
		label = "Oxygen",
		weight = 1,
		stack = true,
		close = true,
	},

	["pseudoephedrine"] = {
		label = "Pseudoephedrine",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_phosphorus"] = {
		label = "Red Phosphorus",
		weight = 1,
		stack = true,
		close = true,
	},

	["hydrogen"] = {
		label = "Hydrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Ice",
		weight = 1,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
		weight = 1,
		stack = true,
		close = true,
	},

	["candy"] = {
		label = "Candy",
		weight = 1,
		stack = true,
		close = true,
	},

	["sulfuric_acid"] = {
		label = "Sulfuric_Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["asit"] = {
		label = "Asitinol",
		weight = 1,
		stack = true,
		close = true,
	},

	["azot"] = {
		label = "Azotnzine",
		weight = 1,
		stack = true,
		close = true,
	},
    
    --- Project car---

    ['vehicle_shell'] = {
        label = 'vehicle_shell',
        weight = 1,
        stack = true,
        close = true,
    },
 
    ['vehicle_blueprints'] = {
        label = 'vehicle_blueprints',
        weight = 5,
        stack = true,
        close = true,
    },
 
    ['door'] = {
        label = 'door',
        weight = 325,
        stack = true,
        close = true,
    },
    ['bonnet'] = {
        label = 'bonnet',
        weight = 325,
        stack = true,
        close = true,
    },
    ['trunk'] = {
        label = 'trunk',
        weight = 325,
        stack = true,
        close = true,
    },
     ['wheel'] = {
        label = 'wheel',
        weight = 325,
        stack = true,
        close = true,
    },
     ['seat'] = { 
        label = 'seat',
        weight = 325,
        stack = true,
        close = true,
     },
    ['engine'] = {
        label = 'engine',
        weight = 325,
        stack = true,
        close = true,
    },
    ['transmition'] = {
        label = 'transmition',
        weight = 325,
        stack = true,
        close = true,
    },
    ['exhaust'] = {
        label = 'exhaust',
        weight = 325,
        stack = true,
        close = false,
    },
    ['brake'] = {
        label = 'brake',
        weight = 325,
        stack = true,
        close = true,
    },
 
    ['paint'] = {
        label = 'paint',
        weight = 10,
        stack = true,
        close = true,
    },
 
 ---• NOT SURE, IF THIS NEED TO BE IN THERE •---
    ['paint_white'] = {
        label = 'white',
        weight = 10,
        stack = true,
        close = true,
    },
 
    ['paint_red'] = {
        label = 'red',
        weight = 10,
        stack = true,
        close = true,
    },
 
    ['paint_pink'] = {
        label = 'pink',
        weight = 10,
        stack = true,
        close = true,
    },
 
    ['paint_blue'] = {
        label = 'blue',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_yellow'] = {
        label = 'yellow',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_green'] = {
        label = 'green',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_orange'] = {
        label = 'orange',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_brown'] = {
        label = 'brown',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_purple'] = {
        label = 'purple',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_grey'] = {
        label = 'grey',
        weight = 10,
        stack = true,
        close = false,
    },
 
    ['paint_black'] = {
        label = 'black',
        weight = 10,
        stack = true,
        close = false,
    },
    -----------------------------
    ------+Car Tuning parts+-----
    -----------------------------
   ['repairparts'] = {
	   label = 'Repair Engine Parts',
	   weight = 250,
	   stack = false,
	   close = true,
    },

   ['street_tires'] = {
	   label = 'Street Tires',
	   weight = 250,
	   stack = true,
	   close = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },
   ['sports_tires'] = {
	   label = 'Sports Tires',
	   weight = 250,
	   stack = true,
	   close = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },
   ['racing_tires'] = {
	   label = 'Racing Tires',
	   weight = 250,
	   stack = true,
	   close = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },
   ['drag_tires'] = {
	   label = 'Drag Tires',
	   weight = 250,
	   stack = true,
	   close = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['transmition_clutch'] = {
	   label = 'OEM Transmission Clutch',
	   weight = 100,
	   stack = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_flywheel'] = {
	   label = 'OEM Flywheel',
	   weight = 100,
	   stack = true,
	   client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_oil'] = {
	  label = 'OEM Engine Oil',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['engine_sparkplug'] = {
	  label = 'Sparkplugs Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -10000, thirst = -10000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_gasket'] = {
	  label = 'OEM Head Gasket Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -10000, thirst = -10000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_airfilter'] = {
	  label = 'OEM Intake Air Filter',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -20000, thirst = -30000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_fuelinjector'] = {
	  label = 'OEM Fuel Injectors',
	  weight = 150,
	  stack = true,
	  client = {
		  --status = { hunger = -20000, thirst = -30000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },
   ['engine_pistons'] = {
	  label = 'OEM Pistons Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
		}
    },

   ['engine_connectingrods'] = {
	  label = 'OEM Connecting Rods Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_valves'] = {
	  label = 'OEM Head Valves Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

   ['engine_block'] = {
	  label = 'OEM Block',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem' 
		}
    },

   ['engine_crankshaft'] = {
	  label = 'OEM CrankShaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['engine_camshaft'] = {
	  label = 'OEM Camshaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },



 

    ['ecu'] = {
	  label = 'ecu',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },

    ['drift_tires'] = {
	  label = 'Drift Tires',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },


    ['lsdf'] = {
	  label = 'Limited Slip Differential (Front)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	  
	    }
    },

    ['lsdr'] = {
	  label = 'Limited Slip Differential (Rear)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['tcs'] = {
	  label = 'Traction Control System (TCS)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['esc'] = {
	  label = 'Stability Control System (ESC)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['closerationgears'] = {
	  label = 'Close Ratio Gears',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['cvttranny'] = {
	  label = 'CVT Transmission',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['abs'] = {
	  label = 'Anti-lock braking System',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['axletorsionfront'] = {
	  label = 'Axle Torsion (Front)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['axletorsionrear'] = {
	  label = 'Axle Torsion (Rear)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['axlesolidfront'] = {
	  label = 'Axle Solid (Front)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['axlesolidrear'] = {
	  label = 'Axle Solid (Rear)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['kers'] = {
	  label = 'Kinetic Energy Recovery System (KERS)',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['offroadtune1'] = {
	  label = 'Offroad Tune 1',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['offroadtune2'] = {
	  label = 'Offroad Tune 2',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['stanced'] = {
	  label = 'Stanced Tune',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['frontwheeldrive'] = {
	  label = 'Front Wheel Drivetrain',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['allwheeldrive'] = {
	  label = 'All Wheel Drivetrain',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['rearwheeldrive'] = {
	  label = 'Rear Wheel Drivetrain',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['oem_brakes'] = {
	  label = 'OEM Brakes',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['oem_suspension'] = {
	  label = 'OEM Suspension',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['oem_gearbox'] = {
	  label = 'OEM Gear Box',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },


    ['elite_brakes'] = {
	  label = 'Elite Brakes',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['elite_suspension'] = {
	  label = 'Elite Suspension',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['elite_gearbox'] = {
	  label = 'Elite Gear Box',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['elite_clutch'] = {
	  label = 'Elite Transmission Clutch',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
        }
    },

    ['elite_flywheel'] = {
	  label = 'Elite Flywheel',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_oil'] = {
	  label = 'Elite Oil',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_sparkplug'] = {
	  label = 'Elite Sparkplugs Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_gasket'] = {
	  label = 'Elite Head Gasket Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_airfilter'] = {
	  label = 'Elite Intake Air Filter',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_fuelinjector'] = {
	  label = 'Elite Fuel Injectors',
	  weight = 150,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },
    
    ['elite_pistons'] = {
	  label = 'Elite Pistons Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_connectingrods'] = {
	  label = 'Elite Connecting Rods Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_valves'] = {
	  label = 'Elite Head Valves Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_block'] = {
	  label = 'Elite Block',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['elite_crankshaft'] = {
	  label = 'Elite CrankShaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['elite_camshaft'] = {
	  label = 'Elite Camshaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['pro_brakes'] = {
	  label = 'Pro Brakes',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['pro_suspension'] = {
	  label = 'Pro Suspension',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['pro_gearbox'] = {
	  label = 'Pro Gear Box',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['pro_clutch'] = {
	  label = 'Pro Transmission Clutch',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['pro_flywheel'] = {
	  label = 'Pro Flywheel',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

    ['pro_oil'] = {
	  label = 'Pro Oil',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_sparkplug'] = {
	  label = 'Pro Sparkplugs Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_gasket'] = {
	  label = 'Pro Head Gasket Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_airfilter'] = {
	  label = 'Pro Intake Air Filter',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_fuelinjector'] = {
	  label = 'Pro Fuel Injectors',
	  weight = 150,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },
   
   ['pro_pistons'] = {
	  label = 'Pro Pistons Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_connectingrods'] = {
	  label = 'Pro Connecting Rods Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_valves'] = {
	  label = 'Pro Head Valves Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_block'] = {
	  label = 'Pro Block',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['pro_crankshaft'] = {
	  label = 'Pro CrankShaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['pro_camshaft'] = {
	  label = 'Pro Camshaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['racing_brakes'] = {
	  label = 'Racing Brakes',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['racing_suspension'] = {
	  label = 'Racing Suspension',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['racing_gearbox'] = {
	  label = 'Racing Gear Box',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['racing_clutch'] = {
	  label = 'Racing Transmission Clutch',
	  weight = 100,
	  stack = true,
	  client = {
		  --status = { hunger = -150000, thirst = -50000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_flywheel'] = {
	  label = 'Racing Flywheel',
	  weight = 100,
	  stack = true,
	  client = {
		  --status = { hunger = -150000, thirst = -50000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_oil'] = {
	  label = 'Racing Oil',
	  weight = 100,
	  stack = true,
	  client = {
		  --status = { hunger = -150000, thirst = -50000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_sparkplug'] = {
	  label = 'Racing Sparkplugs Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -10000, thirst = -10000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_gasket'] = {
	  label = 'Racing Head Gasket Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -10000, thirst = -10000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_airfilter'] = {
	  label = 'Racing Intake Air Filter',
	  weight = 50,
	  stack = true,
	  client = {
		  --status = { hunger = -20000, thirst = -30000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_fuelinjector'] = {
	  label = 'Racing Fuel Injectors',
	  weight = 150,
	  stack = true,
	  client = {
		  --status = { hunger = -20000, thirst = -30000, stress = -100000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },
   
   ['racing_pistons'] = {
	  label = 'Racing Pistons Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_connectingrods'] = {
	  label = 'Racing Connecting Rods Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_valves'] = {
	  label = 'Racing Head Valves Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_block'] = {
	  label = 'Racing Block',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['racing_crankshaft'] = {
	  label = 'Racing CrankShaft',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['racing_camshaft'] = {
	  label = 'Racing Camshaft',
	  weight = 350,
	  stack = true,
	  client = {
		  --status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },


   ['ultimate_brakes'] = {
	  label = 'Ultimate Brakes',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['ultimate_suspension'] = {
	  label = 'Ultimate Suspension',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['ultimate_gearbox'] = {
	  label = 'Ultimate Gear Box',
	  weight = 250,
	  stack = true,
	  close = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['ultimate_clutch'] = {
	  label = 'Ultimate Transmission Clutch',
	  weight = 100,
	  stack = true,
	  client = {
		 anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		 usetime = 5500,
		 export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_flywheel'] = {
	  label = 'Ultimate Flywheel',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_oil'] = {
	  label = 'Ultimate Oil',
	  weight = 100,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_sparkplug'] = {
	  label = 'Ultimate Sparkplugs Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_gasket'] = {
	  label = 'Ultimate Head Gasket Kit',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_airfilter'] = {
	  label = 'Ultimate Intake Air Filter',
	  weight = 50,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_fuelinjector'] = {
	  label = 'Ultimate Fuel Injectors',
	  weight = 150,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },
   
	['ultimate_pistons'] = {
	  label = 'Ultimate Pistons Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_connectingrods'] = {
	  label = 'Ultimate Connecting Rods Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_valves'] = {
	  label = 'Ultimate Head Valves Kit',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_block'] = {
	  label = 'Ultimate Block',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'

	    }
    },

   ['ultimate_crankshaft'] = {
	  label = 'Ultimate CrankShaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

   ['ultimate_camshaft'] = {
	  label = 'Ultimate Camshaft',
	  weight = 350,
	  stack = true,
	  client = {
		  anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		  usetime = 5500,
		  export = 'lds_tuners.useItem'
	    }
    },

    ['turbostreet'] = {
        label = 'Turbo Street',
        weight = 350,
        stack = true,
        client = {
            anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
            usetime = 5500,
            export = 'lds_tuners.useitem'
        }
    },

    ['turbosports'] = {
        label = 'Turbo Sports',
        weight = 350,
        stack = true,
        client = {
            anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
            usetime = 5500,
            export = 'lds_tuners.useitem'
        }
    },

    ['turbostreet'] = {
        label = 'Turbo Racing',
        weight = 350,
        stack = true,
        client = {
            anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
            usetime = 5500,
            export = 'lds_tuners.useitem'
        }
    },

    ['turboultimate'] = {
        label = 'Turbo Ultimate',
        weight = 350,
        stack = true,
        client = {
            anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
            usetime = 5500,
            export = 'lds_tuners.useitem'
        }
    },

   ['rubber'] = {
	  label = 'Rubber',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['sulfur'] = {
	  label = 'Sulfur',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   
   ['steel'] = {
	  label = 'Steel',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['polyester'] = {
	  label = 'Polyester',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['bottle'] = {
	  label = 'Bottle',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['methane'] = {
	  label = 'Methane',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['chip'] = {
	  label = 'Chip',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },
   ['board'] = {
	  label = 'Board',
	  weight = 20,
	  stack = true,
	  close = true,
	  description = nil,
    },

   ['copper'] = {
	  label = 'copper',
	  weight = 20,
	  stack = true,
    },

   ['iron'] = {
	  label = 'iron',
	  weight = 20,
	  stack = true,
    },

   ['aluminum'] = {
	  label = 'aluminum',
	  weight = 20,
	  stack = true,
   },

	["nitro200shot"] = {
		label = "200shot Nitro",
		weight = 2,
		stack = true,
		close = true,
	},

	["nitro50shot"] = {
		label = "50shot Nitro",
		weight = 2,
		stack = true,
		close = true,
	},

	["nitro100shot"] = {
		label = "100shot Nitro",
		weight = 2,
		stack = true,
		close = true,
	},

	["drug_pinkice"] = {
		label = "Pink Ice",
		weight = 1,
		stack = true,
		close = true,
	},
}