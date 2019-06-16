import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchClients, selectClients } from '../../actions';

import CardClient from './card_client';

class PanneauPrincipalClients extends Component {
  componentWillMount(){
    this.props.fetchClients("/api/v1/users")
  }

  render(){
    const clients = this.props.clients

    const renderClients = () => {
      return clients.clients.map((client, index) => {
        return <CardClient client={client} key={client.id}/>
      })
    }

    return (
      <div className="margin-top-15">
        <div className="row">
          <div className="input-wth-icon search-app col-lg-4">
            <i className="fas fa-search"></i>
            <input
              type="text"
              placeholder="Nom ou prénom du client"
              style={{width: "100%"}}
              onChange={()=>{this.props.selectClients(event.target.value)}}
            />
          </div>
          <div className="col-lg-4 offset-lg-4">
            <select className="selectize-input" onChange={()=>{this.props.selectClients(event.target.value)}}>
              <option value="">Sélectionnez une étape</option>
              <option value="1">Etape 1</option>
              <option value="2">Etape 2</option>
              <option value="3">Etape 3</option>
              <option value="4">Etape 4</option>
              <option value="5">Etape 5</option>
              <option value="6">Étape 6</option>
            </select>
          </div>
        </div>
        <div className="margin-top-30 margin-bottom-30 flex align-items-center">
          <hr className="ligne-horizontal"/>
          <div
            className="font-14 black blue-gray-background flex-grow-1 text-align-center"
            style={{ width: "100%" }}>
            Etape 1 : Confirmation des réponses
          </div>
          <hr className="ligne-horizontal"/>
        </div>
        <div className="row">
          {clients != null ? renderClients() : <h2>Chargement...</h2>}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    clients: state.clients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchClients, selectClients }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalClients);
