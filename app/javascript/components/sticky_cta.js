const stickyCta = (data) => {
  // Get the cta
  if( !/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
    const cta = document.getElementById("blue-CTA");
    if(cta){
      // When the user scrolls the page, execute myFunction
      window.onscroll = function() {myFunction()};

      // Get the offset position of the cta
      const offsetCta = cta.offsetParent.offsetTop
      var hWindow2 = (window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight)/2
      var ctaOffsetHeight2 = (cta.offsetHeight)/2
      const sticky = offsetCta + ctaOffsetHeight2 - hWindow2

      let answers
      let stopSticky
      setTimeout(()=>{
      answers = document.getElementById('financeurs-potentiels')
      stopSticky = offsetCta + answers.offsetHeight - hWindow2 - ctaOffsetHeight2
      }, 500)

      // Add the sticky class to the cta when you reach its scroll position. Remove "sticky" when you leave the scroll position
      function myFunction() {
        if (window.pageYOffset >= sticky && window.pageYOffset < stopSticky) {
          cta.style.marginTop = `0px`
          cta.classList.add("sticky")
        }else if(window.pageYOffset >= stopSticky) {
          cta.style.marginTop = `${answers.offsetHeight - cta.offsetHeight}px`
          cta.classList.remove("sticky");
        } else {
          cta.style.marginTop = `0px`
          cta.classList.remove("sticky");
        }
      }
    }
  }
}
export default stickyCta
