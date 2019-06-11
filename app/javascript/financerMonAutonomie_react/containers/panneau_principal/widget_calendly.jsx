import React, { Component } from 'react';

class WidgetCalendly extends Component {
  componentDidMount() {
    const head = document.querySelector('head');
    const script = document.createElement('script');
    script.setAttribute('src',  'https://assets.calendly.com/assets/external/widget.js');
    head.appendChild(script);

  }

  render(){
    return(
      <div>
        <div
          className="calendly-inline-widget"
          data-url="https://calendly.com/adrienfma/1er-rdv-telephonique"
          style={{ minWidth: "100%", height: "calc(100vh - 110px" }}>
        </div>
        <script type="text/javascript" src="https://assets.calendly.com/assets/external/widget.js"></script>
      </div>
    )
  }
}

export default WidgetCalendly
