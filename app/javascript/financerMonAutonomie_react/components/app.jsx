import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchAPI, fetchProjet, fetchCurrentApi } from '../actions';

import AppNavbar from "../containers/app_navbar"
import Chat from "../containers/chat"
import MenuProfil from "../containers/menu_profil"
import ModalCote from "../containers/modal_cote"
import ModalPdf from "../containers/modal_pdf"
import PanneauPrincipal from "../containers/panneau_principal"
import Volet from "../containers/volet"

class App extends Component {

  componentWillMount() {
    if(this.props.otherUser){
      this.props.fetchCurrentApi(`/api/v1/users/${this.props.current_user_id}`)
    }

    this.props.fetchAPI(this.props.urlAPI)
    const b = () => {this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)}

    const projetFetch = setInterval(()=>{a(this.props, b)}, 100)

    function a(props, b){
      if(props.project_id){
        clearInterval(projetFetch)
        b()
      }else if(props.api.statut === "conseiller" || props.api.statut === "admin"){
        clearInterval(projetFetch)
      }
    }
  }

  // componentDidMount(){
  //   this.refresherDemandes = setInterval(()=>{this.props.fetchProjet("/api/v1/projects")}, 60000)
  //   this.refresher = setInterval(()=>{this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)}, 10000)
  // }

  // componentWillUnmount(){
  //   clearInterval(this.refresherDemandes);
  //   clearInterval(this.refresher);
  // }


  render () {

    const api = this.props.api
    const project = this.props.project

    if(api.statut == undefined || api.statut === "client" && project == null){
      return(
        <div className="align-items-center justify-content-center" style={{backgroundColor: "#ecf0f1",}}>
          <h1 className="no-margin">CHARGEMENT</h1>
          <img style={{height: "50px",}} src="https://media2.giphy.com/media/jAYUbVXgESSti/giphy.gif?cid=790b76115cdbb4a9722f685249ba06d7&rid=giphy.gif" alt=""/>
        </div>
      );

    // App beneficiaire
      }else if(api.statut === "client"){
        const otherUser = this.props.otherUser
        let conseillerName
        if(this.props.current_api != null){
          conseillerName = `${this.props.current_api.user.first_name} ${this.props.current_api.user.last_name}`
        }
        return (
          <div className={otherUser ? "other_user" : ""}>
            {otherUser ?
              <div className="other_user_indication">
                <h2 className="margin-right-15">
                  {`Vous êtes connecté en tant que ${conseillerName}
                     sur le compte de ${api.user.first_name} ${api.user.last_name}`
                  }</h2>
                <a href={`/mon_espace/${this.props.current_user_id}/clients`}>Retourner sur mon profil</a>
              </div> : null}

            {this.props.modal_pdf != null ? <ModalPdf /> : null}
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
              <MenuProfil selectedMenu={this.props.match.params.menu_nav} />
              <PanneauPrincipal
                selectedMenu={this.props.match.params.menu_nav}
                selectedMenuVolet={this.props.match.params.menu_volet}
              />
            </div>
            <div className={`modal-cote ${ this.props.modal_opened ? "" : "modal-cote-hidden"}`}>
              <div><ModalCote /></div>
            </div>
            <Chat />
          </div>
        );

    // App admin
      }else if(api.statut === "admin"){
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
              <MenuProfil selectedMenu={this.props.match.params.menu_nav} />
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
      }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    current_user_id: state.current_user_id,
    current_api: state.current_api,
    modal_opened: state.modal_opened,
    modal_pdf: state.modal_pdf,
    otherUser: state.otherUser,
    project_id: state.project_id,
    project: state.project,
    urlAPI: state.urlAPI,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI, fetchProjet, fetchCurrentApi }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
