_moves = {}
_moves[MOVE_HIT] = Move("hit")
_moves[MOVE_HIT].power = 40
_moves[MOVE_HIT].nature = MOVE_TYPE_HIT
_moves[MOVE_HIT].special = 0
_moves[MOVE_HIT].pp = 10
_moves[MOVE_HIT].priority = 0
_moves[MOVE_HIT].type = TYPE_NORMAL
_moves[MOVE_HIT].accuracy = 100


_moves[MOVE_HITS] = Move("hits")
_moves[MOVE_HITS].power = 11
_moves[MOVE_HITS].nature = MOVE_TYPE_HITS
_moves[MOVE_HITS].special = 0
_moves[MOVE_HITS].pp = 20
_moves[MOVE_HITS].priority = 0
_moves[MOVE_HITS].type = TYPE_NORMAL
_moves[MOVE_HITS].accuracy = 100
_moves[MOVE_HITS].minhits = 2
_moves[MOVE_HITS].maxhits = 5


_moves[MOVE_DONT_HIT] = Move("don't hit")
_moves[MOVE_DONT_HIT].power = 0
_moves[MOVE_DONT_HIT].nature = MOVE_TYPE_PROTECT
_moves[MOVE_DONT_HIT].special = -1
_moves[MOVE_DONT_HIT].pp = 15
_moves[MOVE_DONT_HIT].priority = 2
_moves[MOVE_DONT_HIT].type = TYPE_NORMAL
_moves[MOVE_DONT_HIT].accuracy = 90


_moves[MOVE_FASTEN] = Move("fasten")
_moves[MOVE_FASTEN].power = "-"
_moves[MOVE_FASTEN].nature = MOVE_TYPE_STATS
_moves[MOVE_FASTEN].special = -1
_moves[MOVE_FASTEN].pp = 20
_moves[MOVE_FASTEN].priority = 0
_moves[MOVE_FASTEN].type = TYPE_NORMAL
_moves[MOVE_FASTEN].accuracy = 90
_moves[MOVE_FASTEN].stat = STAT_SPEED
_moves[MOVE_FASTEN].who = 1
_moves[MOVE_FASTEN].stage = 2


_moves[MOVE_THROW_CHAIRS] = Move("throw chairs")
_moves[MOVE_THROW_CHAIRS].power = 18
_moves[MOVE_THROW_CHAIRS].nature = MOVE_TYPE_HITS
_moves[MOVE_THROW_CHAIRS].special = 1
_moves[MOVE_THROW_CHAIRS].pp = 20
_moves[MOVE_THROW_CHAIRS].priority = 0
_moves[MOVE_THROW_CHAIRS].type = TYPE_NORMAL
_moves[MOVE_THROW_CHAIRS].accuracy = 100
_moves[MOVE_THROW_CHAIRS].minhits = 1
_moves[MOVE_THROW_CHAIRS].maxhits = 4


_moves[MOVE_SNOOZE] = Move("snooze")
_moves[MOVE_SNOOZE].power = "-"
_moves[MOVE_SNOOZE].nature = MOVE_TYPE_STATUS
_moves[MOVE_SNOOZE].special = -1
_moves[MOVE_SNOOZE].pp = 10
_moves[MOVE_SNOOZE].priority = 0
_moves[MOVE_SNOOZE].type = TYPE_NORMAL
_moves[MOVE_SNOOZE].accuracy = 90
_moves[MOVE_SNOOZE].status = STATUS_SLP
_moves[MOVE_SNOOZE].probability = 80


_moves[MOVE_BE_STILL] = Move("be still")
_moves[MOVE_BE_STILL].power = "-"
_moves[MOVE_BE_STILL].nature = MOVE_TYPE_STATUS
_moves[MOVE_BE_STILL].special = -1
_moves[MOVE_BE_STILL].pp = 10
_moves[MOVE_BE_STILL].priority = 0
_moves[MOVE_BE_STILL].type = TYPE_NORMAL
_moves[MOVE_BE_STILL].accuracy = 80
_moves[MOVE_BE_STILL].status = STATUS_PAR
_moves[MOVE_BE_STILL].probability = 60

_moves[MOVE_OBFUSCATE] = Move("obfuscate")
_moves[MOVE_OBFUSCATE].power = 50
_moves[MOVE_OBFUSCATE].nature = MOVE_TYPE_HIT
_moves[MOVE_OBFUSCATE].special = 1
_moves[MOVE_OBFUSCATE].pp = 20
_moves[MOVE_OBFUSCATE].priority = 0
_moves[MOVE_OBFUSCATE].type = TYPE_PSYCHIC
_moves[MOVE_OBFUSCATE].accuracy = 100
_moves[MOVE_OBFUSCATE].secondaryEffect = MOVE_TYPE_VOL_STATUS
_moves[MOVE_OBFUSCATE].status = VOL_STATUS_CONFUSE
_moves[MOVE_OBFUSCATE].probability = 40
