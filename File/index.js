  var thisPLJ, thisURL, thisBFJ, thisImmed
  var thisPJ, thisLink, thisBJ

  function handleLoad(aLink, aPJ, aBJ) {
   var myArg

   thisPJ= aPJ
   thisLink= aLink
   thisBJ= aBJ
   
   flagEmpty(thisPJ, "")
   flagEmpty(thisBJ, "")

   thisPLJ= thisBFJ= " is set when you choose a destination!"
   thisPLJ= "PLJ" + thisPLJ
   thisBFJ= "BFJ" + thisBFJ
   thisURL= "home.html"

   myArg= window.location.href
   thisImmed= myArg.substr(myArg.length - 6, 6) == "?IMMED"
  }

  function handleChoice(aLink, aURL, aPLJ, aBFJ) {
    thisLink.value= aLink
    thisURL= aURL
    thisPLJ= aPLJ
    thisBFJ= aBFJ

    flagEmpty(thisPJ, aPLJ)
    flagEmpty(thisBJ, aBFJ)


    if (thisImmed) {
     handleLink()
    }
  }

  function flagEmpty(aField, aName) 
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
