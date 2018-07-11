types_effect = {} --[Attacking , Defending]
types_effect ['normal']={}
types_effect ['normal']['normal'] = 2
types_effect ['normal']['grass'] = 2
types_effect ['normal']['fire'] = 2
types_effect ['normal']['water'] = 2

types_effect ['grass']={}
types_effect ['grass']['normal'] = 2
types_effect ['grass']['grass'] = 1
types_effect ['grass']['fire'] = 1
types_effect ['grass']['water'] = 4

types_effect ['fire']={}
types_effect ['fire']['normal'] = 2
types_effect ['fire']['grass'] = 4
types_effect ['fire']['fire'] = 1
types_effect ['fire']['water'] = 1

types_effect ['water']={}
types_effect ['water']['normal'] = 2
types_effect ['water']['grass'] = 1
types_effect ['water']['fire'] = 4
types_effect ['water']['water'] = 1
