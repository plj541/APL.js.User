get_help← { 1↓ "
Host nouns and verbs:
   TS           noun, provides a time stamp ⎕TS
   Time         verb, you modify the comment to time solutions   
   Mail         verb, 'message' Mail 'your@home.com' 'regarding'
   Save         verb, downloads a workspace, formatted for )fetch
   Backup       verb, downloads all your local browser storage"
}

get_TS← {
 ⍝ TS is a value that returns ⎕TS
 ⍵← «(new Date()).toISOString()»
 ⍎'0123456789 '['0123456789'⍳ ⍵]
}

Time← {
 myBef← «+new Date»
 ⍝ ⍺ (function to time) ⍵
 myAft← «+new Date»
 myAft- myBef
}

Mail← {
 2≠ ≡⍵ : ↗'DOMAIN ERROR'
 ⍵← ⍵, ⊂''
 ⍝      ⍵← 'you@a.com' 'Regarding' ['cc=them@b.org [&bcc=her@c.net]']
 «sendMail(_w.data[0], _w.data[1], _w.data[2], _a)»
 ⍝      ⍺← 'Your message'
}

Save← {
 0 1 Save ⍵
;
 (apl jsa)← ⍺ ⋄ ∆← ⍬
 file← «storeGet("Code " + _w.toSimpleString()).trim()»
 0= ≢file : ↗'Nothing to save:' ⍵
 ⍝ Download a version for )edit
 file {apl : ∆← ⍺ {«fileDownload(_w.toSimpleString(), _a.toSimpleString())»} ⍵, '.apl'} ⍵
 ~jsa : ∆ ⍬
 file← 'jsLoad("Code ", "', ⍵, '", ', (JS file), ')'
 ⍝ Download a version for )fetch
 ∆ (file {«fileDownload(_w.toSimpleString(), _a.toSimpleString())»} ⍵, '.jsa')
}

Replaces←{
 ∆← ⍺
 {∆← ∆ ⎕replace ⍵ ⋄ 0} ¨ ⍵
 ∆
}

JS← {
 ⍝ Convert into something Javascript can load
 ∆← ⍵ Replaces ('\\' '\\') ((⎕UCS 10) '\n') ('"' '\"')
 '"', ∆, '\n"'
}

get_Backup← {
 ∆← «storeLib("")»
 ∆← ⍴{«storeGet(_w.toSimpleString())» {«fileDownload(_w.toSimpleString(), _a.toSimpleString())»} ⍵, '.apl'}¨ ∆
 'Downloaded' ∆ 'files'
}

'' ⍝ Fini