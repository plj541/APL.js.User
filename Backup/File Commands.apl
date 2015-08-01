)lib      List the name spaces for  )load  or  )copy
       ⎕files    List of files
)load     Restart calculations in a name space
)copy     Add a name space to further calculations
)save     Preserve a name space
       ⎕file     Read or Write a file
)drop     Remove a name space
       ⎕drop
)edit     Edit the current name space
       ⎕edit     Edit the named file

)fetch    List, or with a name, fetch a file or name space

)clear    Restart calculations with no name space
)clean    Clean the screen

)reload   Reload the results after  )edit
)redo     Run each command in the log

)help     Provide this list of commands


⎕CT       Set comparison tollerance
⎕DL       Delay milliseconds
⎕RE       Regular Expression
⎕UCS      Convert characters to indexes and indexes to characters

⎕trim     removed white space before and after characters
⎕replace  replace old with new in characters
⎕split    split characters into nested array
⎕join     join nested array into character vector

⎕prompt   Display message box or acquire a response
⎕link     Load a new webpage


  ⍎ 'chars'  cannot access existing names
''⍎ 'chars'  accesses global names
⎕Error    Contains last error raised by global ⍎