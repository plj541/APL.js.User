#include Html

thisArguments← thisStore← thisNotInit← thisItems← ''

Mail← {
 2≠ ≡⍵ : ↗'DOMAIN ERROR'
 ⍵← ⍵, ⊂''
 ⍝      ⍵← 'you@a.com' 'Regarding' ['cc=them@b.org [&bcc=her@c.net]']
 «sendMail(_w.data[0], _w.data[1], _w.data[2], _a)»
 ⍝      ⍺← 'Your message'
}

Parm← {
 myArg← thisArguments[; 0]⍳ ⊂⍵
 myArg= ≢thisArguments : ''
 ↑thisArguments[myArg; 1]
}

get_onDefine← {
 thisArguments← Arguments
 thisNotInit← 0= ≢thisStore← Parm 'Store' : ↗'Store is not specified!'
 thisNotInit← 0= ≢⎕file 'shop', thisStore : ↗thisStore, ' is not configured!'
 ∊me
}

get_onLoad← {
 thisNotInit : ''
 0= ≢∆← ⎕file 'shop', thisStore, 'Result' : ''
 (myItems myExtras)← ∆ ⎕split ';'
 myItems← myItems ⎕split TAB
 'myItems' Checks⍨ myItems∊⍨ Values 'myItems'
 0= ≢myExtras← ⎕trim myExtras : ''
 'myExtras' Values⍨ ⊂myExtras ⎕replace TAB ', '
}

get_goClear← {
 0 Checks 'myItems'
 MT Values 'myExtras'
}

Shop← {
 lin← ⎕file 'shop', ⍵
 (key lin)← {(⎕trim ⍵) ⎕split LF}¨ lin ⎕split ';'
 lin← {⍵ ⎕split ','}¨ lin
 key lin
}

get_me← {
 btn← 7 Space 'onclick:goClear' Button 'Clear'
 cols← 5
 (key lin)← Shop thisStore
 tab← cols Columns (⊂'myItems') Check¨ lin
 tab← tab⍪ cols Columns (⊂'onclick:goExtra') Button¨ key
 ∆← btn, BR, Table tab
 ∆← ∆, BR, 'myNext' Text 25
 ∆← ∆, 29 Space 'mySave' 'onclick:goSave' Button 'Send ', thisStore, ' List'
 ∆← ∆, BR, 'myExtras' 'readOnly=true' Text 4 42
 ∆← ∆, 7 Space 'onclick:goRemove' Button 'Remove'
}

get_goExtra← {
 0= ≢myNext← Next : ''
 myExtras← ↑Values 'myExtras'
 myNext← myNext, (0≠ ⍴myExtras)/', '
 'myExtras' Values⍨ ⊂((↑Field 'value'), myNext), myExtras
}

get_Next← {
 myNext← ⎕trim ↑Values 'myNext'
 0= ≢myNext : ⎕prompt 'Type in an extra value first!'
 ∨/', '∊ myNext : ⎕prompt 'No spaces or commas!'
 MT Values 'myNext'
 myNext
}

get_goRemove← {
 0= ≢myNext← Next : ''
 wrap← {' ', ⍵, ','}
 myExtras← wrap ↑Values 'myExtras'
 myExtras← myExtras ⎕replace (wrap myNext) ''
 'myExtras' Values⍨ ⊂1↓¯1↓ myExtras
}

get_goSave← {
 0≠ ≢thisItems : MailItems
 myItems← (Checks 'myItems')/ Values 'myItems'
 myExtras← (⎕trim ↑Values 'myExtras')⎕split ', '
 ((myItems ⎕join TAB), ';', myExtras ⎕join TAB) ⎕file 'shop', thisStore, 'Result'
 myItems← myItems, myExtras
 0= ⍴myItems : ⎕prompt 'Nothing to send!'
 myItems← 1↓¨ myItems[⍋↑¨myItems]
 myItems← myItems ⎕join ', '
 myAddr← Parm 'Addr'
 0= ⍴myAddr : myItems ⎕prompt 'Addr not specified!  Please copy this to the clipboard:'
 1 : myItems Mail myAddr thisStore
 # The following is for SMS Text Messages
 myItems← myItems {«splitLines(_a.toString(), _w.data[0])»} 156- ⍴thisStore
 1= ⍴myItems : (↑myItems) Mail myAddr thisStore
 thisItems← 0 myAddr myItems ⋄ MailItems
}

get_MailItems← {
 (myIndex myAddr myItems)← thisItems
 myItem← myIndex⊃ myItems
 myLeft← ,⍕(≢myItems)- myIndex← myIndex+ 1
 myItem Mail myAddr (thisStore, myLeft)
 (⊂'Mailing ', myLeft, ' Left')Values 'mySave'
 myIndex< ≢myItems : thisItems[0]← myIndex
 (⊂'Send ', thisStore, ' List')Values 'mySave'
 thisItems← ''
}
