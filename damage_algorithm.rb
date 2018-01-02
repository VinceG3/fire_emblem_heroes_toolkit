# ⌈⌉ ⌊⌋

# att       Attack Stat of attacking unit, including weapon might and buffs / debuffs
# eff       Effective Against bonuses (1.5 if using an effective weapon, 1 if not)
# adv       Advantage multiplier (weapon triangle, weapons such as Ruby Sword, and passives such as TA)
#           Weapon Triangle Advantage: 0.2
#           Triangle Adept 1: 0.1
#           Triangle Adept 2: 0.15
#           Triangle Adept 3: 0.2
#           Extra Weapon Advantage: 0.2
#           Modifiers Add, but Gemstone weapons do not stack with TA
# spcstat   
# spcmod    
# mit       Mitigation Stat of defending unit (def / res)
# mitmod    
# classmod  Class modifier: 1 for all but staff users, 0.5 unless unit has Wrathful Staff Passive 
# offmult   
# offflat   
# defmult   
# defflat   

module DamageCalculation
  def self.⌈(float) # round away from zero
    return ceil(float) if float > 0
    return floor(float)
  end

  def self.⌊(float) # round towards zero
    return floor(float) if float > 0
    return ceil(float)
  end

  def self.calc_damage(att, eff, adv, spcstat, spcmod, mit, mitmod, offmult, offflat, defmult, defflat)
    ⌈((⌊((⌊(att*eff) + ⌊(⌊(att*eff)*adv) + ⌊(spcstat *spcmod) - (mit + ⌊(mit * mitmod))) * classmod) * (1 + offmult) + offflat) * (1 - defmult) - defflat)
  end
end