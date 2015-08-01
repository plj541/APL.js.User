get_help← {
 '  Test   ⍝ compares each of the examples'
}

ip← +.×

op← { (⍺ ⍶ ⍺) ⍹ (⍵ ⍶ ⍵) }

InDef← {
 ⍝ INflate/DEFlate
 ⍵ ⍶ ×\1+ ⍺÷ 100
}

Inv← 2000 5000 6000 4000 2000
Inf← 2.6 2.9 3.4 3.1 2.7

get_Test← {
 140≢ 1 2 3 ip 10 20 30 : ↗'ip not 140'
  89≢ 5 ×op+ 8 : ↗'op not 89' 
 160≢ 5 +op× 8 : ↗'op not 160'
 ' 2052.00 5278.77 6549.90 4501.96 2311.76'≢ ,2⍕ Inf ×InDef Inv : ↗'InDef not 2052.00 ...'
 ' 3118.91 4072.92 3480.97 2221.25 2162.86'≢ ,2⍕ Inf ÷InDef 3200 4300 3800 2500 2500 : ↗'InDef not 3118.91 ...'
 Inv (0 2⍕ Inf ÷InDef Inf ×InDef Inv)
}

Flip← {
 «IsNull(_a)» : ⍵ ⍶ ⍵
 ⍵ ⍶ ⍺
}