import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal, fetchPostCompte } from '../../actions';

import renderLogo from "../../../components/render_logo"

import SwitchKit from "./switch_kit"

class ModalClient extends Component {

  render(){
    const client = this.props.modal_selected.client
    const ressources = this.props.ressources

    const renderRessources = (checked) => {
      return ressources.map((ressource, index) => {
        if(checked){
          for (var i = client.kits.length - 1; i >= 0; i--) {
            if(ressource.id === client.kits[i].ressource){
              return (
                <div className="flex space-between align-items-center margin-bottom-15" key={index}>
                  <div className="flex-grow-1">
                    <h4 className="font-12 no-margin">{ressource.notice.substr(ressource.notice.lastIndexOf('/') + 1, 20)}</h4>
                    <p className="font-12">{"Description de la ressource"}</p>
                  </div>
                  <SwitchKit checked={true} ressource={ressource} kit={client.kits[i]} />
                </div>
              );
            }
          }
        }else{
          let ressourcesChecked = []
          for (var i = client.kits.length - 1; i >= 0; i--) {
            ressourcesChecked.push(client.kits[i].ressource)
          }
          if(!ressourcesChecked.includes(ressource.id)){
            let kitSelected
            for (var i = client.kits.length - 1; i >= 0; i--) {
              if(ressource.id === client.kits[i].ressource){
                kitSelected = client.kits[i]
                console.log(kitSelected)
              }
            }
            return (
              <div className="flex space-between align-items-center margin-bottom-15" key={index}>
                <div className="flex-grow-1">
                  <h4 className="font-12 no-margin">{ressource.notice.substr(ressource.notice.lastIndexOf('/') + 1, 20)}</h4>
                  <p className="font-12">{"Description de la ressource"}</p>
                </div>
                <SwitchKit checked={false} ressource={ressource} kit={kitSelected} />
              </div>
            );
          }
        }
      });
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Elaboration de kit</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box align-text-center vertical margin-bottom-30 margin-top-30">
          <div className="margin-bottom-15" style={{marginRight: "-15px"}}>{renderLogo(client)}</div>
          <h4 className="black">{`${client.first_name}${client.last_name ? ` ${client.last_name}` : ""}`}</h4>
        </div>
        {ressources != null ? renderRessources(true) : <h2>Chargement...</h2>}
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
        {ressources != null ? renderRessources(false) : <h2>Chargement...</h2>}
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Valider ce kit</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    ressources: state.ressources,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalClient);
