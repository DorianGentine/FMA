import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderLogo from "../../../components/render_logo"

class VosReponses extends Component {

  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const user = this.props.api.user

      const renderUsers = () => {
        // return users.map((user, index) => {
          let numUser = 0
          if(false){
            numUser = index
          }else{
            numUser = 1
          };
          return (
            <div className="flex space-between margin-bottom-30" key={user.id}>
              <div className="navbar-avatar margin-right-15" style={{ marginLeft: 0 }}>{renderInitiale(`${user.first_name} ${user.last_name}`)}</div>
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">Bénéficiaire {numUser}:</h4>
                <p className="font-12">{user.first_name} {user.last_name}</p>
              </div>
              <button className="blue-gray-btn">Voir les réponses</button>
            </div>
          );
        // });
      };

      return (
        <div className="col-lg-6">
          <div className="white-box flex flex-wrap">
            <h4 className="col-lg-12">Vos réponses</h4>
            <div className="scroll col-lg-12 align-items-center" style={{ height: "145px" }}>
              {renderUsers()}
            </div>
          </div>
        </div>
      );


    }else if(statut === "conseiller"){
      const clients = this.props.api.clients

      const renderClients = () => {
        return clients.map((client, index) => {
          return (
              // <div className="navbar-avatar" style={{ marginLeft: 0 }}></div>
            <div className="flex space-between margin-bottom-30" key={`${client.first_name}${client.last_name}`}>
              {renderLogo(client)}
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">{client.first_name} {client.last_name}</h4>
                <p className="font-12">{`${client.financers.length} financeurs | `}</p>
              </div>
              <button className="blue-gray-btn">Compléter</button>
            </div>
          );
        });
      };

      return (
        <div className="col-lg-6">
          <div className="white-box flex flex-wrap align-items-center">
            <h4 className="padding-horizontal-15 no-margin">Vos réponses</h4>
            <p className="bold font-12 padding-horizontal-15">{`${clients.length} en cours`}</p>
            <div className="scroll col-lg-12 align-items-center margin-top-15" style={{ height: "145px" }}>
              {renderClients()}
            </div>
          </div>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VosReponses);
