import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchClients, showClient } from '../../actions'

import renderLogo from "../../../components/render_logo"

class ClientsAdvisor extends Component {
  componentWillMount(){
    this.props.fetchClients("/api/v1/users")
  }

  render(){
    const clients = this.props.clients

    const renderClients = () => {
      let clientsStep5 = 0
      for (var i = clients.clients.length - 1; i >= 0; i--) {
        if(clients.clients[i].étape === "progression"){
          clientsStep5 = clientsStep5 + 1
        }
      }
      if(clientsStep5 === 0){
        return (
          <div className="text-align-center">Aucun kit à renseigner</div>
        )
      }else{
        return clients.clients.map((client, index) => {
          if(client.étape === "progression"){
            return (
              <div className="flex space-between margin-bottom-15" key={index}>
                {renderLogo(client)}
                <div className="flex-grow-1">
                  <h4 className="font-12 no-margin">{client.first_name} {client.last_name}</h4>
                </div>
                <button className="blue-gray-btn" onClick={()=>{this.props.showClient(client)}}>Compléter</button>
              </div>
            );
          }else{ return null }
        });
      }
    };

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Élaboration de kit</h4>
          <p className="blue font-12 padding-horizontal-15" style={{paddingLeft: "unset"}}>{`${clients != null ?  clients.clients.length : 0} en cours`}</p>
          <p className="margin-right-15 text-align-right font-12 icon-arrow-right-gray flex-grow-1"></p>
          <div className="scroll col-lg-12 align-items-center margin-top-15" style={{ height: "145px" }}>
            {clients != null ? renderClients() : <h2>Chargement...</h2> }
          </div>
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    clients: state.clients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchClients, showClient }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ClientsAdvisor);
