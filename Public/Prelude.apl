⍘← { ⍝ Remember variant, and apply simple
 ⍶ ⍵ 
;
 ⍺≢ ∅ : ⍺ ⍶ ⍵
 2= ⍴⍵ : ⍹ ⍵
 ⍬ ⍹ ⍵
}
⍭← { ⍝ Apply variant defined by ⍘ 
 ∅ ⍶ (⍹ ⍬) ⍵
;
 ∅ ⍶ (⍹ ⍬) ⍵ ⍺
}

⎕enclose← ⊂
⊂← {⎕enclose ⍵ ; ⍺ ⊂⍭{¯1} ⍵}
⊂← ⊂ ⍘ {
 (∆ ⍵)← ⍵
 ⎕enclose[(≢⍴⍵)| ∆]⍵
;
 (Axis ⍵ ⍺)← ⍵ 
 1< ≢⍴⍺ : ↗'RANK ERROR' ⋄ Axis← (≢⍴⍵)| Axis
 ⍺← 0≠ ⍺ {0= ⍴⍴⍺ : ⍵⍴ ⍺ ⋄ ⍺} last← (⍴⍵)[Axis]
 ∆← ⍴⍵ ⋄ ∆[Axis]← 0 ⋄ ∆← ∆⍴ ⍬
 drop← ⍺⍳ 1
 ⍺ {drop= last : ''
  take← drop+ (drop↓ ⍺)⍳ 0
  ∆← ∆,[Axis] ⎕enclose[Axis]drop↓⍭{Axis} take↑⍭{Axis} ⍵ 
  drop← take + (take↓⍺)⍳ 1
  ⍺ ∇ ⍵} ⍵
 ∆
}

⊃← {
 2> ≡⍵ : ⍵
 maxRank← ⍴maxShape← ⍴↑⍵
 {myRank← ⍴myShape← ⍴⍵
  myRank≤ maxRank : maxShape← maxShape⌈ (-maxRank)↑ (maxRank⍴ 1), myShape
  maxRank← myRank ⋄ maxShape← myShape⌈ (-myRank)↑ (myRank⍴ 1), maxShape
 }¨ ⍵
 myShape← maxRank⍴ 1 ⋄ myRank← -maxRank
 ((⍴⍵), maxShape)⍴ ↑⍪/ {maxShape↑ (myRank↑ myShape, ⍴⍵)⍴ ⍵}¨ ,⍵
;
 1<⍴⍴⍺ : ↗'RANK ERROR'
 x← ⍵
 {
  1< ⍴⍴⍵ : ↗'RANK ERROR'
  ⍵← ,⍵
  (⍴⍵)≠ ⍴⍴x : ↗'RANK ERROR'
  ∨/ ⍵≥ ⍴x : ↗'INDEX ERROR'
  x← ⊃⍵⌷ x
 }¨⍺
 x
}

⍋← ⍋ ⍠ {
 0= ⍴⍴⍺ : ↗'RANK ERROR'
 1= ⍴⍴⍺ : ⍋ ⍺⍳ ⊃⍵
 ⍋1 0 2⍉ ⊖(⍴⍺)⊤ (,⍺)⍳ ⍪⊃⍵
}
⍒← ⍒ ⍠ {
 0= ⍴⍴⍺ : ↗'RANK ERROR'
 1= ⍴⍴⍺ : ⍒⍺⍳ ⊃⍵
 ⍒1 0 2⍉ ⊖(⍴⍺)⊤ (,⍺)⍳ ⍪⊃⍵
}

⍕← ⍕ ⍠ {
 1< ⍴⍴⍺ : ↗'RANK ERROR'
 ⍺← ⍺ {
  1= ≢⍺ : ¯2↑ ⍺
  2= ≢⍺ : ⍺
  (⍴⍺)= 2× ¯1↑ ⍴⍵ : ⍺
  ↗'LENGTH ERROR'
 } ⍵
 ∆← ×/shape← ⍴⍵
 0= ∆ : ⍕ ⍵
 1= ∆ : ⍕ ⍺ {({«ThornArg(_w)»} ⍺) {«Thorn(_w, _a)»} ⍵} ⍵
 ⍺← ⊂⍭{1}(2,⍨ ¯1↑ shape)⍴ ⍺
 ∆← (×/¯1↓ shape), ¯1↑ shape
 ⍵← ⊂⍭{0} ∆⍴ ⍵
 ∆← (1 0× ∆)⍴ ''
 ⍺ {
  myArg← ⊂{«ThornArg(_w)»} ⍺
  ⍵← ,myArg {,«Thorn(_w, _a)»}¨ ⍵
  0≠ 1↑ ⍺ : ∆← ∆, ⊃⍵
  0> 1↓ ⍺ : ∆← ∆, ⊃⍵
  ∆← ∆, ⊃(-⌈/ ≢¨⍵)↑¨ ⍵
 }¨ ⍵
 2≥ ≢shape : ∆
 ('1'= ,⍕((¯1↓ shape), 1)⍴ 1)⍀ ∆
}

