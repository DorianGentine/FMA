import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// import { fetchClients, showDemande } from '../../actions'

import renderLogo from "../../../components/render_logo"

class AppelsProgrammes extends Component {
  render(){
    // const clients = this.props.clients

    const renderCalls = () => {
      if(false){
        return (
          <div className="text-align-center margin-top-15">Aucune demande en cours</div>
        )
      }else{
        // return clients.clients.map((client, index) => {
          return (
            <div className="flex margin-top-15 align-items-center">
              <p className="col-lg-2 font-12 bold black" style={{paddingLeft: 0}}>{"Diagnostic"}</p>
              <div className="col-lg-3 flex align-items-center">
                {renderLogo("Marine Charret")}
                <p className="bold font-12 black">{"Marine Charret"}</p>
              </div>
              <p className="col-lg-3 font-12 blue">{"Michel de Freimont"}</p>
              <p className="col-lg-2 font-12 black">{"30 minutes"}</p>
              <button className="col-lg-2 blue-gray-btn" style={{padding: "5px"}}>Voir&nbsp;la&nbsp;demande</button>
            </div>
          );
        // });
      }
    };


    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Demandes spécifiques</h4>
          <p className="padding-horizontal-15">
            {`${String(4).padStart(2, '0')}`}
          </p>
          <p className="
            padding-horizontal-15
            text-align-right
            font-12
            icon-arrow-right-gray
            flex-grow-1">
          </p>
          <div className="bordure-bas flex w-100" style={{margin: "15px 15px 0"}}>
            <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Catégorie</p>
            <p className="col-lg-3 font-12">Conseiller</p>
            <p className="col-lg-3 font-12">Bénéficiaire</p>
            <p className="col-lg-4 font-12" style={{paddingRight: 0}}>Envoyé il y a</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "120px" }}>
            {true ? renderCalls() : <p className="text-align-center margin-top-15">Chargement...</p> }
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

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchClients, showDemande }, dispatch);
// }

export default connect(mapStateToProps, null)(AppelsProgrammes);
