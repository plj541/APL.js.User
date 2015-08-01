get_help← { 1↓ "
xml verbs:
   myNode← xml myXML                   ⍝ Parse myXML, return 2 element node definition
      ⍝  Node results are two elements, the first item is a generated name.
      ⍝  The second item is a path separated by slash.  Its purpose is just to
      ⍝  identify the node, it is used internally not directly by APL.
      ⍝  In the event of multiple hits, the first node is returned. 
      ⍝  If an item is not found, the result is empty.
   xmlAttr myNode 'Edit'               ⍝ Return all attributes at fully specified location
   xmlValue myNode 'Edit' 'css'        ⍝ Return value at fully specified location
   myEdit← xmlPath myNode 'Edit'       ⍝ Return 2 element node definition
      ⍝  Verbs below to examine XML structure:
      ⍝  Only xmlValues searches widely, items for all other verbs are found.
   xmlNames myNode 'Edit'              ⍝ Return all children names at fully specified location
   xmlParent myNode                    ⍝ Return name of parent's node
      ⍝  Only xmlValues searches widely, items for all other verbs are found.   
   xmlValues myNode [myParent] 'css'   ⍝ Return all values anywhere below myNode"
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

xmlNames← {
 «xmlNames(_w)»
}

xmlParent← {
 «xmlNode(_w).parentNode.nodeName»
}

xmlValues← {
 «xmlValues(xmlNode(_w.data[_w.offset]), _w)»
}

xmlPath← {
 «xmlPath(_w)»
}

'' ⍝ Fini