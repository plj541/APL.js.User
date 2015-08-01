#include Html

get_help← { 1↓ "
The #include line above provides several nouns and verbs from 1 Html
testHtml nouns:
   Example      define an example web page
   go           link to page with contents of Example
   newList      example for user to type after pressing #Debug button

   onDefine     called when HTML page is defined
   onLoad       called to load fields
   onUnload     called when page is unloading

   goClear      called by Clear button
   goLoad       called by Load button
   goSave       called by Save button
   sampleEvent  called onkeypress event in myCount fields"
}

get_onDefine← {
 ∊Example
}

get_onLoad← {
 2≠ ≢myConfig← xml ⎕file 'testHtmlResult' : ''
 nodes← {0= ≢∆← xmlValue myConfig ⍵ : MT ⋄ ∆ ⎕split TAB}
 'myList' Values⍨ nodes 'list'
 'myItems' Checks⍨ (Values 'myItems')∊ nodes 'items'
 'myCount' Values⍨ nodes 'count'
 'myOutput' Values⍨ nodes 'output'
}

get_onUnload← {
 nodes← {⍺ xmlElement ⍵ ⎕join TAB}
 ∆← 'list' nodes Values 'myList'
 ∆← ∆, LF, 'items' nodes (Checks 'myItems')/ Values 'myItems'
 ∆← ∆, LF, 'count' nodes Values 'myCount'
 ∆← ∆, LF, 'output' nodes Values 'myOutput'
 ∆← '<sample>', ∆, '</sample>'
 ∆ ⎕file 'testHtmlResult'
}

get_goClear← {
 MT Values 'myList'
 0 Checks 'myItems'
 MT Values 'myCount'
 MT Values 'myOutput'
}

get_goLoad← {
 'myCount' Values⍨ 2⍕¨ .01× ?4 2⍴ 100000 
}

get_goSave← {
 onUnload
 «pageExit()»
}

get_go← {
 Run 'testHtml'
}

get_Example← {
 btn← 'onclick:goLoad' Button 'Load'
 btn← btn, 'onclick:goClear' Button 'Clear'
 btn← btn, 'myList' List Pairs MT, TS[0]+⍳7
 tab← 4 2⍴ 'myCount' 'onkeypress:sampleEvent' Text 10
 tab← tab, (⊂'myItems') Check¨ Pairs 'Turkey' 'Beef' 'Brie' ('breadRolls' 'Bread Rolls')
 tab← tab⍪⍨ 'good' 'bad' 'check'
 tab← tab⍪⍨ btn
 tab← tab,⍨ '' '' 'this' 'is' 'a' 'test'
 ∆← Table tab
 ∆← ∆, BR, 'myOutput' Text 5 72
 ∆← ∆, BR, 7 Space ('onclick:goSave' Button 'Save'), 14 Space Debug
}

get_sampleEvent← {
 ⍝ For control characters in 'charCode', Firefox gives 0, Chrome gives values less than 32
 ⍝ For normal characters in 'keyCode', Firefox gives 0, Chrome gives values greater than 31
 ∆← {(⍵= 0)∨ ⍵≥ 32 : '"', (⎕UCS Event 'charCode'), '"' ⋄ ,⍕⍵} Event 'keyCode'
 ∆← 'You entered ', ∆, ' into ', Field 'value'
 (⊂∆, (⎕UCS 10), ∊Values 'myOutput') Values 'myOutput'
}

get_newList← {
 'myList' Defines⍨ Options Pairs MT, TS[0]- ⍳9
}