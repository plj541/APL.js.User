get_helpMe← { 1↓ "
   x← xml c     ⍝ Config
   a← xml t     ⍝ ⎕file 'testHtmlResult'"
}

c← '<Config>
<Session>
<css>all-KB.css</css><rows>32</rows><cols>117</cols>
</Session>
<Edit this="one" that="twice">
<css find="me">all-KB.css</css><rows>33</rows><rows>42</rows><cols>117</cols>
</Edit>
<Fetch>Chars	CompareJ	GitHubIssues	plj	shop	testAt	testHtml	testModels	timeMatDiv	timeMix	userOps	xml</Fetch>
</Config>'

t← '<sample><list>2017</list>
<items>Turkey	breadRolls</items>
<count> 983.62	 58.11	 826.33	 250.80	 892.79	 955.01	 968.59	 790.65</count>
<output>You entered &quot;3&quot; into  826.3
</output></sample>'

'' ⍝ Fini