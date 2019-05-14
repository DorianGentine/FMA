import React, { Component } from 'react';

import DocumentsSoumettre from "../containers/documents_soumettre"
import FinanceursPotentiels from "../containers/financeurs_potentiels"
import VosReponses from "../containers/vos_reponses"
import KitDeFinancement from "../containers/kit_financement"

class PanneauPrincipal extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    return (
      <div className="row">
        <DocumentsSoumettre />
        <FinanceursPotentiels />
        <VosReponses />
        <KitDeFinancement />
      </div>
    );
  }
};

export default PanneauPrincipal;
