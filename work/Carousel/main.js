var carousel = [
  {
  "name":"Cartes",
  "images":["carte_1.png","carte_2.png","carte_3.png"]
  },
  {
  "name":"Interieur",
  "images":["interieur_1.png","interieur_2.png","interieur_3.png"]
  },
  {
  "name":"Produits",
  "images":["produits_1.png","produits_2.png","produits_3.png"]
  },
]

function resetBtns(){
  active_btns=document.getElementsByClassName("carousel-nav-btn");
  active_rows=document.getElementsByClassName("carousel-nav-row");

  for (i=0;i<active_rows.length;i++){
     a=active_rows[i];
     a.setAttribute("style","background-color:blue");
  }
  for (i=0;i<active_btns.length;i++){
	   a=active_btns[i];
	   a.setAttribute("src","btn.png");
  }
}

function play(event){
  resetBtns();

  e=event.getAttribute("data-display");
  alert(event.parentNode.parentNode.getAttribute("class"));
  event.parentNode.parentNode.setAttribute("style","background-color:red")
  event.setAttribute("src","btn_active.png");
  c=document.getElementById("carousel-display");
  d=c.getElementsByTagName("img")[0];
  d.setAttribute("src",e);
}

function createCarouselNav(){
  carousel_nav=document.getElementById("carousel-nav");
  for (var i = 0; i < carousel.length; i++) {
//    carousel_nav.appendChild(document.createTextNode(carousel[i].index))
    carousel_row=createCarouselRow(i);
    carousel_nav.appendChild(carousel_row);
  }
}
function createCarouselRow(carousel_id){

  label=document.createElement("div");
  label.setAttribute("class","carousel-nav-label");
  t=document.createTextNode(carousel[carousel_id].name);
  label.appendChild(t);

  holder=document.createElement("div");
  holder.setAttribute("class","carousel-nav-label-holder");
  holder.appendChild(label);

  row=document.createElement("div");
  row.setAttribute("class","carousel-nav-row");

  btn_holder=document.createElement("div");
  btn_holder.setAttribute("class","carousel-nav-btn-holder");
  btn_holder.appendChild(holder);

  for (var i = 0; i < carousel[carousel_id].images.length; i++) {

    img=document.createElement("img");
    img.setAttribute("class","carousel-nav-btn");
    img.setAttribute("src","btn.png");

//******* TEST*******

//    js="alert('"+carousel[carousel_id].name+" -> "+carousel[carousel_id].images[i]+"')";
//    js="alert(this.getAttribute('data-display'))";
    js="play(this)";
    img.setAttribute("onclick",js);

    img.setAttribute("data-display",carousel[carousel_id].images[i]);
    btn_holder.appendChild(img);
  }

  row.appendChild(holder);
  row.appendChild(btn_holder);


  return row;
}
function main(){
  createCarouselNav();
}
