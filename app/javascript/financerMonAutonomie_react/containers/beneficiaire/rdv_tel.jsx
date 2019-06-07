import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import ValidationModal from "./validation_modal"

class RdvTel extends Component {
  render(){
    const statut = this.props.api.statut

    // App beneficiaire
      if(statut === "client"){
        const etape = this.props.api.project.etape
        let rdvText = ""
        if(etape === "validation_data" || etape === "documentation"){
          rdvText = "Fixez votre RDV à l'étape 3"
        }else if(etape === "meeting"){
          rdvText = "Fixez votre rendez-vous ici"
        }else if(etape === "call"){
          rdvText = "TODO: Insérer date RDV"
        }

        return (
          <div className="margin-top-30 blue-gray-box relative">
            <div className="icon-calendar"></div>
            <p className="rdv-tel-text">Accédez à votre calendrier <br/><strong>{rdvText}</strong></p>
            <div className="icon-arrow"></div>
            {etape === "meeting" ? <ValidationModal /> : null}
          </div>
        );

    // App conseiller
      }else if(statut === "conseiller"){
        return (
          <div className="margin-top-30 blue-gray-box relative">
            <div className="icon-calendar"></div>
            <p className="rdv-tel-text">Accédez à l'ensemble du calendrier <br/><strong>Voir mon calendrier</strong></p>
            <div className="icon-arrow"></div>
          </div>
        );
      }

  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(RdvTel);
