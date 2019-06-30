import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalRessource extends Component {
  render(){
    const advisor = this.props.modal_selected.advisor

    let step1 = 0
    let step2 = 0
    let step3 = 0
    let step4 = 0
    let step5 = 0
    let step6 = 0
    for (var i = advisor.clients.length - 1; i >= 0; i--) {
      if(advisor.clients[i].étape === "validation_data"){
        step1 = step1 + 1
      }else if(advisor.clients[i].étape === "documentation"){
        step2 = step2 + 1
      }else if(advisor.clients[i].étape === "meeting"){
        step3 = step3 + 1
      }else if(advisor.clients[i].étape === "call"){
        step4 = step4 + 1
      }else if(advisor.clients[i].étape === "progression"){
        step5 = step5 + 1
      }else if(advisor.clients[i].étape === "evaluation"){
        step6 = step6 + 1
      }
    }

    const renderClients = (etape) => {
      return advisor.clients.map((client, index) => {
        if(client.étape === etape){
          console.log('client', client)
          return(
            <div className="flex space-between align-items-center margin-top-15" key={index}>
              {renderLogo(client)}
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">{client.first_name} {client.last_name}</h4>
                <p className="font-12">{`${client.financeurs} financeurs`}</p>
              </div>
              <a href={client.id ? `/mon_espace/${client.id}/projet` : ""} className="blue-gray-btn">Voir profil</a>
            </div>
          )
        }
      })
    }

    const renderEtapes = (nb, etape) => {
      return (
        <div>
          <p className="black">{`Étape ${nb}`}</p>
          {renderClients(etape)}
          <hr className="ligne-horizontal gray-200-background"/>
        </div>
      )
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Les clients</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box flex-wrap margin-bottom-30 margin-top-30">
          {renderLogo(advisor)}
          <div className="flex-grow-1">
            <p className="font-12">Conseiller</p>
            <h4 className="black font-14 no-margin">{`${advisor.first_name} ${advisor.last_name}`}</h4>
          </div>
          <p className="margin-top-15 font-12">Dernière connexion il y a 30 minutes</p>
        </div>
        {step1 != 0 ? renderEtapes(1, "validation_data") : null}
        {step2 != 0 ? renderEtapes(2, "documentation") : null}
        {step3 != 0 ? renderEtapes(3, "meeting") : null}
        {step4 != 0 ? renderEtapes(4, "call") : null}
        {step5 != 0 ? renderEtapes(5, "progression") : null}
        {step6 != 0 ? renderEtapes(6, "evaluation") : null}

        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalRessource);
