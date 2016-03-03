  var thisPLJ, thisURL, thisBFJ, thisArgs
  var thisPJ, thisLink, thisBJ

  function handleLoad(aLink, aPJ, aBJ) {
   thisPJ= aPJ
   thisLink= aLink
   thisBJ= aBJ
   
   flagEmpty(thisPJ, "")
   flagEmpty(thisBJ, "")

   thisPLJ= thisBFJ= " is set when you choose a destination!"
   thisPLJ= "PLJ" + thisPLJ
   thisBFJ= "BFJ" + thisBFJ
   thisURL= "home.html"

   thisArgs= window.location.href
   thisArgs= thisArgs.split("?")
   if (thisArgs.length == 2) {
    thisArgs= thisArgs[1]
   } else {
    thisArgs= ""
   }
  }

  function handleChoice(aLink, aURL, aPLJ, aBFJ) {
    thisLink.value= aLink
    thisURL= aURL
    thisPLJ= aPLJ
    thisBFJ= aBFJ

    flagEmpty(thisPJ, aPLJ)
    flagEmpty(thisBJ, aBFJ)

    if (thisArgs == "IMMED") {
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
    prompt("User Name", aValue)
  }
 
  function handleLink() {
   window.open(thisURL)
  }
