import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal, validateStep, showClient, fetchClients, fetchAPI } from '../../actions';

import renderLogo from "../../../components/render_logo"

import Switch from "./switch"

class ModalKit extends Component {
  constructor(props) {
    super(props)
    this.state = {
      client: this.props.modal_selected.client,
    };
  }

  componentWillReceiveProps(nextProps){
    const idClient = this.props.modal_selected.client.id

    let newKits
    const oldKits = this.props.modal_selected.client.kits

    let clientSelected
    const clients = nextProps.clients.clients
    for (var i = clients.length - 1; i >= 0; i--) {
      if(clients[i].id === idClient){
        clientSelected = clients[i]
        newKits = clients[i].kits
      }
    }

    if(oldKits != newKits){
      this.setState({ client: clientSelected })
    }
  }

  handleClick = (clientId) => {
    this.props.validateStep(`/api/v1/projects/${clientId}/next_setp`, ()=>{
      this.props.fetchClients("/api/v1/users")
      this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)
    })
    this.props.closeModal()
  }

  render(){
    const client = this.state.client
    const ressources = this.props.ressources

    const renderRessources = (checked) => {
      return ressources.map((ressource, index) => {
        if(checked){
          for (var i = client.kits.length - 1; i >= 0; i--) {
            if(ressource.id === client.kits[i].ressource){
              return (
                <div className="flex space-between align-items-center margin-bottom-15" key={index}>
                  <div className="flex-grow-1">
                    <h4 className="font-12 no-margin">{ressource.title}</h4>
                    <p className="font-12">{ressource.description}</p>
                  </div>
                  <Switch checked={true} kind="switchKit" ressource={ressource} kit={client.kits[i]} />
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
                  <h4 className="font-12 no-margin">{ressource.title}</h4>
                  <p className="font-12">{ressource.description}</p>
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
    user_id: state.user_id,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, validateStep, showClient, fetchClients, fetchAPI }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalKit);
