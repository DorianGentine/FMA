import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchClients, showDemande } from '../../actions'

import renderLogo from "../../../components/render_logo"
import { renderDate, diffDays } from "../../../components/render_date"

import Switch from "../modal_cote/switch"

class AppelsProgrammes extends Component {
  render(){
    const clients = this.props.clients

    let clientsStep4 = 0
    if(clients != null){
      for (let i = clients.clients.length - 1; i >= 0; i--) {
        if(clients.clients[i].étape === "call"){
          clientsStep4 = clientsStep4 + 1
        }
      }
    }

    const renderCalls = () => {
      if(clientsStep4 === 0){
        return (
          <div className="text-align-center margin-top-15">Aucun appel programmé</div>
        )
      }else{
        return clients.clients.map((client, index) => {
          if(client.étape === "call"){
            let hourRdv = new Date(client.rdv).getHours()
            let minRdv = String(new Date(client.rdv).getMinutes()).padStart(2, '0')

            const daysToRdv = diffDays(new Date(client.rdv))
            let textNextMeeting
            if(daysToRdv == 0){
              textNextMeeting = "aujourd'hui"
            }else if(daysToRdv == 1){
              textNextMeeting = "demain"
            }else if(daysToRdv == 2){
              textNextMeeting = "après-demain"
            }else if(daysToRdv > 2){
              textNextMeeting = renderDate(client.rdv, "dd_mmm")
            }

            return (
              <div className="flex margin-top-15" key={index}>
                <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>
                  {`${hourRdv}h${minRdv}`}
                  <span className="gray-300"> {textNextMeeting}</span>
                </p>
                <p className="col-lg-3 font-12">{client.first_name}</p>
                <p className="col-lg-3 font-12">{`${client.financeurs} financeurs`}</p>
                <p className="col-lg-2 font-12">{client.phone}</p>
                <div className="col-lg-1">
                  <Switch checked={false} kind="switchAppel" clientId={client.project}/>
                </div>
                <div className="relative col-lg-1 text-align-right" role="group">
                  <div
                    id={`drop-call${index}`}
                    className="pointer font-12"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false">...
                  </div>
                  <div
                    className="dropdown-menu drop-menu-call"
                    aria-labelledby={`drop-call${index}`}>
                    <a href={client.url}>Voir&nbsp;le&nbsp;profil</a>
                    <a href="#">Envoyer&nbsp;un&nbsp;message</a>
                    <a className="black" onClick={()=>{this.props.showDemande(client)}}>Demandes&nbsp;spécifiques</a>
                  </div>
                </div>
              </div>
            );
          }
        });
      }
    };


    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Appels programmés</h4>
          <p className="blue padding-horizontal-15">
            {`${clientsStep4} ${clientsStep4 < 2 ? "appel" : "appels"}`}
          </p>
          <p className="
            padding-horizontal-15
            text-align-right
            font-12
            icon-arrow-right-gray
            flex-grow-1">
          </p>
          <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
            <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Heure</p>
            <p className="col-lg-3 font-12">Nom</p>
            <p className="col-lg-3 font-12">Financeurs éligibles</p>
            <p className="col-lg-2 font-12">Tél</p>
            <p className="col-lg-2 font-12" style={{paddingRight: 0}}>Appelé</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "120px" }}>
            {clients != null ? renderCalls() : <p className="text-align-center margin-top-15">Chargement...</p> }
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
  return bindActionCreators({ fetchClients, showDemande }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(AppelsProgrammes);
