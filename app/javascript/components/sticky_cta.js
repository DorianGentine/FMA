const stickyCta = (data) => {
  console.log('launched', data)
  // Get the cta
  const cta = document.getElementById("blue-CTA");
  if(cta){
    // When the user scrolls the page, execute myFunction
    window.onscroll = function() {myFunction()};

    // Get the offset position of the cta
    let x = 0
    const offsetCta = cta.offsetParent.offsetTop + cta.offsetTop;
    const sticky = window.innerHeight - offsetCta
    console.log(sticky)
    let answers
    let stopSticky
    setTimeout(()=>{
    answers = document.getElementById('financeurs-potentiels')
    stopSticky = answers.offsetHeight + x - cta.offsetHeight
    }, 500)

    // Add the sticky class to the cta when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction() {
      if (window.pageYOffset >= sticky && window.pageYOffset <= stopSticky) {
        cta.style.marginTop = `60px`
        cta.classList.add("sticky")
      }else if(window.pageYOffset >= stopSticky) {
        cta.style.marginTop = `${stopSticky - x}px`
        cta.classList.remove("sticky");
      } else {
        cta.style.marginTop = `60px`
        cta.classList.remove("sticky");
      }
    }
  }
}
export default stickyCta
