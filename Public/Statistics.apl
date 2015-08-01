get_help← { 1↓ "
Statistics verbs:
   averages     means of the first dimension of any rank array
   mean         average for vectors
   median       middle value for a vector
   mode         most frequently occurring value in a vector
   stdDev       standard deviation"
}
 
averages← {
 ⍝ Averages of first dimension of any rank array
 (+⌿ ÷ ≢) ⍵
}
 
mean← {
 (+/ ÷ ⍴) ,⍵
}

median← {
 ⍝ Middle value
 ⍵← ⍵[⍋⍵← ,⍵]
 2| ⍴⍵ : ⍵[⌈.5× ⍴⍵]
 .5× +/ ⍵[¯1 0+ .5× ⍴⍵]
}

mode← {
 ⍝ Most frequently occurring value
 uniq← ∪⍵← ,⍵
 ⍵← +/uniq ∘.= ⍵
 ⍵← ((⌈/⍵)= ⍵) / uniq
 2≥ ⍴⍵ : ⍵ 
 ⍬
}

stdDev← {
 ⍝ Standard Deviation
 avg← mean ⍵← ,⍵
 var← mean (|⍵- avg)* 2
 (+/var)* .5
}