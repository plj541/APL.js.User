  var thisPLJ, thisURL, thisBFJ, thisArgs
  var thisPJ, thisLink, thisBJ
  var thisKRJ,          thisRAJ
  var thisKJ,           thisRJ

  function handleLoad(aLink, aPJ, aBJ, aKJ, aRJ) {
   thisPJ= aPJ
   thisLink= aLink
   thisBJ= aBJ
   thisKJ= aKJ
   thisRJ= aRJ
   
   flagEmpty(thisPJ, "")
   flagEmpty(thisBJ, "")
   flagEmpty(thisKJ, "")
   flagEmpty(thisRJ, "")
   
   thisPLJ= thisBFJ= thisKRJ= thisRAJ= " is set when you choose a destination!"
   thisPLJ= "PLJ" + thisPLJ
   thisBFJ= "BFJ" + thisBFJ
   thisKRJ= "KRJ" + thisKRJ
   thisRAJ= "RAJ" + thisRAJ
   thisURL= "home.html"

   thisArgs= window.location.href
   thisArgs= thisArgs.split("?")
   if (thisArgs.length == 2) {
    thisArgs= thisArgs[1]
   } else {
    thisArgs= ""
   }
  }

  function handleChoice(aLink, aURL, aPLJ, aBFJ, aKRJ, aRAJ) {
   thisLink.value= aLink
   thisURL= aURL
   thisPLJ= aPLJ
   thisBFJ= aBFJ
   thisKRJ= aKRJ
   thisRAJ= aRAJ

   flagEmpty(thisPJ, aPLJ)
   flagEmpty(thisBJ, aBFJ)
   flagEmpty(thisKJ, aKRJ)
   flagEmpty(thisRJ, aRAJ)
   
   if (thisArgs != "Immed=No") {
    handleLink()
   }
  }

  function flagEmpty(aField, aName) {
   if (aName.length == 0) {
    aField.style.backgroundColor = "LightPink"
   } else {
    aField.style.backgroundColor = "LightGreen"
   }
  }

  function handleFocus(aValue) {
   thisLink.focus()
   prompt("User Name", aValue)
  }
 
  function handleLink() {
   window.open(thisURL)
  }
