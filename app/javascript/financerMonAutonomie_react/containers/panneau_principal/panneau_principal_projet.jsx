import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import AppelsProgrammes from './appels_programmes'
import ClientsAdvisor from './clients_advisor';
import DemandesSpecifiques from './demandes_specifiques';
import DocumentsSoumettre from "./documents_soumettre"
import Financers from './financers'
import FinanceursPotentiels from "./financeurs_potentiels"
import KitDeFinancement from "./kit_financement"
import PanneauPrincipalForm from "./panneau_principal_form"
import Ressources from './ressources';
import VosReponses from "./vos_reponses"
import WidgetCalendly from "./widget_calendly"

class PanneauPrincipalProjet extends Component {
  render(){
    const statut = this.props.api.statut

    // App beneficiaire
      if(statut === "client"){
        const etape = this.props.project.project.etape
        if(etape.toLowerCase() == "validation_data"){
          return (
            <div className="row">
              <PanneauPrincipalForm selectedMenu={this.props.selectedMenu} />
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
            <Financers />
            <ClientsAdvisor />
            <Ressources />
          </div>
        );

    // App admin
      }else if(statut === "admin"){
        return (
          <div className="row">
            <DemandesSpecifiques />
            <Financers />
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
