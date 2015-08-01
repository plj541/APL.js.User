get_help← {
 '  Time 10 10  ⍝ times ⌹ with the argument'
}

Time← {
 myBef← «+new Date»
 myRes← ⌹ ?⍵⍴ 1000
 myAft← «+new Date»
 myAft- myBef
}