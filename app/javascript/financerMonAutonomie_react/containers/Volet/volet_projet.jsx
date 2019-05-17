import React, { Component } from 'react';

import Conseiller from "../beneficiaire/conseiller"
import Etapes from "../beneficiaire/etapes"
import RdvTel from "../beneficiaire/rdv_tel"
import ApercuProjet from "../beneficiaire/apercu_projet"
import Evaluation from "../beneficiaire/evaluation"

class VoletProjet extends Component {
  render(){
    return(
      <div className="menu-principal space-between">
        <Conseiller />
        <Etapes />
        <RdvTel />
        <ApercuProjet />
        <Evaluation />
      </div>
    )
  }
}

export default (VoletProjet);
