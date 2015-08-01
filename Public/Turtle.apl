Load← {
 0≠ ≢«document.getElementsByName("formTurtle")[0].innerHTML» : ''
 «jsFetch("../Turtle/hsv.js")»
 «jsFetch("../Turtle/pen.js")»
 Reset ''
 'Loading Turtle'
}

Reset← {
 ∆← '<canvas id="canvasTurtle"  height="500" width="800"
  style="border:1px solid #c3c3c3;float:left;margin-right:20px;margin-bottom:15px">
  Your browser does not support the &lt;canvas&gt; element.</canvas>'
 ∆← {0= ≢⍵ : ∆ ⋄ ⍵} ⍵
 {«document.getElementsByName("formTurtle")[0].innerHTML = _w.toSimpleString()»} ∆
 'Clearing Turtle'
}

get_Example← {
 ⍝ https://github.com/davebalmer/turtlewax  No rework into APL as yet
 «function() {
  // create a new pen object attached to our canvas tag
  var p = new Pen("canvasTurtle");

  // add a custom function to draw a square
  p.square = function(size) {
  for (var i = 0; i < 4; i++)
   this.go(size).turn(90);

   // to be a good function, we want to allow chaining
   return this;
 }

 // add custom "spirograph" function based on our new square function
 p.spiro = function() {
  for (var i = 0; i < 36; i++)
   this.square(50).turn(10);
   return this;
  }

 // an arrow function, for grins
 p.arrow = function() {
  var p = this.pen;
  this.pendown().turn(-150).go(20).back(20).turn(300);
  this.go(20).back(20).turn(-150).close().stroke();
  // restore our pen state
  this.pen = p;
  // again, support chaining because it's cool
  return this;
 }

 // stupid canvas tricks
 //p.canvas.scale(5, 5);
 //p.canvas.translate(-600, -250);

 // make single pixel lines look prettier -- don't ask
 p.canvas.translate(.5, .5);

 p.jump(300, 250).fillstyle("#ff0").pensize(0);
 p.ray = function(d, a) {
  this.begin();
  return this.origin().polar(d, 0).polar(d, a).polar(0, 0).close().draw();
 }

 for (var i = 0; i < 18; i++) {
  // pen color change for a little pazazz
  p.fillstyle(hsvtorgb(p.dir + 60, 1, .9));
  p.ray(1000, 10).turn(20);
 }

 p.turn(10);
 for (var i = 0; i < 18; i++) {
  // pen color change for a little pazazz
  p.fillstyle(hsvtorgb(p.dir - 60, 1, .9));
  p.ray(1000, 10).turn(20);
 }
 p.turn(-10);

 // draw a container box
 p.pensize(3).fillstyle("rgba(255, 255, 255, .8)");
 p.jump(10, 10).right(780).down(480).left(780).up(480).close().draw();

 // yes, you could go directly to the canvas if you wanna, but it won't chain
 // p.fillstyle("#eee").canvas.fillRect(10, 10, 790, 490);

 // draw a square
 p.pensize(1).fillstyle("#ff0").jump(50, 300).square(100).draw();

 // draw a spirograph
 p.fillstyle().jump(300, 250).spiro().draw();

 // make a complex drawing using our functions
 p.jump(600, 250);
 for (var i = 0; i < 18; i++) {
  // pen color change for a little pazazz
  p.penstyle(hsvtorgb(p.dir, 1, .9));

  // draw a spiro, then rotate a bit
  p.penup().go(100).pendown().spiro().penup().back(100).turn(20).draw();
 }

 // draw some labels
 p.fillstyle("#999").font("bold 15px Helvetica").penup();
 p.jump(70, 150).text("A square");
 p.jump(180, 110).text("A 'spirograph' made from squares");
 p.jump(480, 50).text("A pattern made from 'spirographs'");
 return "Turtle Updated"
} ()» }

Load ''  ⍝ Fetch Turtle for further use