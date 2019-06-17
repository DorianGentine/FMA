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
    const sticky = offsetCta - cta.offsetHeight + 60
    console.log(cta.offsetParent.offsetTop)
    console.log(cta.offsetTop)
    console.log(cta.offsetHeight)
    console.log(sticky)
    let answers
    let stopSticky
    setTimeout(()=>{
    answers = document.getElementById('financeurs-potentiels')
    stopSticky = answers.offsetHeight + 60 - cta.offsetHeight
    }, 500)

    // Add the sticky class to the cta when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction() {
      if (window.pageYOffset >= sticky && window.pageYOffset <= stopSticky) {
        cta.style.marginTop = `60px`
        cta.classList.add("sticky")
      }else if(window.pageYOffset >= stopSticky) {
        cta.style.marginTop = `${stopSticky - 60}px`
        cta.classList.remove("sticky");
      } else {
        cta.style.marginTop = `60px`
        cta.classList.remove("sticky");
      }
    }
  }
}
export default stickyCta
