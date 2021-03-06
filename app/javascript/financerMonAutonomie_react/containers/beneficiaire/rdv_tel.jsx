import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { displayCalendly } from "../../actions"

import ValidationModal from "./validation_modal"
import { renderDate } from "../../../components/render_date"

class RdvTel extends Component {
  render(){
    const statut = this.props.api.statut

    // App beneficiaire
      if(statut === "client"){
        const etape = this.props.project.project.etape
        let rdvText = ""
        let rdvTitre = "Accédez à votre calendrier"
        if(etape === "validation_data" || etape === "documentation"){
          rdvText = "Fixez votre RDV à l'étape 3"
        }else if(etape === "meeting"){
          rdvText = "Fixez votre rendez-vous ici"
        }else if(etape === "call"){
          rdvTitre = "Votre rendez-vous aura lieu"
          rdvText = renderDate(this.props.project.project.rdv, "ddd_mmm_hhhh")
        }else if(etape === "progression" || etape === "evaluation" || etape === "archived"){
          rdvTitre = "Rendez-vous effectué le"
          rdvText = renderDate(this.props.project.project.rdv, "ddd_mmm_hhhh")
        }

        const handleCalendly = () => {
          this.props.displayCalendly(this.props.stateCalendly)
        }

        return (
          <div className="relative">
            <div className={`margin-top-30 blue-gray-box ${etape != "meeting" ? "not-allowed" : ""}`} onClick={ etape === "meeting" ? ()=>{handleCalendly()} : ()=>{} }>
              <div className="icon-calendar"></div>
              <p className="rdv-tel-text">{rdvTitre} <br/><strong>{rdvText}</strong></p>
              <div className="icon-arrow"></div>
            </div>
            {etape === "meeting" ? <ValidationModal /> : null}
          </div>
        );

    // App conseiller
      }else if(statut === "conseiller" || statut === "admin"){
        return (
          <div className="margin-top-30 blue-gray-box relative" onClick={()=>{document.getElementById('link_advisor').click()}}>
            <div className="icon-calendar"></div>
            <p className="rdv-tel-text">Accédez à l'ensemble du calendrier <br/><strong>Voir mon calendrier</strong></p>
            <div className="icon-arrow"></div>
            <a
              href={this.props.api.frameworks ? this.props.api.frameworks[0].url : "#"}
              target="_blank"
              className="d-none"
              id="link_advisor">
            </a>
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

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ displayCalendly }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RdvTel);
