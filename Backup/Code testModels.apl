get_help← { 1↓ "
testModels:
   Matrix       Debugged Roger Hui's APL, released in prelude
   Take         modeled with scalar right arguments, released in Javascript
   Transpose    modeled left argument, released in Javascript
   Disclose     wrote extention to support any rank, released in prelude

   Enclose      supports left argument, only in my prelude
   Grade        supports full left argument, only in my prelude
   Thorn        supports left argument, only in my prelude
   Axis         ⍭ applies variant of ↑, ↓, ⊂, only in my prelude
   Pivot        support full left argument, Axis via ⍭, only in my prelude
   Test         all of the above"
}

get_Test← {
 ⍝ To test APL Models:  
 X←{⎕← '' ⋄ ⎕← ''⍎ ⎕← '   ', ⍵}
 X "Matrix      ⍝ Debugged Roger Hui's APL, released in prelude"             
 X 'Take        ⍝ modeled with scalar right arguments, released in Javascript' 
 X 'Transpose   ⍝ modeled left argument, released in Javascript'               
 X 'Disclose    ⍝ wrote extention to support any rank, released in prelude'    
 X 'Enclose     ⍝ supports left argument, only in my prelude'                  
 X 'Grade       ⍝ supports full left argument, only in my prelude'             
 X 'Thorn       ⍝ supports left argument, only in my prelude'                  
 X 'Axis        ⍝ ⍭ applies variant of ↑, ↓, ⊂, only in my prelude'        
 X 'Pivot       ⍝ support full left argument, Axis via ⍭, only in my prelude'
 ''
}

get_Matrix← {
 ⍝ Matrix Divide
 y← 4 4⍴ ( 
   12  1 4 10
   ¯6 ¯5 4  7
   ¯4  9 3  4
   ¯2 ¯6 7  7)
 x← 93 81 93.5 120.5
 0 2⍕ x ⌹ y
}

get_Take← {
 ⎕← 'Simple' (3 3 ↑ 2) (3 3 ↑ 2 2⍴⍳4)
 ⎕← 'Nested' (3 3 ↑ ⊂2 3) (3 3 ↑ ⍳2 2)
 'Done'
}

get_Transpose← {
 ⍝ Transpose simple
 d← 2 3 4⍴⍳24
 a← 0 2 1 ⍉ b← 0 2 1 ⍉ d 
 ⎕← 'Simple' ((⍉d)≡ 2 1 0 ⍉ d) (a≡ d)
 ⍝ Transpose nested
 d← ⍳2 3 4
 a← 0 2 1 ⍉ b← 0 2 1 ⍉ d 
 ⎕← 'Nested' ((⍉b)≡ 2 1 0 ⍉ b) (a≡ d)
 'Done'
}

⍮← {⍺ ⍵}

get_Disclose← {
 ⍝ Disclose simple
 ⎕← 'Simple' ⍮ ⊃ 2 3⍴(2 3⍴⍳6) 6 (7+3 3⍴⍳9) (16 17) (25+ 2 1⍴⍳2) 
 ⍝ Disclose nested
 ⎕← 'Nested' ⍮ ⊃ 2 3⍴(⍳2 3) 6 (7+⍳3 3) (16 17) (25+ ⍳2 1) 
 'Done'
}

get_Enclose← {
 ⍝ Dyadic Enclose
 Split← {
  ⍝ Split ⍺ into strings at each ⍵
  (⍺≠ ⍵) ⊂ ⍺
 }
 Join← {
  ⍝ Join ⍺ strings into one with ⍵ between each
  ¯1↓ ∊⍺,¨ ⍵
 }
 ⎕← test← 'this is a quick test'
 expected← 'this' 'is' (,'a') 'quick' 'test'
 (⎕← now← test Split ' ')≢ expected : ↗'Split failed'
 test ≢ now Join ' ' : ↗'Join failed'

 ⎕← testBlanks← '   this  is   a quick  test     '
 (⎕← now← testBlanks Split ' ')≢ expected : ↗'Split failed'
 test ≢ now Join ' ' : ↗'Join failed'
 'Done'
}

