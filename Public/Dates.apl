get_help← { 1↓ "
Dates verbs:
   day          year month day; return weekday
   days         year; return 1st day of each month
   month        year month; return a calendar for that month
   year         year; return a calendar"
}
 
Day← {
 ⍝ ⍵ is (year, month, day) return day of the week
 now←12⊥ 2↑ ⍵
 now≤ 12⊥ 1752 9 : ↗'Before adoption of Gregorian calendar'
 ∆← ⌈1.75× ⌊(⍵← (0 1 + 0 12 ⊤¯3+now), ⍵[2])[0]÷ 100
 7| ⍵[2]+ now+ (⌊¯0.2+ 2.6× ⍵[1])+ (⌊(now←100| ⍵[0]) ÷4)- ∆
}

day← {
 ⍝ ⍵ is (year, month, day) return weekday
 (⊃('Sun' 'Mon' 'Tues' 'Wednes' 'Thurs' 'Fri' 'Satur')[Day ⍵]), 'day'
}

days← {
 ⍝ ⍵ is (year) return 1st day of each month
 3 4⍴ day ¨ (⊂⍵ 0 1)+(⊂0 1 0)×1+⍳12
}

month← {
 ⍝ ⍵ is (year, month) return a calendar for that month
 ⍵← (⍵- 0 1), Day ⍵, 1
 ∆← (31 28 31 30 31 30 31 31 30 31 30 31)[⍵[1]]
 ∆← 1+ ⍳∆+ (⍵[1]= 1)∧ 0= 4| ⍵[0]
 ∆← 42↑ (⍵[2]⍴ 0), ∆
 ∆[(∆=0)/⍳⍴∆]← ' '
 ⍵←(12 3⍴ 'JanFebMarAprMayJunJulAugSepOctNovDec')[⍵[1];]
 ∆←(20↑ ¯12↑⍵)⍪ ⍕6 7⍴∆
}

year← {
 ⍝ ⍵ is (year) return a calendar
 3 4⍴ month¨ ⍵,¨ 1+ ⍳12
}