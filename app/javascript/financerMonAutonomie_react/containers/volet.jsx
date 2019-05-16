import React, { Component } from 'react';

import VoletProjet from "./Volet/volet_projet"
import VoletCompte from "./Volet/volet_compte"

class Volet extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <VoletProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <VoletCompte selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <div className="menu-principal">
            <h2 className="text-align-center">{selectedMenu}</h2>
          </div>
        </div>
      );
    }
  }
};

export default Volet;
