import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Conseiller from "../beneficiaire/conseiller"
import Etapes from "../beneficiaire/etapes"
import RdvTel from "../beneficiaire/rdv_tel"
import Notes from "../conseiller/notes"
import ApercuProjet from "../beneficiaire/apercu_projet"
import Evaluation from "../beneficiaire/evaluation"
import MonActualite from "../conseiller/mon_actualite"


class VoletProjet extends Component {
  render(){
    const statut = this.props.api.statut

    const encartTel = ()=>{
      if(this.props.otherUser){
        return <Notes />
      }else if(statut === "client"){
        return <RdvTel />
      }else if(statut === 'conseiller'){
        return <ApercuProjet />
      }
    }

    return(
      <div className="space-between">
        <Conseiller />
        {statut === "client" ? <Etapes /> : null}
        {encartTel()}
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
    otherUser: state.otherUser,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VoletProjet);
