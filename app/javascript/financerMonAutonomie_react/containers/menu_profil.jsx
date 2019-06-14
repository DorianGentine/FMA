import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import renderLogo from "../../components/render_logo"

class MenuProfil extends Component {
  render(){
    // const current_api = this.props.current_api

    let user = this.props.api.user
    // if(current_api != null){
    //   user = this.props.current_api.user
    // }
    let selectedMenu
    if(this.props.selectedMenu){
      selectedMenu = this.props.selectedMenu
    }

    let clients
    let clientsEnCours = 0
    let clientsArchives = 0
    if(selectedMenu === "clients"){
      clients = this.props.clients
    }

    const renderFiltres = ()=> {
      return(
        <div className="col-lg-6 row align-items-end">
          <div className="padding-horizontal-15 titre-filtre active">Tous <span>{clients ? clients.clients.length : 0}</span></div>
          <div className="padding-horizontal-15 titre-filtre">En cours <span>{clientsEnCours}</span></div>
          <div className="padding-horizontal-15 titre-filtre">Archivés <span>{clientsArchives}</span></div>
        </div>
      )
    }

    return (
      <div className={`${ selectedMenu === "clients" ? 'flex bordure-bas-300' : "" }`}>
        {selectedMenu === "clients" ? renderFiltres() : null}
        <div className={`relative col-lg-6 ${selectedMenu === "clients" ? "margin-left-30" : "offset-6"}`} role="group">
          <div
            id="drop-navbar"
            className="dropdown-toggle margin-bottom-15 flex justify-content-end align-items-center"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false">
            <p className="pointer text-align-right">Bonjour, {user.first_name} {user.last_name}</p>
            <div className="pointer margin-left-15">{renderLogo(user)}</div>
          </div>
          <div className="dropdown-menu" aria-labelledby="drop-navbar">
            <Link to={`/mon_espace/${this.props.current_user_id}/compte/identite`}>Mon compte</Link>
            <a href="/users/sign_out" rel="nofollow" data-method="delete">Se déconnecter</a>
          </div>
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    clients: state.clients,
    rootUrl: state.rootUrl,
    current_api: state.current_api,
    current_user_id: state.current_user_id,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MenuProfil);
