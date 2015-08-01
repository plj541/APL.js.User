get_help← { 1↓ "
Probability verbs from ""Probability in APL"" by Linda Alvord:
   po           Possible Outcomes, page 34
   cm           Correction Matrix, page 40
   poc          Possible OutCome, page 40
   cmalt        Alternate Correction Matrix, page 46
   ac           All Combinations, page 50
   nubs         Nub Select, page 58
   nub          Nub, page 58
   onub         Ordered Nub, page 60
   ft           Frequency Table, page 60
   pt           Pascal Triangle, page 66
   hist         Histogram, page 69
   ftn          Frequency Table Not ordered, page 72
   bp           Binomial Probabilities, page 75
   cr           Combinations as Rows, page 75
   comb         Combinations, page 76
   perm         Permutations, page 85
   nperm        Number of Permutations, page 85
   uo           Unique Orderings, page 88
   permalt      Alternate Permutations, page 92
   gp           Geometric Probabilities, page 96
   ta0          Tables origin 0, page 97
   ta1          Tables origin 1, page 97
   bd           Bionomial Distribution of Probabilities, page 97
   gd           Geometric Distribution of Probabilities, page 97
   dbd          Dependent Bionomial Distribution, page 104
   dgd          Dependent Geometric Distribution, page 118
   md           Matching Distribution, page 124
   mp           Match Proceedure, page 125
   match        Matching birthdays, page 125"
}

po← {⍵⊤ ⍳×/⍵}

cm← {⍉(⌽⍴po ⍵)⍴ ¯1↓ +\0, ⍵}

poc← {⍺[(po ⍵)+ cm ⍵]}

cmalt← {(¯1↓ +\0, ⍵)∘.+ (×/⍵)⍴ 0}

ac← {(((2× ⍴⍵)⍴ 0 1)\ ⍵)poc (⍴⍵)⍴ 2}

nubs←{⍵← ,⍵
 (⍵⍳ ⍵)= ⍳⍴⍵}

nub←{(nubs ⍵)/ ,⍵}

onub←{myNub←nub ⍵
 myNub[⍋myNub]}

ft←{myOnub←onub ⍵
 myOnub,[.5] +/myOnub∘.= ,⍵}

pt←{myTemp← ⍳1+ ,⍵
 myTemp∘.!myTemp}

hist←{myTemp←(⍳1+⍵)!⍵
 " █"[myTemp∘.> ⍳⌈/ myTemp]}

ftn←{myNub←nub ⍵
 myNub,[.5]+/myNub∘.= ,⍵}

bp←{myTemp←⍳1+⍺
 (myTemp!⍺)×(⍵*myTemp)×(1-⍵)*⌽myTemp}

cr←{myTemp←po ⍵⍴2
 ⍉(⍺= +⌿myTemp)/ myTemp}

comb←{myTemp← ⍺ cr ⍵
 ⍉((⍺!⍵), ⍺)⍴ (,myTemp)/ ,(⍴myTemp)⍴ ⍳⍵}

perm←{myTemp← po ⍺⍴⍵
 (⍺= +/∨⌿myTemp∘.=⍳⍵)/ myTemp}

nperm←{(⍺! ⍵)× !⍺}

uo←{⍵+ ⍺≤ ⍵}

permalt←{uo⍀po ⍺↑ ⌽1+ ⍳⍵}

gp←{⍺× (1- ⍺)* ⍳⍵}

ta0←{0 0 0 4⍕ (⍳⍴⍵),[.5]⍵}

ta1←{0 0 0 4⍕ (1+⍳⍴⍵),[.5]⍵}

bd←{ta0 ⍺ bp ⍵}

gd←{ta1 ⍺ gp ⍵}

dbd←{myTemp← ⍳1+ ⍵
 ta0(myTemp! 1↑ ⍺)× ((⌽myTemp)! |-/ ⍺)÷ ⍵! 1↓ ⍺}

dgd←{ta1((¯1+ 1↑ ⍺)! ⍵↑ ⌽⍳1↓ ⍺)÷ !/⍺}

md←{ta1 1- ×\1- (⍳⍺)÷ ⍵}

mp←{1+ +/∧\nubs ⎕← ⍵}

match←{mp ? ⍺⍴ ⍵}