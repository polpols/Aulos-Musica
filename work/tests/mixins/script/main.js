
function $(el){
  return document.getElementById(el);
}
var images= {
	"images":[
		{
			"src":"img/partitions-011.jpg",
			"name":"Il Subsite"
		},
		{
			"src":"img/partitions-012.jpg",
			"name":"Trois Essais selon Cocteau"
		},
		{
			"src":"img/partitions-013.jpg",
			"name":"Beethoven"
		},
		{
			"src":"img/partitions-014.jpg",
			"name":"Oiseau de Feu 1"
		},
		{
			"src":"img/partitions-015.jpg",
			"name":"OiseaudeFeu2"
		}
	]
};
function mk_menu_img(){
  sel= document.getElementById("selector");
  for (i=0; i<images.images.length;i++){
    a=document.createElement("a");
    t=document.createTextNode(images.images[i].name);
    a.setAttribute("src","#");
    oncl="load_images("+i+")"
    a.setAttribute("onclick",oncl);
    a.appendChild(t);
    sel.appendChild(a);
  }
}
function load_images(i){
  a=document.getElementById("background").getElementsByTagName("img")[0];
  b=images.images[i].src;
  a.setAttribute("src",b);
}

document.onmousemove = function(e){
  document.getElementById("mouse_x").getElementsByTagName("div")[0].innerHTML = e.pageX;
  document.getElementById("mouse_y").getElementsByTagName("div")[0].innerHTML = e.pageY;
}

var tzdragg = function(){
  return {

    startMoving : function(evt){
      evt = evt || window.event;
      var posX = evt.clientX,
      posY = evt.clientY,
      a = $('test'),
      divTop = a.style.top,
      divLeft = a.style.left;
      divTop = divTop.replace('px','');
      divLeft = divLeft.replace('px','');
      var diffX = posX - divLeft,
      diffY = posY - divTop;
      document.onmousemove = function(evt){
        evt = evt || window.event;
        var posX = evt.clientX,
        posY = evt.clientY,
        aX = posX - diffX,
        aY = posY - diffY;
        tzdragg.move('test',aX,aY);
      }
    },
    stopMoving : function(){
      document.onmousemove = function(){}
    },
    move : function(divid,xpos,ypos){
      var a = $(divid);
      $(divid).style.left = xpos + 'px';
      $(divid).style.top = ypos + 'px';
    }
  }
}();
