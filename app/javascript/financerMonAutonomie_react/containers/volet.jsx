import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import VoletProjet from "./Volet/volet_projet"

class Volet extends Component {
  render(){
    const rootCompte = `${this.props.rootUrl}/compte`
    const selectedMenu = this.props.selectedMenu
    const selectedMenuVolet = selectedMenu + "/" + this.props.selectedMenuVolet
    const active = (param) => {
      if(param == selectedMenuVolet){
        return "active"
      }
    }

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <VoletProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <div className="menu-principal">
            <h2 className="text-align-center margin-bottom-60">Réglages du compte</h2>
            <Link className={`volet-item-menu ${active("compte/identite")}`} to={`${rootCompte}/identite`}>
              Identité
            </Link>
            <Link className={`volet-item-menu ${active("compte/email")}`} to={`${rootCompte}/email`}>
              Email
            </Link>
            <Link className={`volet-item-menu ${active("compte/mdp")}`} to={`${rootCompte}/mdp`}>
              Mot de passe
            </Link>
            <Link className={`volet-item-menu ${active("compte/telephone")}`} to={`${rootCompte}/telephone`}>
              Téléphone
            </Link>
            <Link className={`volet-item-menu ${active("compte/suppression")}`} to={`${rootCompte}/suppression`}>
              Suppression du compte
            </Link>
          </div>
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div style={{height: "100vh", minWidth: "400px",}} >
          <div className="menu-principal">
            <h2 className="text-align-center">{selectedMenu}</h2>
          </div>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    rootUrl: state.rootUrl,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Volet);
