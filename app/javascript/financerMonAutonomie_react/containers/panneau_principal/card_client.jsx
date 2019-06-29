import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showDemande } from '../../actions'

import renderLogo from "../../../components/render_logo"

class CardClient extends Component {
  // componentWillMount(){
  //   console.log(this.props.client)
  // }

  render(){
    const client = this.props.client
    const selectedClients = this.props.selectedClients

    const mydate = new Date(client.created_at);
    const month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][mydate.getMonth()];
    const dateInscription = mydate.getDate() + ' ' + month + ' ' + mydate.getFullYear();

    let numEtape
    let subTitle
    const calculEtape = () => {
      switch (client.étape) {
        case "validation_data": {
          numEtape = 1
          subTitle = "Données à valider"
          return [numEtape, subTitle];
        }
        case "documentation": {
          numEtape = 2
          subTitle = "Documents à envoyer"
          return [numEtape, subTitle];
        }
        case "meeting": {
          numEtape = 3
          subTitle = "RDV à fixer"
          return [numEtape, subTitle];
        }
        case "call": {
          numEtape = 4
          subTitle = "RDV fixé"
          return [numEtape, subTitle];
        }
        case "progression": {
          numEtape = 5
          subTitle = "Kit à envoyer"
          return [numEtape, subTitle];
        }
        case "evaluation": {
          numEtape = 6
          subTitle = "Formulaire satisfaction"
          return [numEtape, subTitle];
        }
        default: {
          numEtape = 0
          return [numEtape, subTitle];
        }
      }
    }
    let etapeText = calculEtape()
    numEtape = etapeText[0]
    subTitle = etapeText[1]

    const fullName = `${client.first_name} ${client.last_name}`
    if(selectedClients === "tous" ||
      selectedClients === "en_cours" && numEtape < 6 ||
      selectedClients === "archives" && numEtape === 6 ||
      fullName.toLowerCase().includes(selectedClients.toLowerCase()) ||
      parseInt(selectedClients) === numEtape) {
      return(
        <div className="col-lg-4 col-xs-12 col-sm-6">
          <div className="white-box" style={{padding: "20px"}}>
            <div className="row">
              <div className="col-lg-6 font-12 black flex align-items-center margin-bottom-15">
                {renderLogo(client)}
                <span className="bold" style={{marginLeft: "-10px"}}>{`${client.nombre_benef > 1 ? `+${client.nombre_benef - 1}` : "" }`}</span>
              </div>

              <div className="relative col-lg-6 text-align-right" role="group">
                <div
                  id={`drop-call${client.id}`}
                  className="pointer"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false">...
                </div>
                <div
                  className="dropdown-menu drop-menu-call"
                  aria-labelledby={`drop-call${client.id}`}>
                  <a className="black" onClick={()=>{this.props.showDemande(client)}}>Demandes&nbsp;spécifiques</a>
                  <a href="#">Marquer</a>
                  <a href="#">Archiver</a>
                </div>
              </div>

              <div className="col-lg-12 font-14 black bold">{fullName}</div>
              <div className="col-lg-12 margin-bottom-30 blue font-12">{subTitle}</div>
              <div className="col-lg-5 font-12 gray-300">Financeurs:</div>
              <div className="col-lg-7 text-align-right font-12 black">{client.financeurs}</div>
              <div className="col-lg-5 font-12 gray-300">Date:</div>
              <div className="col-lg-7 text-align-right font-12 black">{dateInscription}</div>
              <div className="col-lg-5 font-12 gray-300">Étape:</div>
              <div className="col-lg-7 text-align-right font-12 black">{`${numEtape}/6`}</div>
              <div className="col-lg-12 margin-top-30 flex space-between">
                <a href={`tel:${client.phone}`} className="font-12 gray flex align-items-center">
                  <i className="fas fa-phone margin-right-5"></i>
                  Appeler
                </a>
                <a href={`${client.url}/projet`} className="font-12 gray flex align-items-center">
                  <i className="far fa-user margin-right-5"></i>
                  Voir profil
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
  return bindActionCreators({ showDemande }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(CardClient);
