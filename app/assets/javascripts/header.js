/* Header script variables*/


var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum, neque a scelerisque tempus, quam ligula elementum massa, quis porta metus dui non dui. Aliquam pellentesque vel velit sed laoreet. Phasellus metus orci, volutpat et lacus a, commodo tempus turpis. Maecenas mi quam, varius id urna in, euismod laoreet eros. Ut hendrerit sem a maximus rhoncus. Donec pulvinar molestie nisi sit amet porta. Pellentesque sed diam id purus vulputate dictum a quis nisi. Duis consequat aliquet ultrices. Proin consectetur nisi vel leo ultrices, sed dictum lorem fringilla. Proin nec augue a quam blandit vestibulum. Donec ut dolor in turpis dictum suscipit. Nulla dignissim leo eu diam pellentesque, ac elementum risus maximus. Phasellus ut lorem mi. Sed in tincidunt elit. ".split("");

let divArray = document.getElementsByClassName("square");
let header = document.getElementsByTagName("header");
let overlay = document.getElementById("overlay")
let interval = 0;
let numOfDivs = window.innerWidth;



/* Header script */

//put divs to type in
window.addEventListener("load",function() {
  for ( let i = 1; i <= numOfDivs; i++){
    let newDiv = document.createElement('div');
    newDiv.className = "square";
    newDiv.style.height = "11px";
    newDiv.style.width = "8px";
    newDiv.style.color = "rgb(146,129,168)"
    newDiv.style.fontSize = "11px";
    newDiv.style.lineHeight = "0";
      newDiv.style.display = "inline-block";
      header[0].appendChild(newDiv);
      // console.log(newDiv)
  }
})


// typing animation
setInterval(function(){
  let previous = interval - 1;

  if (previous >= 0){
    //blicker
    divArray[interval].style.backgroundColor="rgba(146,129,168, 1.0)"
    // remove blinker
    divArray[previous].style.backgroundColor="rgba(146,129,168, 0.0)"
    // insert text
    divArray[previous].innerHTML = lorem[previous];
  } else {

    divArray[interval].style.backgroundColor="rgba(146,129,168, 1.0)"
  }

  interval++;
  if (interval == divArray.length) {
    for(let d in divArray) {
     divArray[d].innerHTML="";
     // divArray[d].style.backgroundColor="rgba(146,129,168, 0.0)"
    }
    interval = 0;
  }

}, 50);

