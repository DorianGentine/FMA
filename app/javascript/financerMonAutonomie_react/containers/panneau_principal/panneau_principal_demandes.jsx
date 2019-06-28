import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchClients, selectClients } from '../../actions';

import CardDemande from './card_demande';

class PanneauPrincipalDemandes extends Component {
  componentWillMount(){
    this.props.fetchClients("/api/v1/requests")
  }

  render(){
    const clients = this.props.clients

    const renderDemandes = (clients) => {
      if(clients != null && clients.clients != undefined){
        // return demandes.map((client, index) => {
          return <CardDemande client={clients.clients[0]} />
        // })
      }
    }

    const options = [
      { name: "Sélectionnez une ???", value: "", key: 0, },
      { name: "Diagnostic", value: "1", key: 1, },
      { name: "Devis", value: "2", key: 2, },
    ]

    return (
      <div className="margin-top-15">
        <div className="row">
          <div className="input-wth-icon search-app col-lg-4">
            <i className="fas fa-search"></i>
            <input
              type="text"
              placeholder="Nom ou prénom du client"
              style={{width: "100%"}}
              // onChange={()=>{this.props.selectClients(event.target.value)}}
            />
          </div>
          <div className="col-lg-4 offset-lg-4">
            <Select
              className="react-dropdown-select"
              options={options}
              valueField="value"
              values={[options.find(opt => opt.name === "Sélectionnez une ???")]}
              // onChange={(value) => {this.props.selectClients(value[0].value)}}
              labelField="name"
            />
          </div>
        </div>
        <div className="margin-top-30 margin-bottom-30 flex align-items-center">
          <hr className="ligne-horizontal"/>
          <div
            className="font-14 black blue-gray-background flex-grow-1 text-align-center"
            style={{ width: "100%" }}>
            Diagnostic
          </div>
          <hr className="ligne-horizontal"/>
        </div>
        <div className="row">
          {clients != null ? renderDemandes(clients) : <h2>Chargement...</h2>}
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

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalDemandes);
