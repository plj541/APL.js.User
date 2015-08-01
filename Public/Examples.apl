get_help← { 1↓ "
Examples nouns and verbs.  Most are from,   http://ngn.github.io/apl/web/
Several of the following nouns call a similar named verb. 
   Ackermann    returns a 4 by 5 table
   Life         shows the first five generations of a Glider
   Primes       provides the primes below 100
   Rule30       see https://en.wikipedia.org/wiki/Rule_30
   Queens       solves the n-queens problem
   Sierpinski   returns a rank 5 triangle
   QuoteQuad    demonstrates simple user prompting"
}

ackermann← {
 ⍝ a classic recursive function
 here← ∆← 1
 ⍺ ({here← 0 {⍺} ∆← ⍵+ 1} ⍣ (0= ⍺)) ⍵
 ⍺ ({here← 0 {⍺} ∆← (⍺- 1) ackermann 1} ⍣ (here∧ 0= ⍵)) ⍵
 ⍺ ({∆← (⍺- 1) ackermann ⍺ ackermann ⍵- 1} ⍣ here) ⍵
 ∆
}

get_Ackermann← {
 (⍳4) ∘. ackermann ⍳5
}

life← {
 ⍝ Place the creature on a larger board, near the center
 board← ¯2⊖ ¯2⌽ (4+ ⍴⍺)↑ ⍺
 ⍝ Move from one generation to the next
 nextGen← {⊃1 ⍵ ∨.∧ 3 4 = +/ +⌿ 1 0 ¯1 ∘.⊖ 1 0 ¯1 ⌽¨ ⊂⍵}
 ⍝ Format the n-th generation as a character matrix
 {' #'[(nextGen⍣ ⍵) board]}¨ ⍵
}

get_Life← {
 ⍝ Conway's Game of Life.  This was inspired by:   http://www.youtube.com/watch?v=a9xAKttWgP4
 creature← 3 3⍴ (
   0 1 1
   1 1 0
   0 1 0 )  ⍝ Original creature from demo
 creature← 3 3⍴ (
   0 1 0
   1 0 0
   1 1 1 )  ⍝ Glider
 ⍝ Show first five generations
 creature life ⍳5
}

get_Primes← {
 ⍝ Look for Primes
 (1= +⌿ 0= ∘.∣⍨ ints)/ ints← 2↓ ⍳100
}

get_Rule30← {
 ⍝ See https://en.wikipedia.org/wiki/Rule_30
 rule← 30
 ruleSet← ⌽(8/ 2)⊤ rule
 n← 39 ⍝ number of rows to compute
 row← (3⍴ n, 1)/ 0 1 0
 table← (0, ⍴row)⍴ 0
 {
  table← table⍪ row
  row← ruleSet[(1⌽ row)+ (2× row)+ 4× ¯1⌽ row]
 }¨ ⍳n
 ' #'[table]
}

queens←{                     ⍝ The N-queens problem
              ⍝ Adapted from:  http://dfns.dyalog.com/c_queens.htm
 search← {                   ⍝ Search for all solutions.
  (⊂⍬)∊⍵:0⍴⊂⍬                ⍝ stitched: abandon this branch.
  0=⍴⍵:rmdups ⍺              ⍝ all done: solution!
  (hd tl)←(↑⍵)(1↓⍵)          ⍝ head 'n tail of remaining ranks.
  next←⍺∘,¨hd                ⍝ possible next steps.
  rems←hd free¨⊂tl           ⍝ unchecked squares.
  ⊃,/next ∇¨rems             ⍝ ... in following ranks.
 }

 cvex← (1+⍳⍵)×⊂¯1 0 1        ⍝ Checking vectors.

 free← {⍵~¨⍺+(⍴⍵)↑cvex}      ⍝ Unchecked squares.

 rmdups← {                   ⍝ Ignore duplicate solution.
  rots←{{⍒⍵}\4/⊂⍵}           ⍝ 4 rotations.
  refs←{{⍋⍵}\2/⊂⍵}           ⍝ 2 reflections.
  best←{(↑⍋⊃⍵)⊃⍵}            ⍝ best (=lowest) solution.
  all8←,⊃refs¨rots ⍵         ⍝ all 8 orientations.
  (⍵≡best all8)⊃⍬(,⊂⍵)       ⍝ ignore if not best.
 }

 fmt← {                      ⍝ Format solution.
  chars←'·⍟'[(⊃⍵)∘.=⍳⍺]      ⍝ char array of placed queens.
  expd←1↓,⊃⍺⍴⊂0 1            ⍝ expansion mask.
  ⊃¨⊂⍭{1 2}expd\chars        ⍝ vector of char matrices.
 }

 squares←(⊂⍳⌈⍵÷2),1↓⍵⍴⊂⍳⍵    ⍝ initial squares
 ⍵ fmt ⍬ search squares      ⍝ all distinct solutions.
}

get_Queens← {
 queens 5
}

sierpinski← {
 ⍝ Sierpinski's triangle is a recursively defined figure.
 f ← {(⍵, (⍴⍵)⍴ 0)⍪ ⍵, ⍵}
 ' #'[(f⍣ ⍵) 1 1⍴ 1]
}

get_Sierpinski← {
 ⍝  Rank 0 is a one-by-one non-blank matrix.
 ⍝  If S is the triangle of rank n, then rank n+ 1 would be:
 ⍝     S 0
 ⍝     S S
 ⍝  Where "0" is an all-blank matrix same size as S.
 sierpinski 5
}

get_QuoteQuad← {
 ⎕← 'Any output other than ⍞ removes any previously set prompt'
 ans←  ⎕
 ⍞← 'My own prompt [', ans, ']:'
 ans← ⎕
 ⍞← 'Another prompt:' , (⎕UCS 10), 'initial [', ans, ']'
 ans← ⎕ 
}