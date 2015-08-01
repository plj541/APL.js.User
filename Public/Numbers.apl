get_help← { 1↓ "
Numbers verbs:
   toEnglish    converts an integer to words 
   fromRoman    converts a positive integer to Roman Numerals
   toRoman      converts from Roman Numerals to a number"
}

Digits← {
 ⍝ Expand three digits for toEnglish
 Number← 28 9⍴ '_________one______two______three____four_____five_____six______seven____eight____nine_____ten______eleven___twelve___thirteen_fourteen_fifteen__sixteen__seventeeneighteen_ninteen__twenty__-thirty__-forty___-fifty___-sixty___-seventy_-eighty__-ninety__-'
 ∆← ''
 ({⍵← 0 100⊤ ⍵
   ({∆← Number[⍵[0];], ' hundred '
    } ⍣ (⍵[0]≠ 0)) ⍵
   ⍵← ⍵[1]
   ({∆← ∆, ,(Number[18 0+ 10 10⊤ ⍵;])[;(⍳8), (0≠ 10⊤ ⍵)⍴ 8]
    } ⍣ (⍵> 19)) ⍵
   ({∆← ∆, Number[⍵;]
    } ⍣ (⍵< 20)) ⍵
  } ⍣ (⍵≠ 0)) ⍵
 ∆~ '_'
}

toEnglish← {
 ⍝ Convert a number into English
 Number← 5 9⍴ 'trillion_billion__million__thousand__________'
 ∆←  ({∆← 'zero'} ⍣ (⍵= 0)) ⍵←''⍴ ⍵
 ({∆← (⍵< 0)/ 'negative '
   ⍵← (5⍴ 1000)⊤ |⍵
   now← (⍵≠ 0)⍳ 1
   {∆← ∆, (Digits ⍵) {⍺, (0≠ ⍴⍺)/ ⍵} ' ', Number[now;], ' '
    now← now+ 1
   } ¨ now↓ ⍵
  } ⍣ (⍵≠ 0)) ⍵
 ∆~ '_'
}

fromRoman← {
 ⍝ Convert from Roman numerals
 ∆← ((14⍴1 5 10 50 100 500 1000), 5000 10000 50000 100000 500000 1000000)['ivxlcdmIVXLCDMⓋⓍⓁⒸⒹⓂ'⍳ ,⍵]  ⍝ NB. ()'s currently required
 ∆←∆ +.× ¯1+ 2× ∆≥ 1↓∆, 0
}

toRoman← {
 ⍝ Convert a number to Roman numerals
 (⍵< 0)∨ ⍵> 3999 : 'domain error'
 ∆← 4 1 3 2 2 3 1 1 1 2 1 3 1 1 2 1 2 1 1 4 1 2
 ∆←∆/ 2 0 2 0 2 0 2 0 ¯1 2 ¯1 2 ¯1 0 2 ¯1 0 2 ¯1 0 ¯2 2
 ∆←,(10 4 ⍴∆)[(4⍴10)⊤⍵;]
 'MDCLXVI'[(∆≠2)/∆+2×⌊0.25×⍳16] ⍝ ⓂⒹⒸⓁⓍⓋ
}