import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchAPI, fetchProjet } from '../actions';

import AppNavbar from "../containers/app_navbar"
import Volet from "../containers/volet"
import MenuProfil from "../containers/menu_profil"
import PanneauPrincipal from "../containers/panneau_principal"
import ModalCote from "../containers/modal_cote"

class App extends Component {

  componentWillMount() {
    this.props.fetchAPI(this.props.urlAPI)
    const b = () => {this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)}

    const projetFetch = setInterval(()=>{a(this.props.project_id, b)}, 100)

    function a(project_id, b){
      if(project_id){
        clearInterval(projetFetch)
        b()
      }
    }
  }


  render () {

    // if(this.props.project_id != null){
    //   console.log("coucou")
    //   this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
    // }

    const api = this.props.api
    const project = this.props.project

    if(api.statut == undefined || project == null){
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
    project_id: state.project_id,
    project: state.project,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI, fetchProjet }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
