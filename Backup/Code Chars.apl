get_help← { 1↓ "
Chars nouns
   ∅            null
   ⎕type
   av_asc       Ascii
   av_ibm       IBM APL2
   av_ctrl      Control Chars
   sort         dictionary sorting"
}

null← ∅ ⋄ args← ¯10 ∅ 42 1j1
⎕type← {(⍴⍵)⍴ «TypeOf(_w)»}

get_av_asc← {«ValueOf('av_asc')»} ⋄ set_av_asc← {«ValueOf('av_asc', _w)»}
av_asc← ⎕UCS 3 32⍴ 32+ ⍳95

get_av_apl← {«ValueOf('av_apl')»} ⋄ set_av_apl← {«ValueOf('av_apl', _w)»}
av_apl← '¨«¯»×÷←↑→↓↗∅∆∇∊∘∣∧∨∩∪≈≠≡≢≤≥⊂⊃⊆⊇⊖⊢⊣⊤⊥⋄⋔⌈⌊⌷⌸⌹⌽⌿⍀⍁⍂⍉⍋⍎⍒⍕⍘⍝⍞⍟⍠⍣⍤⍦⍨⍪⍬⍭⍮⍯⍱⍲⍳⍴⍵⍶⍷⍸⍹⍺⎕○'

get_av_ibm← {«ValueOf('av_ibm')»} ⋄ set_av_ibm← {«ValueOf('av_ibm', _w)»}
av_ibm← 'ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ'

get_av_ctrl← {«ValueOf('av_ctrl')»} ⋄ set_av_ctrl← {«ValueOf('av_ctrl', _w)»}
av_ctrl← '␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡␤'

get_sort← {«ValueOf('sort')»} ⋄ set_sort← {«ValueOf('sort', _w)»}
sort← 10 26↑⎕UCS 97 65∘.+⍳26
sort← (10↑⎕UCS 32 160),"0123456789",sort,10↑"-,;:.!?"

⍝ miss←  '⌶⌺⌻⌼⌾⍃⍄⍅⍆⍇⍈⍊⍌⍍⍏⍐⍑⍓⍔⍖⍗⍘⍙⍚⍛⍜⍡⍢⍥⍧⍩⍫⍭⍮⍰'
⍝ games← '♔♕♖♗♘♙♚♛♜♝♞♟♠♡♢♣♤♥♦'
⍝ circle← '①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳'
⍝ parens← '⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇'

Columns← "
123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
         1         2         3         4         5         6         7         8         9"