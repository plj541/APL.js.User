Dos Aux. Processor  - to use Dos files  
	710	⎕svo 'dosx'		- to offer dosx variable 
		⎕svo 'dosx'		- returns 2 if success, 1 if failed. 
 
   dosx ← 'help'		- to see list of commands avail.  
   dosx ← 'dir *.*'		- to get list.of files in dir.   
   dosx ← 'dir *.saw'	- to get a list of all APL workspaces 
   dosx ← 'junknothing'	- to see 7 return code for invalid cmd.

   dosx ← 'create test.tst'	- to create file test.tst on misc area
   dosx ← 'write 0,1;test'	- write 'test',
							translated to ASCII, (the code 1),
							to file location 0.
   dosx ← 'write ;data'      -  write 'data' at current location (EOF)

   dosx ← 'read 0,4,2'       -  read 4 chars, translated ASCII to APL 
   dosx 
    00 00;test                 -  (shows we started read at loc. 0) 
   dosx ← 'read 0,8'         -  read 8 chars from file location 0 
 
   dosx ← 'close'            -  close the file
   dosx ← 'erase test.tst'   -  erase the file/ test.tst   
   dosx      (Confirm results by checking dosx contains 0 return code
  00 00;
 
Translation types are:
	0=no translation,
	1=APL to ASCII,
	2=ASCII to APL
You open an existing file with:
	openro, or
	openrw.
The cmd size may be used to return 4 vars,
	file size,
	curr.indx,
	curr.count,
	translation.
A file is treated like a big character vector.
Current count tells the part of the file to be
affected by whatever operation is used.