↑← ↑ ⍘ {
 ↗'NONCE ERROR'
;
 (Axis ⍵ ⍺)← ⍵ 
 alpha← ⍴⍵
 alpha[(≢⍴⍵)| Axis]← ⍺
 alpha↑ ⍵
}
↓← ↓ ⍘ {
 ↗'NONCE ERROR'
;
 (Axis ⍵ ⍺)← ⍵ 
 alpha← 0× ⍴⍵
 alpha[(≢⍴⍵)| Axis]← ⍺
 alpha↓ ⍵
}

⌽← ⌽ ⍘ {
 (Axis ⍵)← ⍵
 ⌽[(≢⍴⍵)| Axis]⍵
;
 (Axis ⍵ ⍺)← ⍵ ⋄ Axis← (≢⍴⍵)| Axis
 (⍴⍴⍺)∧.≠ 0,¯1+⍴⍴⍵ : ↗'RANK ERROR' ⋄ ' '∊2↑1⍴⍺ : ↗'DOMAIN ERROR'
 ~Axis∊ Index← ⍳⍴⍴⍵ : ↗'DOMAIN ERROR' ⋄ Nest← 2≤ ≡⍵ ⋄ Data← ,⍵
 ⍵←{Nest : (⍴⍵)⍴ ⍳×/⍴⍵ ⋄ ⍵} ⍵
 Order← (Axis↑ Index), ((1+ Axis)↓ Index), Axis
 ⍵← (⍴⍵)[Order]⍴ ∊⍺ ⌽¨ ⊂⍭{Axis}⍵
 ⍵← {Axis≠ ¯1+ ⍴Index : Order ⍉ ⍵ ⋄ ⍵} ⍵
 Nest : Data[⍵]
 ⍵
}

⎕file← {
 ⍝ Return a value from local storage (each browser provides its own store)
 «storeGet("File " + _w.toSimpleString().trim())» 
;
 ⍝ Place a value into local storage
 «storePut("File " + _w.toSimpleString().trim(), _a.toString())» 
}
⎕drop← {
 ⍝ Remove a value from local storage
 «storeDelete("File " + _w.toSimpleString().trim())» 
}

⎕edit← {«pageLink("Edit.html?File=File " + _w.toSimpleString().trim())»}
⎕link← {«pageLink(_w.toSimpleString())»}

⎕split← {
 ⍝ Split ⍺ into enclosed vectors at each ⍵
 0= ⍴⍺← ,⍺ : '' ⋄ 0= ⍴⍵← ,⍵ : ,¨⍺
 width← ⍴⍵← ,⍵ ⋄ ⍵← ⍵⍷ ⍺
 ⍵← (⍵/ ⍳⍴⍵), ⍴⍵ ⋄ drop← 0
 ,⍵ {∆← drop↓ ⍺↑ ⍵ ⋄ drop← ⍺+ width ⋄ ∆}¨ ⊂⍺
}
⎕join← {
 ⍝ Join ⍺ enclosed vectors, with ⍵ between each
 (-≢⍵)↓ ∊⍺,¨ ⊂⍵
}
⎕replace← {
 ⍝ Replace Old with New in character vector ⍺
 ,«_a.toString().replace(new RegExp(_w.data[_w.offset], "g"), _w.data[_w.offset + 1])»
}
⎕trim← {
 ⍝ Remove white space from both ends of ⍵
 ,«_w.toString().trim()»
}
⎕prompt← {
 ⍝ A modern alternative to ⎕
 ⍝ Tell the user ⍵ 
 «alert(_w.toString()) || ""»
;
 ⍝ Ask the user ⍵; ⍺ is the default response
 ,«prompt(_w.toString(), _a.toString())»
}