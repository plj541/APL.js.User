#include Host

get_helpMe← { 1↓ "
plj nouns and verbs
   both, just   nouns, left args for Save
   Html         verb, get head or form  (body has Keyboard.js)
   Dir          verb, list all local storage
   Store        verb, get/put local storage
   Drop         verb, remove local storage
   toHex        verb, convert a number to Hex
   page         verb, get a web page
   shop         verb, Run shop with 0=Smart 1=Safe, second 1 provides Addr"
}

both← 1 1 ⋄ just← 1 0

&← {
 2> ≡⍵ : ,⊂⍵ ⋄ ⍵
;
 2> ≡⍵ : ⍺ ⍵
 1≡ ≢⍴⍵ : (⊂⍺), ⍵
 ⍺ ⍵
}

Html← {
 ⍵← 2↑ &⍵
 «document.getElementsByTagName(_w.data[0])[_w.data[1]].innerHTML»
;
 ⍵← 2↑ &⍵
 «document.getElementsByTagName(_w.data[0])[_w.data[1]].innerHTML = _a.toString()»
}

Dir← {
 «storeLib(_w.toSimpleString())»
}

Store← {
 ⍝ Return a value from web storage (each browser provides its own store)
 «storeGet(_w.toSimpleString())» 
;
 ⍝ Place a value into web storage
 «storePut(_w.toSimpleString(), _a.toString())» 
}

Drop← {
 «storeDelete(_w.toSimpleString())»
}

toHex← {
 ⍝ Convert a number to Hex
 ⍝  {⍵← ((⍵< 0)/ '-'), ,⍕|⍵ ⋄ ,''⍎ '«', ⍵, ' .toString(16)»'}¨ ⍵
 0= ≡⍵← ,⍵ : ⍬
 neg← 16* wid← 2++/ (⌈/|⍵)≥ 2*7+4×⍳14
 wid← wid⍴ 16
 {'0123456789abcdef'[wid⊤{⍵< 0 : ⍵+ neg ⋄ ⍵} ⍵]}¨ ⍵
}

page← {
 «pageGet(_w.toSimpleString())»
}

shop← {
 ∆← 2↑ ⍵
 ∆[1] shop ∆[0]⊃ 'Smart' 'Safe'
;
 ⎕link 'Run.html?Local&Page=shop&Store=', ⍵, ⍺/'&Addr=6507661863@vtext.com;6507667495@vtext.com'
}

'' ⍝ Fini
