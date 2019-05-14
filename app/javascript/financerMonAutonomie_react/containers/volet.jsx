import React, { Component } from 'react';

import Conseiller from "../containers/conseiller"
import Etapes from "../containers/etapes"
import RdvTel from "../containers/rdv_tel"
import ApercuProjet from "../components/apercu_projet"
import Evaluation from "../containers/evaluation"

class Volet extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div className="menu-principal">
          <Conseiller />
          <Etapes />
          <RdvTel />
          <ApercuProjet />
          <Evaluation />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div className="menu-principal">
          <h1>{selectedMenu}</h1>
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div className="menu-principal">
          <h1>{selectedMenu}</h1>
        </div>
      );
    }
  }
};

export default Volet;
