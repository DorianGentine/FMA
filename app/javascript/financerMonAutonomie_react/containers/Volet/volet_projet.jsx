import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import ApercuProjet from "../beneficiaire/apercu_projet"
import Conseiller from "../beneficiaire/conseiller"
import Etapes from "../beneficiaire/etapes"
import Evaluation from "../beneficiaire/evaluation"
import MonActualite from "../conseiller/mon_actualite"
import MonEquipe from "../admin/mon_equipe"
import Notes from "../conseiller/notes"
import RdvTel from "../beneficiaire/rdv_tel"


class VoletProjet extends Component {
  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      return(
        <div className="space-between">
          <Conseiller />
          <Etapes />
          {this.props.otherUser ? <Notes /> : <RdvTel />}
          <ApercuProjet />
          <Evaluation />
        </div>
      )

    }else if(statut === "conseiller"){
      return(
        <div className="space-between">
          <Conseiller />
          <ApercuProjet />
          <RdvTel />
          <MonActualite />
        </div>
      )

    }else if(statut === "admin"){
      return(
        <div className="space-between">
          <Conseiller />
          <MonActualite />
          <MonEquipe />
        </div>
      )
    }
  }
}

function mapStateToProps(state) {
  return {
    api: state.api,
    project: state.project,
    otherUser: state.otherUser,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VoletProjet);
