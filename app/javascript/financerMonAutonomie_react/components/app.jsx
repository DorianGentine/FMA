import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchAPI } from '../actions';

import AppNavbar from "../containers/app_navbar"
import Volet from "../containers/volet"
import MenuProfil from "../containers/menu_profil"
import PanneauPrincipal from "../containers/panneau_principal"
import ModalCote from "../containers/modal_cote"

class App extends Component {

  componentWillMount() {
    this.props.fetchAPI(this.props.urlAPI);
  }


  render () {
    const api = this.props.api
    if(api.statut == undefined){
      return(
        <div className="align-items-center justify-content-center" style={{backgroundColor: "#ecf0f1",}}>
          <h1 className="no-margin">LOADING</h1>
          <img style={{height: "50px",}} src="https://media2.giphy.com/media/jAYUbVXgESSti/giphy.gif?cid=790b76115cdbb4a9722f685249ba06d7&rid=giphy.gif" alt=""/>
        </div>
      );

    // App beneficiaire
    }else if(api.statut === "client"){
      return (
        <div>
          <AppNavbar selectedMenu={this.props.match.params.menu_nav} />
          <Volet selectedMenu={this.props.match.params.menu_nav}
              selectedMenuVolet={this.props.match.params.menu_volet}
           />
          <div className="app-container container">
            <MenuProfil />
            <PanneauPrincipal
              selectedMenu={this.props.match.params.menu_nav}
              selectedMenuVolet={this.props.match.params.menu_volet}
            />
          </div>
          <div className={`modal-cote ${ this.props.modal_opened ? "" : "modal-cote-hidden"}`}>
            <div><ModalCote /></div>
          </div>
        </div>
      );

      // App conseiller
    }else if(api.statut === "conseiller"){
      if(this.props.match.params.menu_nav === "projet"){
        this.props.match.params.menu_nav = "bureau"
      }

      return (
        <div>
          <AppNavbar selectedMenu={this.props.match.params.menu_nav} />
          <Volet selectedMenu={this.props.match.params.menu_nav}
              selectedMenuVolet={this.props.match.params.menu_volet}
           />
          <div className="app-container container">
            <MenuProfil />
            <PanneauPrincipal
              selectedMenu={this.props.match.params.menu_nav}
              selectedMenuVolet={this.props.match.params.menu_volet}
            />
          </div>
        </div>
      );
          // <div className={`modal-cote ${ this.props.modal_opened ? "" : "modal-cote-hidden"}`}>
          //   <div><ModalCote /></div>
          // </div>
    }
  }
};

function mapStateToProps(state) {
  return {
    urlAPI: state.urlAPI,
    api: state.api,
    modal_opened: state.modal_opened,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
