Load← {
 0≠ ≢«document.getElementsByName("formRGraph")[0].innerHTML» : ''
 «jsFetch("../RGraph/libraries/RGraph.common.core.js")»
 «jsFetch("../RGraph/libraries/RGraph.drawing.xaxis.js")»
 «jsFetch("../RGraph/libraries/RGraph.scatter.js")»
 Reset ''
 'Loading RGraph'
}

Reset← {
 ∆← '<canvas id="canvasRGraph" width="1000" height="200"
 style="border:1px solid #c3c3c3;float:left;margin-right:20px;margin-bottom:15px">
 Your browser does not support the &lt;canvas&gt; element.</canvas>'
 ∆← {0= ≢⍵ : ∆ ⋄ ⍵} ⍵
 {«document.getElementsByName("formRGraph")[0].innerHTML = _w.toSimpleString()»} ∆
 'Clearing RGraph'
}

RGraph← {
 «function(anArg) {
  var xaxis = new RGraph.Drawing.XAxis('canvasRGraph', 100)
   .Set('scale.zerostart', false)
   .Set('yaxispos', 'center')
   .Set('numlabels', 4)
   .Set('numticks', 16)
   .Set('max', 360)
   .Draw();

  var myData = graphData(anArg, 3)
  var scatter = new RGraph.Scatter('canvasRGraph', myData[0], myData[1], myData[2])
   .Set('ymax', 1)
   .Set('xmax', 360)
   .Set('scale.decimals', 1)
   .Set('gutter.left', 500)
   .Set('line', true)
   .Set('line.linewidth', 2)
   .Set('tickmarks', null)
   .Set('xaxispos', 'center')
   .Set('xaxis', false)
   .Set('background.grid', false)
   .Set('outofbounds', false)
   .Draw();
   return 'RGraph Updated'
 }(_w)»
}

get_Data← {«ValueOf('Data')»} ⋄ set_Data← {«ValueOf('Data', _w)»}

get_Example← {
 ⍝ http://www.rgraph.net/  Reworked Trig functions into APL
 ∆← Trig 1 2 3
 ∆[3;(1<|∆[3;])/⍳721]← ∅
 RGraph ∆
}

Trig← {
 myDegree← ¯360+ ⍳721
 myRadian← myDegree÷ 180÷○1
 myDegree⍪ (,⍵) ∘.○ myRadian 
}

Load '' ⍝ Fetch RGraph for scatter and xaxis