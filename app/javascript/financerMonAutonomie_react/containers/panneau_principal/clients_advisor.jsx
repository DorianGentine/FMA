import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchClients, showClient } from '../../actions'

import renderLogo from "../../../components/render_logo"

class ClientsAdvisor extends Component {
  constructor(props) {
    super(props)
    this.state = {
      clients: this.props.clients,
    };
  }

  componentWillMount(){
    if(!this.props.clients){
      this.props.fetchClients("/api/v1/users")
    }
  }

  componentWillReceiveProps(nextProps){
    this.setState({ clients: nextProps.clients })
  }

  render(){
    const clients = this.state.clients

    const renderClients = (clientsStep5) => {
      if(clientsStep5 === 0){
        return (
          <div className="text-align-center">Aucun kit à renseigner</div>
        )
      }else{
        return clients.clients.map((client, index) => {
          if(client.étape === "progression"){
            return (
              <div className="flex space-between align-items-center margin-bottom-15" key={index}>
                {renderLogo(client)}
                <h4 className="flex-grow-1 font-12 no-margin">{client.first_name} {client.last_name}</h4>
                <button className="blue-gray-btn" onClick={()=>{this.props.showClient(client)}}>Compléter</button>
              </div>
            );
          }else{ return null }
        });
      }
    };

    let clientsStep5 = 0
    if(clients != null){
      for (var i = clients.clients.length - 1; i >= 0; i--) {
        if(clients.clients[i].étape === "progression"){
          clientsStep5 = clientsStep5 + 1
        }
      }
    }

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Élaboration de kit</h4>
          <p className="gray font-12 padding-horizontal-15" style={{paddingLeft: "unset"}}>{`${clientsStep5} en cours`}</p>

          <div className="scroll col-lg-12 align-items-center margin-top-15" style={{ height: "145px" }}>
            {clients != null ? renderClients(clientsStep5) : <p className="text-align-center margin-top-15">Chargement...</p> }
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
