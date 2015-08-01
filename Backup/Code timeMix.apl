get_help← {
 '  Time 10 10  ⍝ times ⊃ with the argument'
}

Time← {
 myArg← ⍵⍴ (2 3⍴⍳6) 6 (7+3 3⍴⍳9) (16 17) (25+ 2 1⍴⍳2) (⍳2 3) 6 (7+⍳3 3) (16 17) (25+ ⍳2 1) 
 myBef← «+new Date»
 myRes← ⊃myArg
 myAft← «+new Date»
 myAft- myBef
}