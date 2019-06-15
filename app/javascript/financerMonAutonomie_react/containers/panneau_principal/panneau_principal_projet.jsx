import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import DocumentsSoumettre from "./documents_soumettre"
import FinanceursPotentiels from "./financeurs_potentiels"
import VosReponses from "./vos_reponses"
import KitDeFinancement from "./kit_financement"
import PanneauPrincipalForm from "./panneau_principal_form"
import WidgetCalendly from "./widget_calendly"
import AppelsProgrammes from './appels_programmes'
import Ressources from './ressources';
import ClientsAdvisor from './clients_advisor';

class PanneauPrincipalProjet extends Component {
  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const etape = this.props.project.project.etape

    // App beneficiaire
      if(etape.toLowerCase() == "validation_data"){
        return (
          <div className="row">
            <PanneauPrincipalForm />
          </div>
        );
      }else if(!this.props.stateCalendly){
        return (
          <div className="row panneau_projet">
            <DocumentsSoumettre />
            <FinanceursPotentiels />
            <VosReponses />
            { etape === "progression" || etape === "evaluation" ?
              <KitDeFinancement /> : null
            }
          </div>
        );
      }else{
        return <WidgetCalendly />
      }

  // App conseiller
    }else if(statut === "conseiller"){
      return (
        <div className="row">
          <AppelsProgrammes />
          <FinanceursPotentiels />
          <ClientsAdvisor />
          <Ressources />
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    project: state.project,
    stateCalendly: state.stateCalendly,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(mapStateToProps, null)(PanneauPrincipalProjet);
