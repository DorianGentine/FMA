import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PanneauPrincipalAbout from "./panneau_principal/panneau_principal_about"
import PanneauPrincipalAlertes from "./panneau_principal/panneau_principal_alertes"
import PanneauPrincipalClients from "./panneau_principal/panneau_principal_clients"
import PanneauPrincipalConseillers from "./panneau_principal/panneau_principal_conseillers"
import PanneauPrincipalCompte from "./panneau_principal/panneau_principal_compte"
import PanneauPrincipalDemandes from "./panneau_principal/panneau_principal_demandes"
import PanneauPrincipalProjet from "./panneau_principal/panneau_principal_projet"

class PanneauPrincipal extends Component {
  render(){

    const selectedMenu = this.props.selectedMenu
    // const selectedMenuVolet = this.props.selectedMenuVolet

    if(selectedMenu.toLowerCase() == "projet" || selectedMenu.toLowerCase() == "bureau"){
      return <PanneauPrincipalProjet selectedMenu={selectedMenu} />
    }else if(selectedMenu.toLowerCase() == "compte"){
      return <PanneauPrincipalCompte selectedMenuVolet={this.props.selectedMenuVolet} />
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return <PanneauPrincipalAlertes selectedMenuVolet={this.props.selectedMenuVolet} />
    }else if(selectedMenu.toLowerCase() == "clients"){
      return <PanneauPrincipalClients selectedMenu={selectedMenu} />
    }else if(selectedMenu.toLowerCase() == "conseillers"){
      return <PanneauPrincipalConseillers selectedMenu={selectedMenu} />
    }else if(selectedMenu.toLowerCase() == "demandes"){
      return <PanneauPrincipalDemandes />
    }else if(selectedMenu.toLowerCase() == "a_propos"){
      return <PanneauPrincipalAbout selectedMenuVolet={this.props.selectedMenuVolet} />
    }
  }
};

function mapStateToProps(state) {
  return {
    // api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(PanneauPrincipal);
