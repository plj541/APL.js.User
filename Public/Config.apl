#include Html

get_help← { 1↓ "
The #include line above provides several nouns and verbs from 1 Html
Config nouns:
   me           define the web page
   go           link to page
   
   onDefine     called when HTML page is defined
   onLoad       called to load fields
   
   goLib        called by Get Lib button
   goSave       called by Save button"
}

get_onDefine← {
 ∊me
}

thisFetch← ''
get_onLoad← {
 myConfig← xml «storeGet('Saved Config')»
 myConfig← {2= ≢⍵ : ⍵ ⋄ xml '<Config>
<Session><css>all-KB.css</css>
 <rows>22</rows>
 <cols>112</cols>
</Session>
<Edit><css>all-KB.css</css>
 <rows>24</rows>
 <cols>112</cols>
</Edit>
<Fetch></Fetch>
</Config>'} myConfig
 fields← {(⊂⍵) {xmlValue myConfig ⍺ ⍵}¨ 'css' 'rows' 'cols'}
 'mySet' Values⍨ (fields 'Session'), fields 'Edit'
 thisFetch← xmlValue myConfig 'Fetch'
}

get_Lib← {
 myLib← ''
 {∆← «document.getElementById('updateLib').files[_w.data[0]].name»
  2= '.apl' '.jsa' ⍳ ⊂¯4↑ ∆ : ''
  myLib← myLib, ⊂¯4↓ ∆
 }¨ ⍳«document.getElementById('updateLib').files.length»
 myLib
}

get_goSave← {
 wrap← {⍺← ⍺, '>' ⋄ '<', ⍺, ⍵, '</', ⍺, LF}
 mySet← 2 3⍴ Values 'mySet'
 (myCss myRows myCols)← mySet[0;]
 ∆← 'Session' wrap ('css' wrap myCss), ('rows' wrap myRows), 'cols' wrap myCols
 (myCss myRows myCols)← mySet[1;]
 ∆← ∆, 'Edit' wrap ('css' wrap myCss), ('rows' wrap myRows), 'cols' wrap myCols
 ∆← ∆, 'Fetch' wrap {0= ≢⍵ : thisFetch ⋄ ⍵ ⎕join TAB} Lib
 ∆← 'Config' wrap ∆
 ∆ {«storePut(_w.toSimpleString(), _a.toSimpleString())»} 'Saved Config'
 «pageExit()»
}

get_go← {
 Run 'Config'
}

get_me← {
 tab← 2 3⍴ ('mySet' List ('all.css' 'Visible')
  ('all-KB.css' 'Hidden')), 2⍴ 'mySet' Text 10
 tab← 'Session' 'Edit', tab
 tab← '' 'Keyboard' 'Rows' 'Cols'⍪ tab
 tab← ('' 'To update' ')fetch in )lib'
  '<input id="updateLib" multiple type="file" />')⍪ tab
 tab← tab⍪ '' ('onclick:goSave' Button 'Save') '' ''
 Table tab
}