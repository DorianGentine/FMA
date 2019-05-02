
function navbar(){
  const navbar = document.getElementById('navbar')
  if(navbar){
    window.addEventListener("scroll", function (event) {
      var scroll = this.scrollY;
      if (scroll == 0) {
        navbar.style.backgroundColor = "transparent";
        navbar.style.boxShadow = "none";
      } else {
        navbar.style.backgroundColor = "white";
        navbar.style.boxShadow = "0px 10px 61px 0px rgba(42, 54, 84, 0.1)";
      }
    });
  }
}

export { navbar };
