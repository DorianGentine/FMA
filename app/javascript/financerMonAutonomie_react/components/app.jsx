import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchAPI } from '../actions';

import AppNavbar from "../containers/app_navbar"
import Volet from "../containers/volet"
import MenuProfil from "../containers/menu_profil"
import PanneauPrincipal from "../containers/panneau_principal"

class App extends Component {
  // componentWillMount() {
  //   this.props.fetchAPI(this.props.urlAPI);
  // }


  render () {
    // App beneficiaire
    if(this.props.api.beneficiaire.client){
      return (
        <div>
          <AppNavbar />
          <Volet conseiller={this.props.api.fma_team} />
          <div className="container">
            <MenuProfil />
            <PanneauPrincipal />
          </div>
        </div>
      );

      // App conseiller
    } else if(true){
      return (
        <div>
          <h1>CE N'EST PAS UN BENEFICIAIRE</h1>
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

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
