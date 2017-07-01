def allianceVersusMonster(hp, dmg)
  monster = [hp.shift, dmg.shift]
  aliance = create_army(hp, dmg)
  monster, injured_aliance = fight!(monster, aliance)
  return aliance.size if injured_aliance.nil?
  to_the_death!(monster, injured_aliance)
end

def create_army(hp, dmg)
  hp = (0...hp.size).map do |idx|
    hp[idx],dmg[idx]]
  end
  hp.sort_by{|ar| ar[1]}
end

def fight!(monster, aliance)
  aliance = (0...aliance.size).map do |idx|
    warrior, monster = solo_boss(monster, aliance[idx])
    break if monster.nil?
    warrior
  end
  [monster, aliance]
end

def solo_boss(monster, warrior)
  warrior_turns = monster[0] / warrior[1]
  warrior_turns += 1 unless (monster[0] % warrior[1]).zero?
  monster_turns = warrior[0] / monster[1]
  monster_turns += 1 unless (warrior[0] % monster[1]).zero?
  return [warrior] if monster_turns >= warrior_turns
  turns = monster_turns - 1
  monster[0] = monster[0] - turns * warrior[1]
  warrior[0] = warrior[0] - turns * monster[1]
  [warrior, monster]
end

def to_the_death!(monster, aliance)
  aliance = (0...aliance.size).map do |idx|
    dmg = aliance[idx][1]
    monster[0] -= dmg
    return aliance.size - idx if monster[0] < 1
  end
  0
end
