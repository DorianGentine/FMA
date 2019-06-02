import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import ValidationModal from "./validation_modal"

class RdvTel extends Component {
  render(){
    const etape = this.props.etape
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
  }
};

function mapStateToProps(state) {
  return {
    etape: state.api.project.etape,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(RdvTel);
