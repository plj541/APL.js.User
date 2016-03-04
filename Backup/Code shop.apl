#include Html

thisArguments← thisStore← thisConfig← thisNotInit← thisItems← ''

Define← {
 btn← 7 Space 'onclick:goClear' Button 'Clear ', thisStore, ' List'
 cols← 5
 (key lin)← Shop thisStore
 tab← cols Columns (⊂'myItems') Check¨ lin
 tab← tab⍪ cols Columns (⊂'onclick:goExtra') Button¨ key
 ∆← btn, BR, Table tab
 ∆← ∆, BR, 'myNext' Text 30
 ∆← ∆, 25 Space 'mySend' 'onclick:goSend' Button 'Send this List'
 ∆← ∆, 20 Space 'onclick:goSave' Button 'Save this List'
 ∆← ∆, BR, 'myExtras' 'readOnly=true' Text 4 42
 ∆← ∆, 7 Space 'onclick:goRemove' Button 'Remove'
}

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

Shop← {
 lin← ⎕file 'shop', ⍵
 (key lin)← {(⎕trim ⍵) ⎕split LF}¨ lin ⎕split ';'
 lin← {⍵ ⎕split ','}¨ lin
 key lin
}

get_MailItems← {
 (myIndex myAddr myItems)← thisItems
 myItem← myIndex⊃ myItems
 myLeft← ,⍕(≢myItems)- myIndex← myIndex+ 1
 myItem Mail myAddr (thisStore, myLeft)
 (⊂'Mailing ', myLeft, ' Left')Values 'mySend'
 myIndex< ≢myItems : thisItems[0]← myIndex
 (⊂'Send ', thisStore, ' List')Values 'mySend'
 thisItems← ''
}

get_Next← {
 myNext← ⎕trim ↑Values 'myNext'
 0= ≢myNext : ⎕prompt 'Type in an extra value first!'
 ∨/', '∊ myNext : ⎕prompt 'No spaces or commas!'
 MT Values 'myNext'
 myNext
}

get_onDefine← {
 thisArguments← Arguments
 thisNotInit← 0= ≢thisStore← Parm 'Store' : ↗'Store is not specified!'
 thisNotInit← 0= ≢thisConfig← Parm 'Config' : ↗'Config is not specified!'
 thisNotInit← 0= ≢⎕file thisConfig : ↗thisConfig, ' is empty!'
 ∊Define ''
}

get_onLoad← {
 thisNotInit : ''
 0= ≢∆← ⎕file thisConfig, 'Result' : ''
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

get_goExtra← {
 0= ≢myNext← Next : ''
 myExtras← ↑Values 'myExtras'
 myNext← myNext, (0≠ ⍴myExtras)/', '
 'myExtras' Values⍨ ⊂((↑Field 'value'), myNext), myExtras
 goSave
}

get_goRemove← {
 0= ≢myNext← Next : ''
 wrap← {' ', ⍵, ','}
 myExtras← wrap ↑Values 'myExtras'
 myExtras← myExtras ⎕replace (wrap myNext) ''
 'myExtras' Values⍨ ⊂1↓¯1↓ myExtras
 goSave
}

get_goSave← {
 myItems← (Checks 'myItems')/ Values 'myItems'
 myExtras← (⎕trim ↑Values 'myExtras')⎕split ', '
 myStore← (myItems ⎕join TAB), ';', myExtras ⎕join TAB
 myStore ⎕file thisConfig, 'Result'
 myItems, myExtras
}

get_goSend← {
 0≠ ≢thisItems : MailItems
 myItems← goSave
 0= ⍴myItems : ⎕prompt 'Nothing to send!'
 myItems← 1↓¨ myItems[⍋myItems]
 myItems← myItems ⎕join ', '
 myAddr← Parm 'Addr'
 0= ⍴myAddr : myItems ⎕prompt 'Addr not specified!  Please copy this to the clipboard:'
 1 : myItems Mail myAddr thisStore

 ⍝ NB.  The following was to break up SMS Text Messages
 myItems← myItems {«splitLines(_a.toString(), _w.data[0])»} 156- ⍴thisStore
 1= ⍴myItems : (↑myItems) Mail myAddr thisStore
 thisItems← 0 myAddr myItems ⋄ MailItems
}
