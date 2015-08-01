#include Html

show← {Run '1'Table ⍵}               ⍝ Display in boxes

s44 ← 4 4⍴ 0 0 0 0  0 0 2 1  3 0 0 4  0 0 0 0      ⍝ 4×4 Sudoku puzzle

box← {⍵⌿⍵/⍵ ⍵⍴⍳⍵×⍵}                  ⍝ verb: box numbers

rcb← {(⍳⍵),¨box ↑⍵*÷2}               ⍝ verb: row-col-box numbers

cmap← {⊂⍭{⍳2} 1∊¨ ⍵∘.=⍵}             ⍝ verb: contention map for ⍵-puzzle

avl← {(1+ ⍳↑⍴⍵)~ ⍵× ↑⍺⌷cmap rcb ⍴⍵}  ⍝ verb: available plays at ⍺ for state ⍵

at← {⍵+ (⍴⍵)↑ (-1+ ⍶'')↑ ⍺}          ⍝ adverb: ⍺ at ⍶ in ⍵

nxt← {                               ⍝ verb: next states of ⍵ at ⍺
 ⎕←∆← ⍺
 (⍺ avl ⍵){∆} at¨ ⊂⍵
}

nxtv← {↑,/⍺∘nxt¨ ⍵}                  ⍝ verb: next state vector  

shape← {
 ⎕← 'rho ', ⍴⍵ 
 ⎕← 'depth ', ≡⍵ 
 ⎕← 'depths ', ≡¨⍵ 
 ⍵
}

⍝ shape 1 0 nxtv 0 1 nxtv 0 0 nxtv ,⊂s44

"      ⊃nxtv/ (4 2)(1 3)(2 1)(1 2)(1 1)(,⊂s44)           ⍝ 5-level search
┌───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┐
│1 2 3 0│1 2 3 0│1 2 4 0│1 2 4 0│1 3 4 0│1 3 4 0│1 3 4 0│2 1 3 0│2 1 3 0│2 1 4 0│2 1 4 0│2 3 4 0│2 3 4 0│2 3 4 0│
│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│4 0 2 1│
│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│3 0 0 4│
│0 1 0 0│0 4 0 0│0 1 0 0│0 4 0 0│0 1 0 0│0 2 0 0│0 4 0 0│0 2 0 0│0 4 0 0│0 2 0 0│0 4 0 0│0 1 0 0│0 2 0 0│0 4 0 0│
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┘"

emt← {(,⍵=0)/,⍳⍴⍵}                 ⍝ verb: empty cell positions in state ⍵

svec← {⊃nxtv/(emt ⍵),⊂,⊂⍵}         ⍝ verb: solution vector

fmt← {⊂[3 4]1 3 2 4⍉(2/(⍴⍵)*÷2)⍴⍵}   ⍝ pleasing format