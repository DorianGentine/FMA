import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showClientConseiller } from '../../actions'

import renderLogo from "../../../components/render_logo"

class CardClient extends Component {
  render(){
    const advisor = this.props.advisor
    const selectedClients = this.props.selectedClients

    let clientsEnCours = 0
    let kitEnCours = 0
    let clientsArchives = 0
    for (var i = advisor.clients.length - 1; i >= 0; i--) {
      if(advisor.clients[i].étape != "evaluation"){
        clientsEnCours = clientsEnCours + 1
      }else if(advisor.clients[i].étape === "evaluation"){
        clientsArchives = clientsArchives + 1
      }
      if(advisor.clients[i].étape === "progression"){
        kitEnCours = kitEnCours + 1
      }
    }


    const fullName = `${advisor.first_name} ${advisor.last_name}`
    if(selectedClients === "tous" ||
      fullName.toLowerCase().includes(selectedClients.toLowerCase()) ){
      return(
        <div className="col-lg-4 col-xs-12 col-sm-6">
          <div className="white-box" style={{padding: "20px"}}>
            <div className="row">
              <div className="col-lg-6 margin-bottom-15">{renderLogo(advisor)}</div>

              <div className="col-lg-12 font-14 black bold">{fullName}</div>

              <div className="col-lg-12 margin-bottom-30 blue font-12">{`${0} demandes spécifiques`}</div>

              <div className="col-lg-6 font-12 gray-300">Clients total:</div>
              <div className="col-lg-6 text-align-right font-12 black">{advisor.clients.length}</div>
              <div className="col-lg-6 font-12 gray-300">En cours:</div>
              <div className="col-lg-6 text-align-right font-12 black">{clientsEnCours}</div>
              <div className="col-lg-6 font-12 gray-300">Kit en cours:</div>
              <div className="col-lg-6 text-align-right font-12 black">{kitEnCours}</div>
              <div className="col-lg-6 font-12 gray-300">Archivés:</div>
              <div className="col-lg-6 text-align-right font-12 black">{clientsArchives}</div>
              <div className="col-lg-6 font-12 gray-300">Actif il y a:</div>
              <div className="col-lg-6 text-align-right font-12 black">{`30 minutes`}</div>
              <div className="col-lg-12 margin-top-30 flex space-between">
                <a href={`tel:${advisor.phone}`} className="font-12 gray flex align-items-center">
                  <i className="fas fa-phone margin-right-5"></i>
                  Appeler
                </a>
                <a className="font-12 gray flex align-items-center" onClick={()=>{this.props.showClientConseiller(advisor)}}>
                  <i className="far fa-user margin-right-5"></i>
                  Voir clients
                </a>
              </div>
            </div>
          </div>
        </div>
      )
    }else{
      return null
    }
  }
}

function mapStateToProps(state) {
  return {
    selectedClients: state.selectedClients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ showClientConseiller }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(CardClient);
