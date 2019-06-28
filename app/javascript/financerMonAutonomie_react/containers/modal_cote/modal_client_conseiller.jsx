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
          return(
            <div className="flex space-between align-items-center margin-top-15" key={index}>
              {renderLogo(client)}
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">{client.first_name} {client.last_name}</h4>
                <p className="font-12">{`${client.financeurs} financeurs`}</p>
              </div>
              <a href={`${client.url ? client.url : ""}/projet`} className="blue-gray-btn" onClick={()=>{this.props.showClient(client)}}>Voir profil</a>
            </div>
          )
        }
      })
    }

    const renderEtapes = () => {
      if(step1 != 0){
        return (
          <div>
            <p className="black">Etape 1</p>
            {renderClients("validation_data")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }

      if(step2 != 0){
        return (
          <div>
            <p className="black">Etape 2</p>
            {renderClients("documentation")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }

      if(step3 != 0){
        return (
          <div>
            <p className="black">Etape 3</p>
            {renderClients("meeting")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }

      if(step4 != 0){
        return (
          <div>
            <p className="black">Etape 4</p>
            {renderClients("call")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }

      if(step5 != 0){
        return (
          <div>
            <p className="black">Etape 5</p>
            {renderClients("progression")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }

      if(step6 != 0){
        return (
          <div>
            <p className="black">Étape 6</p>
            {renderClients("evaluation")}
            <hr className="ligne-horizontal gray-200-background"/>
          </div>
        )
      }
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
        {renderEtapes()}
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