get_Grade← {
 sort← 10 26↑⎕UCS 97 65∘.+⍳26
 sort← (10↑⎕UCS 32 160),"0123456789",sort,10↑"-,;:.!?"

 a← 'paul lee jackson' 
 names← 'L23' 'L3' 'L11' 'L10' 'L12' 'L13' 'L2' 'L22' 'L1' 'L21' 'L100'
 words← 'fun' 'Dr' 'funny' 'dr' 'drive' 'Drive' 'DR'

 4 8 1 10 11 6 7 9 12 3 5 15 14 0 13 2≢ ⎕← ⍋ a : ↗'⍋ a'
 2 13 0 14 15 3 5 12 9 6 7 11 1 10 4 8≢ ⎕← ⍒ a : ↗'⍒ a'

 8 6 1 3 2 4 5 9 7 0 10 ≢ ⎕← sort ⍋ names : ↗'⍋ names'
 10 0 7 9 5 4 2 3 1 6 8 ≢ ⎕← sort ⍒ names : ↗'⍒ names'

 3 1 6 4 5 0 2 ≢ ⎕← sort ⍋ words : ↗'⍋ words'
 2 0 5 4 6 1 3 ≢ ⎕← sort ⍒ words : ↗'⍒ words'
 'Done'
}

get_Thorn← {
 x← 2 3⍴⍳6 ⋄ x[0;0]←3.1 ⋄ x[0;1]←42 ⋄ x[1;2]←123.45
 ⎕← 7 2 5 0 7 1⍕'Barbara' 'Paul' 'Robert'⍪x
 a← 7 2 8 3 9 4 ⍕ ¯12+2 2 2 3⍴ ⍳24
 b←0 0 8 3⍕ (⍳11), ⍪.001× ?11⍴ 999999
 c← 0 10 0 ¯5⍕c,c←⍪(21⍴¯1 1)× 7× 10* ¯10+ ⍳21
 a b c
}

get_Axis← {
 X←{⎕← ''⍎ ⎕← '   ', ⍵}
 X '2↑ x←3 4⍴ ⍳12'
 X '2↑⍭{¯1} x'

 X '1↓ x'
 X '1↓⍭{¯1} x'

 X 'y← 1 1 0 1 1 ⊂ x← 4 5⍴⍳20'
 X 'y≡ 1 1 0 1 1 ⊂⍭{1} x'
 X '1 1 0 1 ⊂⍭{0}x'
 'Done'
}

get_Pivot← {
 ⍝ Pivot simple
 b← 2 3 4⍴⍳24
 ⎕← 'Simple' (b≡ 0 ⌽ b) (b≡ 0⌽⍭{0} b) (b≡ 0 ⌽⍭{1} b) (b≡ 0 ⌽⍭{2} b)
 ⎕← (1 ⌽⍭{0} b) (1 ⌽⍭{1} b) (1 ⌽⍭{2} b)
 ⍝ Pivot nested
 b← ⍳3 3 3
 ⎕← 'Nested' (b≡ 0 ⌽ b) (b≡ 0 ⌽⍭{0} b) (b≡ 0 ⌽⍭{1} b) (b≡ 0 ⌽⍭{2} b)
 ⎕← (1 ⌽⍭{0} b) 0 (1 ⌽⍭{1} b) 1 (1 ⌽⍭{2} b) 2

 b← 2 3 4⍴⍳24
 b0←(⍴b)⍴ (
12  1 14 15
 4 17 18  7
20 21 10 23

 0 13  2  3
16  5  6 19
 8  9 22 11)

 b1← (⍴b)⍴ (
 4  9  2  7
 8  1  6 11
 0  5 10  3

20 13 18 23
12 17 22 15
16 21 14 19)

 b2← (⍴b)⍴ (
 1  2  3  0
 6  7  4  5
11  8  9 10

13 14 15 12
18 19 16 17
23 20 21 22)

 ⎕← 'Full' ⍮ 4 2⍴(
  b0≡ (3 4⍴1 2 3) ⌽⍭{0} b) 0 (
  b1≡ (2 4⍴1 2 3) ⌽⍭{1} b) 1 (
  b2≡ (2 3⍴1 2 3) ⌽⍭{2} b) 2 (
  b2≡ (2 3⍴1 2 3) ⌽⍭{¯1} b) ¯1

 'Done'
}