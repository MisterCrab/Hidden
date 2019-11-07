-- TellMeWhen
ACTION_CONST_TMW_DEFAULT_STATE_HIDE 							= TMW.CONST.STATE.DEFAULT_HIDE
ACTION_CONST_TMW_DEFAULT_STATE_SHOW 							= TMW.CONST.STATE.DEFAULT_SHOW

-- Action 
ACTION_CONST_CACHE_DISABLE				 						= false 		-- On own risk, it will disable memorize cache but will reduce a lot of memory drive, it's trade-in toggle between CPU and Memory 	(required reload after change)
ACTION_CONST_CACHE_MEM_DRIVE									= false			-- On own risk, it will unlock remain cache for low CPU demand functions "aka memory killer" 										(doesn't work if ACTION_CONST_CACHE_DISABLE is 'true')
ACTION_CONST_CACHE_DEFAULT_TIMER 								= 0.01			-- "Tools.lua" offset on cache control 
ACTION_CONST_CACHE_DEFAULT_TIMER_UNIT							= 0.005			-- "Unit.lua" offset on cache control 
ACTION_CONST_CACHE_DEFAULT_TIMER_MULTIUNIT_CLEU					= 0.004
ACTION_CONST_CACHE_DEFAULT_NAMEPLATE_MAX_DISTANCE				= 60			-- Live: 60, Classic: 20
ACTION_CONST_CACHE_DEFAULT_OFFSET_DUEL							= 2.9			-- Delay until duel starts after event trigger

-- Textures
ACTION_CONST_PAUSECHECKS_DISABLED 								= 397907 		-- @return Levelupicon-lfd same with GetSpellTexture(236254)
ACTION_CONST_PAUSECHECKS_DEAD_OR_GHOST 							= 236399
ACTION_CONST_PAUSECHECKS_IS_MOUNTED 							= 975744
ACTION_CONST_PAUSECHECKS_WAITING 								= 134376
ACTION_CONST_PAUSECHECKS_SPELL_IS_TARGETING 					= 236353
ACTION_CONST_PAUSECHECKS_LOOTFRAME 								= 975746
ACTION_CONST_PAUSECHECKS_IS_EAT_OR_DRINK 						= 134062

ACTION_CONST_TRINKET1 											= 1030902 		-- garrison_blueweapon GetSpellTexture(179071)
ACTION_CONST_TRINKET2 											= 1030910 		-- garrison_greenweapon
ACTION_CONST_POTION 											= 967532		-- Trade_alchemy_dpotion_a28
ACTION_CONST_HEARTOFAZEROTH 									= 1869493 		-- Inv_heartofazeroth

ACTION_CONST_LEFT 												= 237586 		-- spell_shaman_spiritlink
ACTION_CONST_RIGHT 												= 132487 		-- Inv_bannerpvp_03
ACTION_CONST_STOPCAST 											= 319458		-- spell_magic_polymorphrabbit
ACTION_CONST_AUTOTARGET 										= 133015 		-- Inv_gizmo_goblingtonkcontroller

-- Class portraits
ACTION_CONST_PORTRAIT_WARRIOR									= 626008
ACTION_CONST_PORTRAIT_PALADIN									= 626003
ACTION_CONST_PORTRAIT_HUNTER									= 626000
ACTION_CONST_PORTRAIT_ROGUE										= 626005
ACTION_CONST_PORTRAIT_PRIEST									= 626004
ACTION_CONST_PORTRAIT_DEATHKNIGHT								= 135771
ACTION_CONST_PORTRAIT_SHAMAN									= 454482 		-- Custom because it making conflict with Bloodlust
ACTION_CONST_PORTRAIT_MAGE										= 626001
ACTION_CONST_PORTRAIT_WARLOCK									= 626007
ACTION_CONST_PORTRAIT_MONK										= 626002
ACTION_CONST_PORTRAIT_DRUID										= 625999
ACTION_CONST_PORTRAIT_DEMONHUNTER								= 236415

-- SpellID
ACTION_CONST_SPELLID_GLADIATORS_MEDALLION						= 208683
ACTION_CONST_SPELLID_HONOR_MEDALLION							= 195710

ACTION_CONST_SPELLID_FREEZING_TRAP								= 3355
ACTION_CONST_SPELLID_COUNTER_SHOT								= 147362
ACTION_CONST_SPELLID_STORM_BOLT									= 222897

-- Global
ACTION_CONST_MAX_BOSS_FRAMES 									= MAX_BOSS_FRAMES
ACTION_CONST_UNKNOWN											= UNKNOWN

-- CombatLog
ACTION_CONST_CL_TYPE_PLAYER 	 								= COMBATLOG_OBJECT_TYPE_PLAYER
ACTION_CONST_CL_CONTROL_PLAYER   								= COMBATLOG_OBJECT_CONTROL_PLAYER
ACTION_CONST_CL_REACTION_HOSTILE 								= COMBATLOG_OBJECT_REACTION_HOSTILE
ACTION_CONST_CL_REACTION_NEUTRAL 								= COMBATLOG_OBJECT_REACTION_NEUTRAL

-- UI INFO MESSAGES
ACTION_CONST_SPELL_FAILED_LINE_OF_SIGHT 						= SPELL_FAILED_LINE_OF_SIGHT
ACTION_CONST_ERR_PVP_WARMODE_TOGGLE_OFF							= ERR_PVP_WARMODE_TOGGLE_OFF
ACTION_CONST_ERR_PVP_WARMODE_TOGGLE_ON							= ERR_PVP_WARMODE_TOGGLE_ON

-- Arena
ACTION_CONST_PVP_TARGET_ARENA1									= 607512 		-- GetSpellTexture(111771)
ACTION_CONST_PVP_TARGET_ARENA2									= 136057 		-- GetSpellTexture(45993)
ACTION_CONST_PVP_TARGET_ARENA3 									= 535593 		-- GetSpellTexture(107141)	

ACTION_CONST_PVP_FOCUS_ARENA1									= 136243 		-- GetSpellTexture(111)
ACTION_CONST_PVP_FOCUS_ARENA2									= 135805 		-- GetSpellTexture(22200)
ACTION_CONST_PVP_FOCUS_ARENA3									= 135848 		-- GetSpellTexture(40875)

-- Specialization ID
ACTION_CONST_WARRIOR_ARMS 										= 71			
ACTION_CONST_WARRIOR_FURY 										= 72			
ACTION_CONST_WARRIOR_PROTECTION 								= 73			

ACTION_CONST_PALADIN_HOLY 										= 65			
ACTION_CONST_PALADIN_PROTECTION 								= 66			
ACTION_CONST_PALADIN_RETRIBUTION 								= 70			

ACTION_CONST_HUNTER_BEASTMASTERY 								= 253			
ACTION_CONST_HUNTER_MARKSMANSHIP 								= 254			
ACTION_CONST_HUNTER_SURVIVAL 									= 255			

ACTION_CONST_ROGUE_ASSASSINATION 								= 259			
ACTION_CONST_ROGUE_OUTLAW 										= 260			
ACTION_CONST_ROGUE_SUBTLETY 									= 261			

ACTION_CONST_PRIEST_DISCIPLINE 									= 256			
ACTION_CONST_PRIEST_HOLY 										= 257			
ACTION_CONST_PRIEST_SHADOW 										= 258			

ACTION_CONST_SHAMAN_ELEMENTAL 									= 262			
ACTION_CONST_SHAMAN_ENCHANCEMENT 								= 263
ACTION_CONST_SHAMAN_RESTORATION									= 264		

ACTION_CONST_MAGE_ARCANE 										= 62
ACTION_CONST_MAGE_FIRE 											= 63
ACTION_CONST_MAGE_FROST 										= 64			

ACTION_CONST_WARLOCK_AFFLICTION									= 265			
ACTION_CONST_WARLOCK_DEMONOLOGY 								= 266			
ACTION_CONST_WARLOCK_DESTRUCTION 								= 267			

ACTION_CONST_MONK_BREWMASTER 									= 268
ACTION_CONST_MONK_MISTWEAVER 									= 270
ACTION_CONST_MONK_WINDWALKER 									= 269

ACTION_CONST_DRUID_BALANCE 										= 102
ACTION_CONST_DRUID_FERAL 										= 103
ACTION_CONST_DRUID_GUARDIAN 									= 104
ACTION_CONST_DRUID_RESTORATION 									= 105

ACTION_CONST_DEMONHUNTER_HAVOC 									= 577
ACTION_CONST_DEMONHUNTER_VENGEANCE 								= 581

ACTION_CONST_DEATHKNIGHT_BLOOD 									= 250
ACTION_CONST_DEATHKNIGHT_FROST 									= 251
ACTION_CONST_DEATHKNIGHT_UNHOLY 								= 252

-- Inventory slots
-- ACTION_COST_INVSLOT_AMMO										= INVSLOT_AMMO 		-- 0
-- ACTION_CONST_INVSLOT_HEAD       								= INVSLOT_HEAD 		-- 1
ACTION_CONST_INVSLOT_NECK       								= INVSLOT_NECK 		-- 2
-- ACTION_CONST_INVSLOT_SHOULDAC   								= INVSLOT_SHOULDER 	-- 3
-- ACTION_CONST_INVSLOT_BODY       								= INVSLOT_BODY 		-- 4
-- ACTION_CONST_INVSLOT_CHEST      								= INVSLOT_CHEST 	-- 5
-- ACTION_CONST_INVSLOT_WAIST      								= INVSLOT_WAIST 	-- 6
-- ACTION_CONST_INVSLOT_LEGS       								= INVSLOT_LEGS 		-- 7
-- ACTION_CONST_INVSLOT_FEET       								= INVSLOT_FEET 		-- 8
-- ACTION_CONST_INVSLOT_WRIST      								= INVSLOT_WRIST 	-- 9
-- ACTION_CONST_INVSLOT_HAND       								= INVSLOT_HAND 		-- 10
-- ACTION_CONST_INVSLOT_FINGAC1    								= INVSLOT_FINGER1 	-- 11
-- ACTION_CONST_INVSLOT_FINGAC2    								= INVSLOT_FINGER2 	-- 12
ACTION_CONST_INVSLOT_TRINKET1   								= INVSLOT_TRINKET1 	-- 13
ACTION_CONST_INVSLOT_TRINKET2   								= INVSLOT_TRINKET2 	-- 14
-- ACTION_CONST_INVSLOT_BACK       								= INVSLOT_BACK		-- 15
-- ACTION_CONST_INVSLOT_MAINHAND   								= INVSLOT_MAINHAND  -- 16
-- ACTION_CONST_INVSLOT_OFFHAND    								= INVSLOT_OFFHAND	-- 17
-- ACTION_CONST_INVSLOT_RANGED     								= INVSLOT_RANGED	-- 18
-- ACTION_CONST_INVSLOT_TABARD     								= INVSLOT_TABARD	-- 19
ACTION_CONST_INVSLOT_LAST_EQUIPPED 								= INVSLOT_LAST_EQUIPPED 	

-- UserData 
ACTION_CONST_C_USER_DATA										= {4648,6407,4149,5237,6146,4396,6039,6455,4485,5106,5033,5306,5974,5919,5740,6894,6691,5084,6267,4387,5585,4594,3970,5366,6843,6423,4332,5328,6759,4926,6948,3718,5253,4166,5480,4389,4465,5815,5570,6820,5670,6213,6763,6901,3637,5407,6125,4302,6610,3725,6596,5093,4990,6997,6089,4952,4070,4253,5909,5577,5170,6662,5510,3949,5490,4760,5113,4995,5067,6454,6283,3668,4481,6480,6704,4879,5185,4495,5466,5929,5678,4582,7129,6160,6947,4397,3821,5481,7045,4168,4764,7261,5824,7067,7147,5168,4513,5862,6415,4074,5002,3901,6602,5255,4973,5958,4077,7215,5859,5900,7113,4488,3643,3617,3989,4996,3699,6649,5525,6936,5906,4338,5836,5392,5094,6726,6858,4967,5720,6643,7318,4532,6944,6695,6293,5421,5053,4440,6565,4584,4503,5130,4808,6273,4115,7287,5726,5286,5285,6066,7274,6055,5693,4614,5122,4840,5102,5659,4872,3832,3829,4590,5025,5007,4768,6335,3656,5710,4427,4184,5887,4865,6839,5176,5479,5846,6315,5913,4767,3633,3961,4779,5241,6110,4695,6553,5764,4841,4124,5638,5778,4987,4441,6400,5062,3809,4634,4230,3939,5160,4615,4316,4304,6876,5665,4198,6444,4701,6372,7263,4352,5861,6529,3665,5812,4379,3943,5445,5936,4940,6358,5838,4156,7012,4601,5059,6450,3745,7128,5174,4698,4603,6504,4874,5221,4989,5409,5669,6350,6209,3988,5830,3820,4526,4365,3864,4364,3741,4031,6368,3874,4682,4799,6715,4138,6346,4623,4194,5454,3751,7201,3750,4687,6135,5765,4531,6857,3786,6353,4867,5361,7160,3646,6882,4521,3801,4095,6830,6425,5965,4988,4776,5478,6230,6853,3682,5864,4916,7034,6286,4092,5475,3956,4105,5131,5420,5562,4969,7137,5363,5068,7143,6745,7142,5649,7089,6487,3675,4517,5802,4515,6033,7236,5692,4835,4780,5837,6207,4106,3755,6836,6738,4592,4086,6831,4537,4883,5944,6889,4730,4847,5081,5032,4477,3929,4842,4186,5422,5369,6269,5057,4381,6708,7196,5077,4108,3796,4132,3632,7203,5129,5932,5694,4646,4100,3606,6424,5387,6381,4447,3670,3717,5141,5701,7235,4111,4665,6467,6859,4997,3897,3930,6586,4193,5619,4493,5138,4470,5699,5781,5125,6019,3734,5024,4918,5650,4599,3712,5757,5447,3895,6051,7189,5440,5643,6798,7061,6147,3761,5071,5652,3636,3616,6393,5536,6047,5897,6766,6130,3837,4661,6628,4693,6077,6557,5287,5719,5590,4668,3600,4153,5598,4275,5419,6313,7202,7284,7205,5602,4810,4813,3613,3615,4669,6126,5762,5806,6880,5022,5064,3635,6640,4271,4796,6305,5955,7266,5218,7171,4051,5291,4197,6682,7232,5512,4010,3872,5121,3788,7257,4544,6052,6436,6272,6355,6002,3811,7106,6060,6030,7314,4217,3804,6092,6723,5290,4941,6105,6879,4335,5075,6090,5477,4180,6946,5717,4345,6887,4057,5937,6378,3706,5942,6074,4171,6604,5839,4395,6156,7321,6168,7102,6474,3983,6078,5441,3880,5313,4127,4290,7312,6884,5713,6440,4151,4881,4254,6235,4915,4410,5379,5367,3660,6227,4457,6464,4187,6800,5249,4541,5618,5809,4403,7025,6842,5848,6801,5565,5003,4520,5234,6870,4957,6698,6216,4749,7131,5273,4216,7200,3982,7036,6533,7158,3800,4073,6445,6193,6862,5755,5282,5172,4851,5305,6902,7135,4237,4028,4744,6559,4801,3976,4159,5146,6635,6543,5104,6878,5505,5051,6939,3931,4769,6212,6819,5334,5148,6521,6007,6142,5520,5890,4977,4421,4206,6300,3766,4572,4331,4785,6818,6032,6920,6023,6463,6778,4856,6388,4667,5825,4961,6443,6369,5542,5615,4716,6700,4644,6284,5970,4034,6567,6866,4242,6958,4354,5527,4404,4109,6302,4755,4174,7179,4942,5178,5073,5281,5564,5912,5095,7269,7057,6624,6775,7219,7265,5128,3854,5058,5488,5304,6617,5587,5971,6982,6950,5456,6375,5483,4306,4014,5641,6112,6065,4628,5993,3667,7110,4330,6573,5589,3625,5465,7162,4015,7222,7008,5026,6896,6449,3652,6914,6420,6256,6516,4622,4133,6069,4887,7245,6520,6716,4726,6584,6013,5592,6434,5010,5986,6244,5902,4380,4696,5766,3951,5960,6535,5663,5056,5540,5943,6686,5079,5845,5622,5037,7259,4314,3775,4506,7224,3661,4657,4098,3730,6991,4426,6068,5038,5813,6955,3919,6000,3739,5704,3869,6616,6523,4618,6087,3649,6097,6689,3884,6416,5301,4295,3664,5918,7209,4719,6666,5202,6103,5729,6597,5507,6507,4605,3825,5082,4167,4598,5236,6693,3815,3980,6339,5709,3893,5571,6847,3889,4904,7139,4619,5961,7211,4412,6253,7018,4407,6102,4860,5211,5798,5042,7238,4899,4279,6634,6299,4858,5681,6482,7145,4737,7151,5381,7133,4201,5458,4218,3968,6010,4536,6012,3743,4982,4976,7208,6767,4772,4862,5780,4436,6648,4717,5408,5708,5661,4394,5724,5179,4863,4692,3892,5910,4535,6611,6080,5377,6609,6579,4674,4689,6671,6854,4758,5645,5953,5981,4420,6998,5274,4914,4340,5362,6387,4944,6828,4888,5799,4469,4838,5323,4288,3877,7161,7240,3977,6005,5021,6931,3697,6568,5134,6588,6614,6877,4303,5750,3607,5877,5979,6340,4824,3944,5518,4645,4030,3974,5870,7024,3655,4538,5706,5754,4460,6632,6594,6242,5547,5860,6101,6001,4329,5725,4607,6765,7115,7060,3914,3733,6371,3696,6728,6538,6274,5346,5658,6053,4297,4740,6376,4889,6337,4917,6359,7035,3719,6206,5322,5761,5276,3843,7278,6085,7229,4933,6803,4647,6439,7230,6173,5869,7213,5667,5784,4596,4938,4315,4761,5433,4656,5299,6038,4118,6456,5639,5434,6560,4486,6984,6262,5261,5116,4110,5545,6050,5034,4617,7216,5821,4581,4061,5426,4876,6349,5633,6585,4569,6756,6773,6673,4745,5147,5231,3703,5368,5019,4718,6534,4442,4224,6204,5319,6848,3853,7112,4853,5166,6513,7087,6446,4479,5437,5991,5200,5110,5175,6713,5144,6422,5524,5133,6561,5956,5244,3932,4047,4021,4360,4286,6285,3886,6672,3611,6282,6462,7059,5378,6725,4649,5137,4901,5687,4857,4723,5224,6977,5052,6825,5998,6995,7002,7148,6188,3626,5356,7231,5385,3794,4943,4135,3707,5625,3812,4226,5722,7170,4885,7126,4528,5267,7307,5950,4902,6063,4006,7095,6587,6006,4533,5260,5006,3698,4585,7220,5560,6785,5462,3833,3828,4586,4591,4474,6224,5252,5885,4663,3672,4492,6556,5432,6639,4264,3622,5220,5646,5061,5807,6983,3666,5935,7155,6615,4079,5050,4143,5389,7309,6525,6338,4422,7127,6815,6205,5293,6881,4545,6656,5205,5127,4843,4631,4809,3731,5265,3835,4970,3876,5371,5382,6497,6124,5341,5398,6251,5705,4357,5414,5939,6243,4527,4257,3947,7117,7056,3822,5491,4958,5135,4929,7029,6310,5989,6458,6552,5321,6670,6460,5810,6517,5410,4551,7288,6541,5173,7258,6867,5046,5333,4739,5078,6826,7001,5634,6515,6975,6690,4820,6900,5871,6442,6687,4283,4162,5946,4084,4307,5829,6934,5311,5921,6569,4671,3628,5804,5370,5959,3942,4550,3972,4678,6712,5992,7032,3631,3838,5016,7187,4366,5632,4255,5117,6754,4391,7204,5881,7038,3644,4043,4985,3963,5250,3803,7144,7011,4464,4409,6314,5593,6501,4922,5548,4433,4984,5611,3842,5898,5543,5123,5865,5158,6849,5008,4743,3753,3965,4029,4209,6974,5183,4002,5682,6298,3819,4334,5072,4281,6811,6799,3740,5360,6739,3694,5085,6928,7053,4376,7116,5014,4556,5151,4690,5544,6245,6850,5105,5169,4956,3945,6042,5459,3871,5048,4935,6403,3870,4456,5745,7055,6496,5240,7138,5275,6963,4238,4373,6061,5210,5987,5376,4274,4612,5120,4320,3700,6162,3878,6550,5089,5752,5549,5464,5132,5852,7069,3924,5785,4196,4934,5444,4195,6222,4191,6215,4700,3816,6761,7130,6769,5569,4025,5541,6438,6599,6036,7194,4009,6548,4094,4530,5624,7217,7073,6203,4505,4053,7122,4392,4962,4781,3888,5688,6968,4250,4765,6794,6309,3722,6466,4672,4083,3997,5690,6109,3971,4199,6564,3645,3946,6927,5576,4826,3866,6796,6762,4129,7108,6108,4748,5036,5076,4453,5948,4498,3690,5831,4715,6592,6201,5415,5975,4483,6701,4697,4558,6959,6099,5115,4266,6200,5206,6398,5826,6647,5393,3906,3841,6432,7104,5789,5686,4123,4735,4991,4450,3887,4959,6706,4063,5196,6197,7297,5496,3686,4099,7037,6620,5045,6730,4308,5198,5399,4370,4234,6906,4040,4822,4476,5703,3902,7167,5264,3808,5494,5013,4355,6401,6179,6824,7239,5351,7031,4172,4351,5727,5140,6893,6924,4637,3879,3998,5582,6426,6743,4444,3927,6327,3986,3959,5922,4994,6225,6500,6629,4611,6979,4309,4731,7272,4189,6838,4408,3789,5660,4310,5613,7136,4207,6774,4358,7176,4553,6170,7285,3857,6048,4852,6136,6024,4861,4229,5600,6145,6250,6086,5695,5270,4708,3964,6367,6373,3967,4080,6532,4752,6519,4597,5685,5388,4178,6008,5957,7310,4413,4900,4272,7180,6236,5258,6637,5194,4348,3769,4937,5336,6953,6903,4923,6566,5609,4484,4724,5395,4968,3685,3614,4721,6083,6732,6807,6331,7152,5495,6582,5219,6120,4972,6816,5621,7182,6266,5934,5017,6810,6441,3729,6978,6737,4795,3991,4508,6935,4710,4430,6758,7188,7300,6873,3920,5803,5439,6195,6852,5087,5623,5700,3624,5268,6394,7003,4155,4652,5896,3676,4071,7163,4244,5492,6328,6748,5834,4948,4578,4784,4950,6954,4684,4252,4931,3776,4975,3609,4762,6336,5384,7212,4144,5775,4463,4247,3689,4419,6082,5758,7042,5684,5894,5416,4753,5893,4417,4507,7141,5430,4326,5136,6510,6297,6863,4839,5737,7279,4554,6238,6088,4845,6717,5675,5631,7111,5372,7006,5951,6812,3716,4231,6399,6404,7192,6249,3915,5654,6864,6277,4504,6851,6095,6731,7082,5796,4573,3818,4502,4754,5404,6428,3653,6645,3662,7014,6037,4179,4423,4848,4414,5163,3774,5840,3900,5763,6654,6747,6475,3748,5584,4828,5303,7308,5647,6821,5317,6720,5167,6071,3639,5365,4981,5403,3859,3807,4589,4280,4496,5841,6787,6780,5083,4567,4954,7320,3917,6275,4960,3999,5575,6751,4722,5054,5297,4702,4054,5854,7191,3773,6163,3850,6260,3995,4792,4482,5968,3715,4082,4363,5031,6684,5298,4277,4654,6768,4877,5353,4104,5561,4353,6653,3883,4276,6845,5070,5566,4004,5086,3896,5235,7023,5262,6332,5895,6813,4246,3671,5581,6046,4466,6252,6961,5108,5735,3863,4278,3777,4653,5702,5023,6677,6143,3604,4487,5743,4103,4452,4525,4579,6788,6187,4564,4523,6240,6833,3911,5310,7079,4778,4786,4510,5603,7247,4145,5318,5751,4042,4052,4791,5827,5453,5676,5628,4362,3979,4165,6956,5629,3913,6633,6049,5707,6760,4050,6703,4529,6347,5843,6301,4673,7009,6872,6164,5779,4462,6144,4805,5905,6898,4223,6619,4402,3714,4336,4001,7185,7164,5872,3629,4651,4349,5923,5620,6437,6311,3619,3826,6447,6926,5747,5364,4259,7184,4432,5928,6865,6079,4368,6384,5005,6985,6192,3984,6043,7093,4008,7242,3784,5257,4032,6897,5278,6211,4046,5952,6625,7302,5880,7178,6318,3601,3851,7169,4317,5473,7221,5309,6158,5012,4069,6391,6270,4163,4895,5394,6132,6829,6895,4802,5656,5588,6988,7168,6874,5225,5476,6558,7228,3934,5873,3680,7021,6505,3960,6261,6907,6377,3765,5914,6016,4341,5340,3905,4794,3899,4837,6855,5677,4284,6303,6638,4787,6964,7304,7099,4227,4518,3938,7118,6028,3848,3756,5229,5771,3647,5901,4655,5338,6031,5801,6527,3747,4044,4204,7097,6919,4152,5204,4160,5867,6296,3935,7050,6237,5712,6789,6308,5833,6433,3736,3904,6932,4458,5186,3907,6683,7165,6917,4833,6714,4384,6860,7007,4393,3754,6380,7322,5977,4610,6021,6202,5461,3728,6118,5090,3856,5504,6702,4964,5391,6281,5011,7183,5153,5227,4709,3757,5996,5109,4000,6888,4203,4154,6395,7153,6345,5696,5734,4101,5486,7123,5124,6786,6106,4075,6081,6214,7078,4920,7121,5672,7083,4385,4490,5795,6307,5741,6382,6366,4986,6172,5277,4927,5091,5207,5314,3985,4024,4212,3721,6797,7157,4134,3948,3638,5289,4829,6451,3798,5514,4974,3908,6652,7109,4570,4733,4819,7041,4910,4727,3922,3634,6930,5557,5201,6128,6386,3813,6508,7319,4827,4736,3890,5637,4807,3691,6429,6661,6494,6431,4919,3928,4102,3727,4951,6694,4220,5238,6044,6941,6499,3990,4816,6268,7154,4638,6363,7199,7174,6015,7214,6351,6167,5259,6417,5429,5271,5715,5883,5216,4750,3659,6752,7268,4763,6709,7246,6330,6231,6488,6096,5119,4425,6430,3767,5907,6970,4273,5739,7066,4228,5933,7298,3674,3759,3630,6323,6589,6996,5320,5335,5746,5165,4405,4418,4327,5308,6427,4142,4798,4339,6058,5114,5214,3860,5875,5111,4369,6755,5145,6098,5487,6679,4998,3627,5614,5523,5142,5842,6546,6477,4214,3737,4625,7175,5096,4287,7244,5438,5644,6711,4789,5608,5040,7291,4884,4128,4812,6208,3847,6465,5418,5552,5760,6344,6918,5648,3602,5027,4775,5344,4248,5772,4911,5035,4846,5345,4593,5617,5954,3793,4542,3873,5039,4003,4869,5472,6814,4164,5467,4854,4640,3898,5612,7125,5222,6258,7080,4892,5610,6411,4122,4177,6479,5917,4319,4150,4045,4181,5497,6255,5879,6676,6233,5451,5721,4267,5882,6111,5858,6115,5718,6154,3713,5460,4323,5595,4491,3752,5324,6675,5000,4037,4864,4642,4472,4788,6630,4011,6410,6642,5800,6646,7022,3723,5651,4633,3762,4424,4821,6526,4386,5711,5383,4147,5797,5596,5770,5390,6750,7292,6792,7286,4803,5482,7000,5217,5411,3834,6680,6383,3957,4905,6127,5402,7234,5579,3894,5150,5247,4725,4260,7190,5868,3953,6802,4873,3612,3993,4438,4519,4451,5962,6655,4406,4756,4096,4265,4262,6176,4704,5209,3663,6289,6247,6072,3654,4268,6493,6949,6503,6484,4439,4953,3695,4213,3744,6166,5449,6185,7250,7020,3792,6364,4467,4546,6217,4728,6114,6522,4245,6414,4978,3975,3926,5558,7277,6710,6374,7282,5980,6562,4215,5964,6664,6157,5568,5818,7273,6727,5509,4359,4372,5343,3831,5197,4058,5554,5066,5373,5526,5154,5983,6840,5985,3679,4471,5203,6239,3657,7030,5572,5599,7105,6280,7120,3852,5749,6107,4261,6220,4282,5888,7064,6329,4946,4949,4126,5967,5591,6678,4022,6361,6987,4635,5098,6601,5177,6181,3770,6461,6104,6402,3996,6735,6578,5326,7062,5508,6229,6040,6892,4200,5350,6020,5223,5627,5192,4356,4734,4685,4390,5099,5239,6379,6598,4240,5349,3867,6199,7004,6159,6782,5412,4906,5594,3827,7206,4641,5436,4616,6622,6962,5357,6034,5425,5397,5400,4677,4686,5853,4855,5982,5607,4500,7243,6945,4090,5567,4659,6041,6485,5474,4131,4117,4324,4062,6981,4886,5004,4604,6075,6138,5689,4429,6886,6362,5226,3642,4263,5551,6593,4595,4691,3918,7260,4738,6921,5018,4560,6733,3810,3903,6279,4183,4675,6827,5041,5413,6486,5578,4814,6352,4557,3618,5327,6885,7091,6524,5100,7052,6343,6094,6149,6804,5924,3709,5533,6148,6492,7077,5697,4741,6650,6054,5744,4039,6295,6017,4139,3862,3954,6908,4270,4415,7295,5060,6581,4624,5738,3868,4747,4294,3858,5157,5029,6057,6891,3610,6784,6570,6651,6696,4562,5242,4849,3881,5184,4140,4081,4012,4182,4566,7253,5256,4333,3994,5044,7065,4173,4499,5930,4221,4033,3849,5828,4894,5973,4208,5546,5342,4516,4751,5814,4437,5292,3891,4038,6419,4116,4559,5251,6967,6742,4587,3735,5500,4291,7092,5446,6483,4903,4299,4859,4773,7017,3909,6326,3916,4757,6729,6989,7255,7096,6155,3992,5284,3688,6681,5782,7262,6571,4811,5777,6121,4055,5428,5028,4298,5555,3683,6603,4588,6011,5811,5926,4478,3749,5181,3732,6259,4630,4157,6899,4350,6322,6333,4643,3923,4141,5359,6971,4621,4146,6129,5374,4664,4650,4446,7107,7210,3771,4713,4680,5925,5263,7225,5302,4658,5272,5995,4878,4056,4509,5139,4703,6835,3969,6547,6555,4866,3955,4076,6116,5511,5325,3710,6174,5331,3795,5015,5748,5671,5783,6832,4119,6495,7177,3799,4512,7076,4378,5435,5452,6182,4844,5855,4620,7193,7013,5884,5199,6741,6091,4627,5616,5300,6481,6292,5417,7043,4629,4342,6498,7051,6793,6312,5043,4023,6530,7090,5773,6018,4049,6871,4893,4543,3621,7058,5732,3763,6113,6152,6549,4321,6027,6288,4676,6397,5212,4445,6809,4936,4459,4382,3806,4027,4190,5716,6122,7226,6186,5535,7046,4300,4882,5857,6986,6631,4400,5450,5528,3603,4305,7172,4524,6246,7085,6699,6169,3844,6151,4411,5208,5792,4939,4347,6014,7237,5020,6180,7084,5911,5899,4431,4192,5107,4416,5080,7015,5396,6685,6542,6084,5516,3791,4555,3669,6357,4107,6189,6502,6627,6938,4125,4679,6772,4235,7303,6183,5915,4908,3885,6795,4580,4018,3702,5182,7132,5049,6324,6909,6749,7119,6600,4377,4834,5502,3780,4815,6757,6035,4161,5339,3802,3623,5984,6409,5945,3651,7063,5642,4428,3936,3814,6478,5793,6554,6856,4522,6817,7010,4158,3941,6320,6472,6365,5152,5994,5969,6736,4169,7270,5963,6234,6254,4091,7181,6910,4928,3764,4243,5155,5424,6184,5406,6922,6412,4913,5976,6861,4137,4771,3782,3940,5279,5835,4367,3962,4602,5347,5190,4632,6658,5927,6062,6545,6123,3724,4707,7070,6976,6342,7283,6644,6608,6059,5788,3620,4232,4066,5655,7071,3648,4993,6140,5691,6915,4170,6354,6925,3973,4233,6966,6697,5230,7072,3787,6992,4473,3958,5213,4797,4344,6905,6178,7149,7248,4639,6972,5891,5529,5427,4729,4251,5295,7186,3677,6491,6390,5358,4475,4742,6418,7233,7098,4670,6844,5159,6590,5742,5484,4064,7294,6613,4494,4714,4311,6912,5118,7290,6396,5832,4574,7054,6626,7166,6100,7293,5126,6990,6790,5443,4549,3605,6003,5586,4067,6869,6248,3785,7218,4375,4121,6210,5063,5679,6139,4176,6577,4732,5850,6657,5683,4374,4804,7039,3726,6868,7074,5519,4269,7019,5248,3952,5329,6943,5442,5583,3910,6933,4401,7197,6753,4019,4898,3701,5698,4606,7315,5886,4383,4955,4087,4540,4980,4241,4683,5866,5878,5489,5180,3912,6621,5791,5469,6606,3836,6490,4666,5532,4924,5723,5296,3846,7241,6822,4343,6304,4225,6940,6045,5055,6663,5874,6904,6306,6623,3855,5908,6459,5337,6576,3768,5790,4966,5266,7264,7114,5092,3658,5189,3705,5674,7134,3781,5820,5819,6719,4563,6937,6009,5307,5515,6196,5931,4322,5550,3760,5112,6539,5457,6004,6469,6392,3738,4136,3783,6724,5143,3758,6257,4085,5312,3708,4921,3981,7299,4681,6131,5375,5680,6119,4880,4608,6512,6575,6776,6452,6574,5805,4293,5662,4065,5626,7301,5940,6688,3641,5101,5316,4534,4746,4328,5246,4836,6563,5191,3978,4932,6536,6537,6783,6746,5947,5794,3937,6117,7028,6837,4113,5499,5074,3950,6470,4289,4175,5470,4818,6067,4945,7026,5553,6969,6518,5103,3921,6551,6348,4832,5714,4868,4875,4662,4571,5876,5522,6674,5653,6294,5978,4455,4016,3598,5065,5768,4005,7256,5463,6805,4114,4831,4907,6692,4112,6232,6457,5597,5823,4461,7289,6618,4443,5380,5330,4211,4371,5563,6994,5030,4249,4480,5666,7254,4870,5539,4301,4774,5904,7103,6287,3845,4930,5728,6489,6705,5001,5863,5288,6965,4548,3673,4712,6777,4705,4434,6194,4148,6890,6435,4210,5767,4020,7280,4068,6133,3840,5903,4388,6721,4202,4782,5448,6405,6029,4007,4759,5506,4568,6221,4236,4097,3692,6134,6241,7033,4817,7251,7227,5386,5401,4925,4694,4965,4777,4041,6228,6413,4992,6718,7311,3933,6528,6511,4511,5776,5315,6781,6334,4806,6973,4583,5501,5604,3608,6779,7317,4577,5423,6911,5485,3778,3925,5156,4188,5233,4636,4793,4711,5069,4850,4800,6531,5990,4093,5513,3839,5531,6916,4089,5332,6070,7040,4468,5856,6957,3693,5999,6841,5736,5733,5847,5355,5228,5195,6707,7088,4660,3650,6540,3830,6171,5844,6341,6389,4539,6448,5756,7005,5097,3684,5657,7027,6219,6264,5405,6665,4823,6291,6025,3861,5988,4783,4501,7223,4947,6999,7068,7313,6263,6636,4036,6370,7198,4699,4296,6153,3790,5534,6980,6669,6509,5088,4072,5493,5817,6408,4448,5468,5731,4609,5047,6360,5254,4258,6223,7081,6740,6667,5243,4971,3882,5753,6165,6161,5851,7101,5521,5283,5816,5916,3779,5503,6191,4896,6923,4048,6356,6591,5972,6073,6218,4489,5601,6290,5606,3742,3823,3640,4825,6595,6198,5188,6137,5580,7267,7049,5538,4435,6572,7316,3599,5673,4130,7207,4017,5348,6321,4766,5498,6406,4059,7146,6506,6846,5636,6421,5162,5635,4575,6453,3720,6093,4871,6471,6226,5009,3746,6316,3797,5941,3687,6385,5808,7016,4963,4912,3817,6076,4013,7195,6993,4890,5269,5171,5787,6317,5431,6883,5352,5517,4060,4078,5559,7156,6265,4909,4035,4600,5920,4312,4346,6806,6764,7281,7296,3805,6834,6641,5280,4088,6175,6791,6190,4219,4770,4313,4790,6476,5573,7252,6141,6605,5245,4454,5471,5759,6659,-1,87,97,85,24,83,84,63,97,88,87,109,68,68,70,83,22,59,118,18,123,83,70,125,31,122,30,59,117,112,83,91,60,64,60,18,66,65,31,11,66,87,87,63,63,81,97,68,22,31,71,120,105,11,127,85,88,90,89,90,87,91,84,26,86,65,22,84,86,56,65,90,87,18,80,123,63,21,64,87,83,91,83,121,227,118,86,59,88,21,87,31,95,71,59,97,63,59,84,88,64,21,87,63,70,63,87,33,70,69,60,93,15,66,101,59,21,64,60,81,90,91,99,82,64,71,91,20,23,87,66,124,63,69,90,84,68,80,28,88,84,83,66,83,90,59,81,80,22,91,80,25,80,94,67,18,91,108,91,64,83,27,89,63,82,23,60,80,97,80,71,93,68,95,8,81,67,87,90,80,22,70,83,91,92,87,92,80,80,95,15,6,95,105,84,21,18,28,95,87,27,91,69,70,60,65,81,90,59,87,63,6,27,83,60,95,70,119,93,67,65,64,87,63,60,63,60,2,91,80,71,114,84,4,18,80,116,91,18,56,91,59,56,91,68,114,63,84,8,83,18,63,84,91,102,28,71,95,56,123,86,16,28,90,70,119,92,66,1,56,68,92,30,60,18,0,114,101,23,22,117,63,27,63,76,82,21,68,83,116,24,59,80,83,27,60,71,80,83,95,88,90,21,20,83,22,64,83,20,80,65,28,56,109,87,31,83,115,80,63,60,88,94,70,84,87,70,27,31,70,21,70,80,83,66,81,66,109,85,103,69,59,15,80,100,64,87,56,95,63,63,81,92,18,115,80,22,81,56,23,65,71,81,120,75,21,68,79,87,164,68,80,6,92,11,83,122,90,83,89,87,28,70,71,8,70,59,27,64,92,34,56,101,81,65,87,64,24,31,87,85,91,60,22,71,98,108,59,91,18,123,66,71,22,90,81,85,27,69,91,23,63,87,88,63,83,24,67,60,121,91,63,27,60,88,18,28,88,59,95,60,67,63,27,91,87,68,90,70,60,31,85,106,8,95,70,88,68,21,24,20,24,90,89,85,91,79,2,18,114,80,101,100,88,71,22,70,91,83,60,21,70,65,18,84,63,80,87,91,63,84,87,60,81,87,98,63,95,59,70,116,91,69,71,95,80,66,87,101,64,95,86,5,92,87,95,83,63,18,80,63,95,83,211,23,84,81,66,70,56,91,18,60,66,60,31,59,18,56,70,81,66,60,18,92,21,69,87,60,69,22,115,22,83,60,63,83,63,59,86,94,96,89,63,95,65,68,119,83,70,66,89,65,116,89,87,91,63,86,91,21,71,80,70,92,93,72,5,207,86,92,56,70,91,22,87,81,114,18,93,8,91,18,80,68,101,63,65,20,125,22,82,113,91,27,83,94,86,86,30,91,122,56,83,94,9,101,26,27,80,87,8,87,11,87,121,120,66,106,115,31,80,49,28,26,89,24,87,64,68,24,87,91,87,64,22,16,87,90,203,63,21,28,87,63,91,87,125,93,59,87,21,80,95,63,84,71,28,22,59,21,81,63,63,114,59,87,22,64,63,11,21,22,82,63,91,21,30,80,87,107,60,88,84,109,98,116,65,66,6,86,71,109,88,22,63,59,93,101,65,91,197,65,60,83,63,90,87,52,68,27,80,81,90,70,22,21,75,68,87,7,120,15,71,126,66,91,65,75,59,71,84,92,82,71,92,69,23,88,60,83,21,8,63,203,28,59,91,86,63,29,64,81,84,68,21,98,86,26,94,65,105,66,95,95,88,65,16,60,89,116,66,119,86,89,92,115,91,22,66,56,39,25,8,83,71,23,18,91,87,29,24,22,100,90,90,105,84,93,105,60,87,90,90,88,70,30,115,69,26,18,103,59,80,69,83,22,60,95,89,91,67,70,24,28,68,92,90,87,87,20,18,95,80,64,71,71,88,92,11,66,113,87,84,65,65,80,80,81,56,16,22,80,22,28,86,93,120,70,83,66,95,89,91,18,59,66,21,88,122,64,18,22,11,88,115,18,28,105,63,154,87,83,87,91,80,89,63,18,93,63,80,21,60,95,87,70,60,56,83,83,28,83,63,56,106,63,65,71,115,63,87,117,92,71,98,92,87,87,29,89,71,2,94,121,24,86,81,56,70,158,22,28,67,73,99,18,71,66,83,82,88,82,64,8,21,65,22,15,15,70,109,31,63,31,26,63,59,30,210,81,70,88,69,91,18,83,89,20,118,75,66,63,90,122,63,18,70,66,87,21,119,60,56,22,5,100,63,68,18,70,95,70,122,80,59,47,86,20,22,21,64,70,63,106,60,23,71,79,81,90,60,84,90,66,6,26,21,84,59,87,85,87,66,64,115,87,66,59,88,90,91,64,83,59,60,63,59,88,101,68,123,16,21,82,22,124,105,70,59,101,90,92,80,92,65,80,59,15,70,18,64,83,118,86,68,18,8,115,66,90,3,60,22,91,56,56,80,81,66,80,115,69,90,16,60,4,87,59,244,18,27,60,68,63,63,22,27,86,26,70,100,56,137,60,60,119,66,21,82,66,64,24,80,81,88,63,63,87,82,71,28,87,112,87,83,92,63,59,70,65,21,96,95,70,88,63,66,63,70,118,86,120,60,87,80,83,81,71,70,21,101,91,60,106,115,21,84,64,95,71,18,69,87,60,115,66,93,83,56,69,66,102,80,80,4,60,30,22,63,83,11,91,82,59,90,30,84,95,80,22,84,91,93,89,90,91,86,24,105,117,66,63,92,64,82,18,27,115,59,106,70,80,218,63,65,76,95,68,91,4,22,76,24,80,30,86,18,8,84,18,86,83,91,23,69,66,21,80,59,29,59,86,18,64,64,59,63,79,59,82,81,101,80,65,89,70,22,94,92,60,22,107,95,101,65,69,110,84,18,60,87,109,84,191,59,87,65,87,70,216,80,22,86,88,93,80,12,30,115,59,105,28,84,105,105,109,89,117,66,121,18,87,87,18,59,5,82,15,82,83,95,83,15,65,71,89,64,63,68,18,15,82,95,95,59,59,84,65,21,83,88,59,22,91,90,84,83,84,22,83,90,86,59,65,56,91,112,93,87,84,80,91,8,60,68,22,83,68,95,71,94,184,80,31,71,25,113,80,66,83,65,93,70,70,30,109,65,89,21,91,88,214,59,65,88,63,60,11,92,122,102,92,60,16,65,84,85,95,56,87,83,117,70,80,87,59,88,28,117,28,56,68,87,80,79,84,30,86,69,15,121,115,127,6,87,80,28,64,93,93,60,56,91,92,121,87,63,86,64,65,66,15,24,124,84,87,29,27,81,89,16,87,60,80,70,101,69,118,87,24,94,84,83,65,69,94,66,56,66,79,24,59,114,28,71,87,81,100,11,21,66,66,91,59,85,95,18,64,18,86,60,81,30,18,63,59,6,60,83,85,28,27,56,1,87,83,24,66,66,115,71,11,80,87,67,59,91,85,68,92,9,14,86,68,69,87,27,70,81,60,112,3,68,89,93,59,80,64,27,112,91,22,21,187,21,66,124,92,65,71,87,25,70,21,65,56,113,21,59,65,60,28,80,24,63,65,69,102,83,188,91,85,5,83,59,40,87,71,18,27,105,95,20,80,63,64,63,63,63,70,94,81,88,65,91,91,18,214,60,66,64,65,122,70,18,56,118,119,18,56,93,80,127,101,75,60,59,66,71,115,28,91,70,83,82,59,92,80,66,27,64,70,109,109,119,89,92,8,16,88,27,5,89,67,30,111,21,88,94,29,56,65,87,60,115,71,82,87,63,88,60,70,63,87,68,87,29,21,86,63,87,70,97,18,87,28,246,80,65,59,86,81,87,122,106,92,115,26,88,76,82,101,91,81,86,87,83,80,81,69,59,69,65,68,23,15,56,84,8,65,83,91,87,65,83,86,18,83,11,60,18,92,112,60,65,20,69,79,98,4,101,101,88,71,18,63,120,80,121,22,109,89,26,87,65,88,83,71,89,68,65,66,102,92,68,87,86,66,26,18,27,84,91,102,92,15,109,118,114,87,87,83,16,121,28,65,70,90,69,69,59,86,92,97,80,27,71,92,83,83,112,83,22,18,23,18,92,87,63,30,87,84,70,86,84,106,80,84,70,80,59,56,80,92,106,65,30,83,15,64,113,24,70,60,92,88,68,65,63,82,102,16,22,71,87,91,87,252,20,60,92,88,66,127,18,93,64,94,127,106,5,63,84,86,109,87,56,105,107,69,93,56,21,59,92,21,0,80,95,66,65,71,56,94,71,91,18,60,86,91,69,87,31,92,93,77,102,67,115,97,2,83,83,86,25,59,88,30,86,123,60,95,98,91,82,64,60,81,70,26,86,95,107,60,60,21,83,109,22,132,95,85,70,69,84,65,90,65,83,80,8,83,63,70,70,95,18,63,31,95,22,92,27,89,69,87,65,63,63,23,67,59,95,87,105,86,162,59,63,22,88,68,88,68,93,88,22,85,95,71,29,27,94,63,60,60,64,80,4,82,89,86,71,63,95,59,88,165,63,83,105,2,60,106,80,70,28,68,27,9,89,84,18,80,87,18,88,63,4,60,83,67,163,80,94,92,71,95,24,76,91,65,85,56,114,92,119,87,102,87,88,21,56,66,21,65,87,125,87,56,121,89,90,84,29,89,88,91,105,84,76,92,91,24,22,80,92,65,88,25,110,70,87,60,93,22,22,69,109,70,60,63,18,99,60,24,23,66,87,94,26,2,60,18,63,76,20,60,65,63,64,116,68,64,89,60,95,59,105,89,22,63,88,64,69,83,87,91,88,105,21,83,250,22,56,59,65,83,60,83,95,22,88,87,21,80,63,18,70,88,80,31,71,81,70,83,105,90,82,60,70,21,80,31,83,19,70,87,65,90,66,230,22,66,81,83,222,70,95,69,88,82,71,21,63,71,91,94,241,27,121,68,86,63,106,124,106,18,60,17,94,95,101,60,18,80,87,89,87,102,87,85,18,65,84,92,92,65,27,21,87,120,21,71,61,83,90,87,83,66,84,89,60,105,60,98,90,22,97,65,24,23,29,59,87,66,18,91,60,60,5,60,16,70,83,18,87,60,63,21,15,80,12,81,80,94,84,115,65,59,81,80,93,92,56,121,18,68,21,95,68,27,95,65,71,56,22,119,95,22,80,14,71,95,37,59,63,80,69,63,83,106,21,71,71,91,84,95,102,64,60,104,63,92,117,84,116,86,91,83,28,21,60,69,22,80,72,116,95,21,64,116,65,60,18,22,81,60,95,97,86,81,56,68,65,112,87,115,101,92,64,145,102,68,119,94,11,83,83,87,73,83,64,101,21,86,84,81,113,60,56,91,92,89,11,29,86,21,70,106,70,80,82,21,88,66,123,88,101,83,80,65,60,70,31,63,71,109,92,125,106,59,93,80,59,95,82,70,70,64,64,84,84,87,101,56,71,10,116,59,86,90,18,125,125,63,71,87,107,65,60,98,86,56,83,60,69,71,64,95,71,91,66,28,92,3,64,91,27,63,21,21,20,65,89,119,22,98,172,64,21,118,115,91,24,83,230,59,98,87,23,56,92,64,66,18,92,63,80,60,56,83,82,86,88,63,22,59,84,71,59,91,80,66,88,83,82,63,87,102,80,56,115,96,31,91,24,95,70,63,84,60,26,22,60,59,67,8,63,87,106,65,80,87,65,21,18,27,69,65,24,87,87,84,94,68,105,70,87,90,63,69,113,59,106,60,97,105,86,27,6,80,166,64,60,86,2,90,28,18,87,66,22,83,63,64,91,65,23,2,22,24,84,26,91,106,87,91,82,246,86,21,92,95,69,87,91,21,85,5,119,95,18,105,21,68,63,86,27,84,66,91,60,66,114,11,23,92,102,67,68,59,101,59,90,24,106,90,118,83,92,63,63,121,8,59,109,80,70,23,83,21,91,92,84,87,84,65,87,92,22,69,63,97,95,22,81,90,95,92,97,75,86,56,60,65,66,87,31,66,56,64,22,109,119,95,59,75,28,26,65,87,83,17,56,90,20,63,6,21,33,21,79,115,92,84,83,59,27,21,83,69,63,81,70,24,83,63,116,68,81,63,83,97,31,118,87,59,22,81,27,87,22,87,95,64,59,95,87,18,91,128,97,87,71,21,60,60,60,87,24,86,70,63,65,71,64,18,68,121,85,69,20,7,18,27,66,66,26,80,109,89,21,2,21,90,98,60,89,65,80,117,83,22,80,18,30,80,80,87,28,100,92,80,21,84,89,30,100,127,80,90,115,71,70,74,21,88,71,105,60,2,88,87,65,5,60,86,27,92,91,70,81,86,86,59,80,106,91,83,8,97,88,95,88,65,21,66,92,59,81,65,29,28,56,28,84,119,91,80,71,60,87,81,68,91,59,66,18,81,87,67,59,21,21,117,81,112,71,66,21,92,8,66,92,21,81,90,66,21,80,59,68,80,89,63,83,81,24,80,30,83,8,83,15,92,28,16,88,105,102,82,113,80,115,59,22,59,84,64,91,6,60,92,18,88,18,86,83,90,87,87,68,63,80,89,23,124,16,86,83,18,80,65,80,115,59,91,59,8,24,86,87,68,83,115,92,116,71,59,87,22,71,18,84,64,84,71,83,95,29,59,18,59,24,90,137,28,81,2,24,82,63,78,68,87,121,21,118,63,112,63,16,60,22,88,5,85,6,70,84,102,21,87,80,84,85,24,90,90,15,60,178,98,63,197,18,29,28,85,87,82,29,21,84,80,87,86,101,22,88,71,81,87,18,84,92,56,59,4,18,56,105,91,131,22,29,60,21,64,70,87,71,63,17,2,26,81,60,24,18,68,91,59,71,64,63,84,84,79,92,98,63,60,28,86,24,18,68,22,64,92,91,21,81,87,31,68,60,25,27,63,34,11,93,93,79,80,60,63,18,69,80,90,85,63,83,60,69,56,91,91,83,63,22,65,88,18,64,113,60,64,70,77,60,68,88,98,1,120,70,80,23,90,119,22,119,18,84,22,95,65,71,107,29,7,30,91,91,22,86,93,87,26,55,28,91,102,84,64,70,92,87,63,63,67,80,22,83,8,63,28,60,84,87,66,14,22,95,66,95,60,21,56,21,106,83,87,63,98,68,91,59,64,59,118,88,66,63,65,56,60,168,67,86,63,12,23,70,63,63,70,83,24,26,84,8,24,71,60,18,92,90,82,28,95,64,87,60,21,91,65,88,31,16,85,21,63,80,63,89,27,75,83,109,68,120,89,68,126,94,88,93,29,92,34,69,124,21,21,71,115,60,87,70,63,56,1,22,105,80,60,91,56,18,92,70,56,21,95,81,82,67,63,84,24,93,7,124,22,18,66,101,83,64,28,64,67,121,90,65,68,102,69,93,87,121,189,68,20,83,80,90,59,59,26,56,83,92,29,63,92,86,90,90,84,87,87,94,56,80,106,89,84,18,0,8,30,87,113,65,59,95,87,16,233,89,96,59,93,91,22,31,70,92,92,66,123,91,63,60,53,95,112,64,70,92,68,22,95,71,86,66,69,122,83,127,87,71,0,18,91,70,227,101,22,59,102,64,63,85,18,55,59,7,95,83,91,109,81,69,80,87,92,65,91,87,85,20,113,59,68,87,82,64,27,88,15,63,86,20,69,91,66,80,84,88,114,83,69,93,28,90,80,123,63,91,93,80,122,15,85,125,70,87,8,95,87,91,59,92,24,64,117,91,80,82,26,95,60,86,89,81,64,59,112,83,122,85,87,80,66,81,86,93,86,171,89,84,152,90,97,70,65,87,63,56,114,63,68,18,92,71,87,22,106,88,21,15,18,71,64,29,98,124,60,95,233,86,65,69,82,60,56,59,59,89,95,221,64,91,66,70,70,63,21,93,116,87,80,87,90,207,92,91,65,80,84,63,69,95,84,80,68,95,11,80,87,90,63,56,119,27,86,95,80,66,88,81,92,16,8,56,83,59,64,89,5,93,90,114,123,48,65,15,104,87,64,88,81,102,84,131,105,59,84,80,59,80,27,92,252,23,64,90,64,27,68,63,12,98,92,65,21,87,238,22,18,6,106,93,63,66,65,68,28,70,30,91,60,109,83,92,65,24,59,87,109,80,81,106,26,16,83,88,75,22,65,89,26,66,59,59,90,81,64,3,82,80,18,66,69,18,71,87,88,97,97,80,123,100,89,70,115,3,106,68,81,59,87,91,87,80,70,90,90,18,63,83,56,66,191,89,125,21,22,65,83,86,18,60,126,83,84,63,87,21,81,89,28,82,84,30,29,87,94,127,219,193,69,63,83,28,86,92,27,81,88,21,84,72,83,20,116,24,86,28,91,21,88,2,22,81,59,65,69,87,219,206,20,91,26,71,84,18,83,66,113,68,83,21,86,18,27,96}