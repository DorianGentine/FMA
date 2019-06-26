import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal, validateStep, showClient } from '../../actions';

import renderLogo from "../../../components/render_logo"

import Switch from "./switch"

class ModalClient extends Component {

  componentWillReceiveProps(nextProps){
    const clients = nextProps.clients
    console.log(clients)
    if(clients != this.props.clients){
      const client = this.props.modal_selected.client
      this.props.showClient(client)
    }
  }

  handleClick = (clientId) => {
    this.props.validateStep(`/api/v1/projects/${clientId}/next_setp`, ()=>{})
    this.props.closeModal()
  }

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
                    <h4 className="font-12 no-margin">{ressource.id}</h4>
                    <p className="font-12">{"Description de la ressource"}</p>
                  </div>
                  <Switch checked={true} kind="switchKit" ressource={ressource} kit={client.kits[i]} />
                </div>
                    // <h4 className="font-12 no-margin">{ressource.notice.substr(ressource.notice.lastIndexOf('/') + 1, 20)}</h4>
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
                  <h4 className="font-12 no-margin">{ressource.id}</h4>
                  <p className="font-12">{"Description de la ressource"}</p>
                </div>
                <Switch checked={false} kind="switchKit" ressource={ressource} kit={kitSelected} />
              </div>
                  // <h4 className="font-12 no-margin">{ressource.notice.substr(ressource.notice.lastIndexOf('/') + 1, 20)}</h4>
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
        <div className="scroll" style={{ maxHeight: "calc(100vh - 390px)"}}>
          {ressources != null ? renderRessources(true) : <h2>Chargement...</h2>}
          <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
          {ressources != null ? renderRessources(false) : <h2>Chargement...</h2>}
        </div>
        <button className="btn-blue margin-top-30 col-8 offset-2 text-align-center" onClick={()=>{this.handleClick(client.project)}}>Valider ce kit</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    ressources: state.ressources,
    clients: state.clients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, validateStep, showClient }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalClient);
