import React, { Component } from 'react';

class WidgetCalendly extends Component {
  componentDidMount() {
    const head = document.querySelector('head');
    const script = document.createElement('script');
    script.setAttribute('src',  'https://assets.calendly.com/assets/external/widget.js');
    head.appendChild(script);
  }

  render(){
    const legacy_branding = document.getElementsByClassName("legacy-branding")
    console.log(legacy_branding)
    if(legacy_branding){
      for (var i = legacy_branding.length - 1; i >= 0; i--) {
        legacy_branding[i].style.display = "none"
      }
    }

    return(
      <div>
        <div
          className="calendly-inline-widget"
          data-url="https://calendly.com/donatien-rolland/rdv-telephonique"
          style={{ minWidth: "100%", height: "calc(100vh - 110px" }}>
        </div>
        <script type="text/javascript" src="https://assets.calendly.com/assets/external/widget.js"></script>
      </div>
    )
  }
}

export default WidgetCalendly
