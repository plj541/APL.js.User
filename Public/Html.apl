get_help← { 1↓ "
Html nouns and verbs:
   TS           noun, provides a time stamp (⎕TS)
   LF           noun, is control character ⎕UCS 10
   TAB          noun, is control character ⎕UCS 9
   BR           noun, is HTML line break <br>
   MT           noun, is an empty value

   Button       verb, defines an HTML button
   Text         verb, defines an HTML text or textarea
   Check        verb, defines an HTML checkbox
   List         verb, defines an HTML listbox
   Debug        noun, defines an HTML button that invokes #Debug dialog
   Table        verb, transforms a matrix into an HTML table

   Values       verb, to get/put value property from fields with ID
   Checks       verb, to get/put checked property from fields with ID
   Defines      verb, to put innerHTML property of field with ID

   Field        verb, to get/put a property of a field in an event
   Event        verb, to get/put an event property in an event

   Run          verb, to display HTML, or debug an application

   xml          verb, to load an XML document
   xmlValue     verb, path to a node and decode its Value
   xmlAttr      verb, path to a node and provide its Attributes
   xmlElement   verb, to create an XML element"
}

get_TS← {
 ⍝ TS returns ⎕TS
 ⍵← «(new Date()).toISOString()»
 ⍎'0123456789 '['0123456789'⍳ ⍵]
}

Handle← {
 ⍝ 'whoCalled' Handle 'myField' 'multiple≠⋄width=27⋄onclick:goSave'
 0= ⍴⍵← ,⍵ : '' ⋄ 2< ≡⍵ : ↗'DOMAIN ERROR:  ', ⍺
 ⍵← {2= ≡⍵ : ⍵ ⋄ (∨/':=≠'∊ ⍵)⌽ ⍵ ''} ⍵
 2≠ ⍴⍵ : ↗'LENGTH ERROR:  ', ⍺
 (∆ ⍵)← ⍵ ⋄ ∆← {0= ⍴⍵ : '' ⋄ 'id="', ∆, '"'} ∆
 0= ⍴⍵ : ∆
 ⍵← ⍵ ⎕split '⋄'
 ∆, ∊(⊂⍺) {
  2= ⍴myParm← ⍵ ⎕split '≠' : ' ', myParm[0]                       ⍝ ≠, Parm has no value
  2= ⍴myParm← ⍵ ⎕split '=' : ' ', myParm[0], '="', myParm[1], '"' ⍝ =, Quote normal HTML value
  2≠ ⍴myParm← ⍵ ⎕split ':' : ↗'DOMAIN ERROR:  ', ⍺ 
  ' ', myParm[0], '="onEvent(this, event, ''', myParm[1], ''')"'  ⍝ :, Call APL, with field and event
 }¨ ⍵
}

LF← ⎕UCS 10 ⋄ TAB← ⎕UCS 9
BR← ⊂'<br>' ⋄ MT← ⊂''
Space← {⍵,⍨ ⊂'&nbsp;'⍴⍨ 6× ⍺}

Button← {
 '' Button ⍵
;
 ∆← '<input type="button" ', 'Button' Handle ⍺
 ⊂∆, ' value="', ⍵, '">'
}

get_Debug← {
 ⊂'<input type="button" onclick="pageDebug()" value="#Debug">'
}

Text← {
 '' Text ⍵
;
 ∆← 'Text' Handle ⍺
 1= ≢⍵ : ⊂'<input type="Text" ', ∆, ' size="', (,⍕⍵), '" />'
 (⍺ ⍵)← {,⍕⍵}¨ ⍵
 ⊂'<textarea ', ∆, ' rows="', ⍺, '" cols="', ⍵, '"></textarea>'
}

Check← {
 '' Check ⍵
;
 ∆← '<input type="checkbox" ', 'Check' Handle ⍺
 (⍺ ⍵)← ⍵ ⋄ ⊂∆, ' value="', ⍺, '">', ⍵
}

List← {
 '' List ⍵
;
 ∆← '<select ', '>',⍨ 'List' Handle ⍺
 ⊂∊∆ (Options ⍵) '</select>'
}

Options← {
 ⊂∊{(∆ ⍵)← ⍵ ⋄ '<option value="', ∆, '">', ⍵, '</option>'}¨ ⍵
}

get_Arguments← {
 {(2,⍨ .5× ⍴⍵)⍴ ⍵} «Arguments()»
}

Columns← {
 (⍺,⍨ ⌈⍺÷⍨ ⍴⍵)⍴ ⍵, ⍺⍴ ⊂''
}

Pairs← {
 {2≤ ≡⍵ : ⍵ ⋄ 2⍴ ⊂,⍕⍵}¨ ⍵
}

Table← {
 '0' Table ⍵
;
 ⍵← {1= ≢⍵← ⍕⍵ : ,⍵ ⋄ ,⍵, (4,⍨ ≢⍵)⍴ '<br>'}¨ ⍵
 ⍵← {'<td>', ⍵, '</td>'}¨ ⍵
 ⍵← (⊂'<tr>'), ⍵, ⊂'</tr>'
 ⊂('<table border="', ⍺, '">'), (∊⍵), '</table>'
}

Values← {
 «fieldValues(_w.toSimpleString())»
;
 «fieldValues(_w.toSimpleString(), _a)»
}

Checks← {
 «fieldChecks(_w.toSimpleString())»
;
 «fieldChecks(_w.toSimpleString(), _a)»
}

Defines← {
 «fieldDefines(_w.toSimpleString())»
;
 «fieldDefines(_w.toSimpleString(), _a)»
}

Field← {
 ⍎'«thisField.', ⍵, '»'
;
 ⍺← {' '∊2↑1⍴ ⍵ : '"', ⍵, '"' ⋄ ,⍕⍵} ⍺
 ⍎'«thisField.', ⍵, ' = ', ⍺, '»'
}

Event← {
 ⍎'«thisEvent.', ⍵, '»'
;
 ⍺← {' '∊2↑1⍴ ⍵ : '"', ⍵, '"' ⋄ ,⍕⍵} ⍺
 ⍎'«thisEvent.', ⍵, ' = ', ⍺, '»'
}

Run← {
 ⍝ If ⍵ is HTML, display it
 '<'= ↑⍵← ∊⍵ : 'Display' Run ⍵
 ⍝ Page is a workspace to run, calling onDisplay then onLoad 
 '<'≠ ↑⍵← ∊⍵ : ⎕link 'Run.html?Local&Page=', ⍵
 ⍝ Remove Local when you publish a link
; 
 ⍵ ⎕file ⍺
 ⎕link 'Run.html?File=', ⍺
}

xmlElement← {
 ⍺ {«xmlElement(_a, _w)»} ⍵
}

xml← {
 «xmlParse(_w)»
}

xmlValue← {
 «xmlValue(_w)»
}

xmlAttr← {
 ∆← «xmlAttr(_w)»
 ∆← (2,⍨ .5×⍴∆)⍴ ∆
}

'' ⍝ Fini