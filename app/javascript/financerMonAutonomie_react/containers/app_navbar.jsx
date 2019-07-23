import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import MediaQuery from 'react-responsive';

import { menuMobileOpened } from '../actions';

class AppNavbar extends Component {
  render(){
    const menuActive = this.props.selectedMenu.toLowerCase()
    let api = this.props.api
    const isMobile = this.props.isMobile
    // if(this.props.current_api != null){
    //   api = this.props.current_api
    // }
    const active = (param) => {
      if(param == menuActive){
        return "active"
      }
    }

    const closeMenuMobile = () => {
      this.props.menuMobileOpened(false)
    }


    // App beneficiaire
    if(api.statut === "client"){
      return (
        <div>
          { isMobile ? null :<div style={{height: "100vh", padding: "43px"}}></div> }
          <div className="app-navbar">
            { isMobile ?
              <div className="logo-app" onClick={()=>{this.props.menuMobileOpened(false)}}></div>
              :
              <a href="/home"><div className="logo-app"></div></a>
            }

            <Link className={`btn-app-navbar margin-top-60 ${active("projet")}`} to={`${this.props.rootUrl}/projet`}>
              <i className="far fa-file-alt"></i>
              <p>Projet</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("compte")}`} to={`${this.props.rootUrl}/compte/identite`}>
              <i className="far fa-user"></i>
              <p>Compte</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("alertes")}`} to={`${this.props.rootUrl}/alertes/notifications`}>
              <i className="far fa-bell"></i>
              <p>Alertes</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("a_propos")}`} to={`${this.props.rootUrl}/a_propos/cgu_cgv`}>
              <i className="fas fa-info-circle"></i>
              <p>A propos</p>
            </Link>

            <a href="/users/sign_out" rel="nofollow" data-method="delete" className="btn-app-navbar navbar-quit margin-top-30">
              <i className="fas fa-door-open"></i>
              <p>Quitter</p>
            </a>
          </div>
        </div>
      );

    // App conseiller
    }else if(api.statut === "conseiller" || api.statut === "admin"){
      if(menuActive === "bureau"){
        setTimeout(()=> {document.getElementById('link_bureau').click()}, 1000)
      }
      return (
        <div>
          { isMobile ? null :<div style={{height: "100vh", padding: "43px"}}></div> }
          <div className="app-navbar">
            { isMobile ?
              <a onClick={()=>{this.props.menuMobileOpened(false)}}><div className="logo-app"></div></a>
              :
              <a href="/home"><div className="logo-app"></div></a>
            }

            <Link className={`btn-app-navbar margin-top-60 ${active("bureau")}`} id="link_bureau" to={`${this.props.rootUrl}/bureau`}>
              <i className="far fa-file-alt"></i>
              <p>Bureau</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("clients")}`} to={`${this.props.rootUrl}/clients`}>
              <i className="far fa-folder"></i>
              <p>Clients</p>
            </Link>
            { api.statut === "admin" ?
              <Link className={`btn-app-navbar margin-top-30 ${active("conseillers")}`} to={`${this.props.rootUrl}/conseillers`}>
                <i className="fas fa-users"></i>
                <p>Conseillers</p>
              </Link> : null
            }
            <Link className={`btn-app-navbar margin-top-30 ${active("demandes")}`} to={`${this.props.rootUrl}/demandes`}>
              <i className="fas fa-question"></i>
              <p>Demandes</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("compte")}`} to={`${this.props.rootUrl}/compte/identite`}>
              <i className="far fa-user"></i>
              <p>Compte</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("alertes")}`} to={`${this.props.rootUrl}/alertes/notifications`}>
              <i className="far fa-bell"></i>
              <p>Alertes</p>
            </Link>
            <Link className={`btn-app-navbar margin-top-30 ${active("a_propos")}`} to={`${this.props.rootUrl}/a_propos/cgu_cgv`}>
              <i className="fas fa-info-circle"></i>
              <p>A propos</p>
            </Link>

            <a href="/users/sign_out" rel="nofollow" data-method="delete" className="btn-app-navbar navbar-quit margin-top-30">
              <i className="fas fa-door-open"></i>
              <p>Quitter</p>
            </a>
          </div>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    rootUrl: state.rootUrl,
    api: state.api,
    current_api: state.current_api,
    isMobile: state.isMobile,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ menuMobileOpened }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(AppNavbar);
