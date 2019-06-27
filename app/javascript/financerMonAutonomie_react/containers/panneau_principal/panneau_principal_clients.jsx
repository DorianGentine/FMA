import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchClients, selectClients } from '../../actions';

import CardClient from './card_client';

class PanneauPrincipalClients extends Component {
  componentWillMount(){
    if(this.props.selectedMenu === "clients"){
      this.props.fetchClients("/api/v1/users")
    }else if(this.props.selectedMenu === "conseillers"){
      this.props.fetchClients("/api/v1/advisors")
    }
  }

  componentWillReceiveProps(nextProps){
    if(nextProps.selectedMenu === "clients" && this.props.selectedMenu != nextProps.selectedMenu){
      this.props.fetchClients("/api/v1/users")
    }else if(nextProps.selectedMenu === "conseillers" && this.props.selectedMenu != nextProps.selectedMenu){
      this.props.fetchClients("/api/v1/advisors")
    }
  }

  render(){
    const clients = this.props.clients
    let conseillersTrue = false
    if(this.props.selectedMenu === "conseillers"){
      conseillersTrue = true
    }

    const renderClients = () => {
      return clients.clients.map((client, index) => {
        return <CardClient client={client} key={client.id}/>
      })
    }

    const options = [
      { name: "Sélectionnez une étape", value: "", key: 0, },
      { name: "Etape 1", value: "1", key: 1, },
      { name: "Etape 2", value: "2", key: 2, },
      { name: "Etape 3", value: "3", key: 3, },
      { name: "Etape 4", value: "4", key: 4, },
      { name: "Etape 5", value: "5", key: 5, },
      { name: "Étape 6", value: "6", key: 6, },
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
              onChange={()=>{this.props.selectClients(event.target.value)}}
            />
          </div>
          <div className="col-lg-4 offset-lg-4">
            <Select
              className="react-dropdown-select"
              options={options}
              valueField="value"
              values={[options.find(opt => opt.name === "Sélectionnez une étape")]}
              // onChange={console.log(value)}
              onChange={(value) => {this.props.selectClients(value[0].value)}}
              labelField="name"
            />
          </div>
        </div>
        { conseillersTrue ? null :
          <div className="margin-top-30 margin-bottom-30 flex align-items-center">
            <hr className="ligne-horizontal"/>
            <div
              className="font-14 black blue-gray-background flex-grow-1 text-align-center"
              style={{ width: "100%" }}>
              Etape 1 : Confirmation des réponses
            </div>
            <hr className="ligne-horizontal"/>
          </div>
        }
        <div className={`row ${conseillersTrue ? "margin-top-30" : "" }`}>
          {clients != null ? renderClients() : <h2 className="text-align-center">Chargement...</h2>}
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
