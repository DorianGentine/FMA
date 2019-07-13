const stickyCta = (data) => {
  // Get the cta
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
    // const div = document.createElement('div')
    // div.classList = `red-background absolute`
    // div.style = `width: 50px;
    //   height: ${offsetCta}px;
    //   top: 0;
    //   left: 750px;
    //   z-index: 30;`
    // document.getElementById('TESTZZ').appendChild(div)

    // const div2 = document.createElement('div')
    // div2.classList = `green-background absolute`
    // div2.style = `width: 50px;
    //   height: ${answers.offsetHeight}px;
    //   top: ${offsetCta}px;
    //   left: 750px;
    //   z-index: 32;`
    // document.getElementById('TESTZZ').appendChild(div2)

    // const div3 = document.createElement('div')
    // div3.classList = `blue-background fixed`
    // div3.style = `width: 800px;
    //   height: 3px;
    //   top: calc(50% + ${ctaOffsetHeight2}px);
    //   transform: translateY(-100%);
    //   left: 0px;
    //   z-index: 32;`
    // document.getElementById('TESTZZ').appendChild(div3)

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
export default stickyCta
