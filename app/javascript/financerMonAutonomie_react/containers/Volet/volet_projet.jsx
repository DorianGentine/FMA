import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Conseiller from "../beneficiaire/conseiller"
import Etapes from "../beneficiaire/etapes"
import RdvTel from "../beneficiaire/rdv_tel"
import ApercuProjet from "../beneficiaire/apercu_projet"
import Evaluation from "../beneficiaire/evaluation"
import MonActualite from "../conseiller/mon_actualite"


class VoletProjet extends Component {
  render(){
    const statut = this.props.api.statut
    return(
      <div className="space-between">
        <Conseiller />
        {statut === "client" ? <Etapes /> : null}
        {statut === "client" ? <RdvTel /> : <ApercuProjet />}
        {statut === "client" ? <ApercuProjet /> : <RdvTel />}
        {statut === "client" ? <Evaluation /> : null}
        {statut === "client" ? null : <MonActualite />}
      </div>
    )
  }
        // import ValidationModal from "../beneficiaire/validation_modal"
        // {etape === "evaluation" ? <ValidationModal /> : null}
}

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VoletProjet);
