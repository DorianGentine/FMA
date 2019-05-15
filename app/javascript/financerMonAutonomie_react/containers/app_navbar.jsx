import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

class AppNavbar extends Component {
  render(){
    const menuActive = this.props.selectedMenu.toLowerCase()
    const active = (param) => {
      if(param == menuActive){
        return "active"
      }
    }

    return (

      <div className="app-navbar">
        <a href="/home"><div className="logo-app"></div></a>

        <Link className={`btn-app-navbar margin-top-60 ${active("projet")}`} to={`${this.props.rootUrl}/projet/1`}>
          <i className="far fa-file-alt"></i>
          <p>Projet</p>
        </Link>
        <Link className={`btn-app-navbar margin-top-30 ${active("compte")}`} to={`${this.props.rootUrl}/compte/identite`}>
          <i className="far fa-user"></i>
          <p>Compte</p>
        </Link>
        <Link className={`btn-app-navbar margin-top-30 ${active("alertes")}`} to={`${this.props.rootUrl}/alertes/1`}>
          <i className="far fa-bell"></i>
          <p>Alertes</p>
        </Link>

        <a href="/users/sign_out" rel="nofollow" data-method="delete" className="btn-app-navbar navbar-quit margin-top-30">
          <i className="fas fa-door-open"></i>
          <p>Quitter</p>
        </a>
      </div>
    );
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

export default connect(mapStateToProps, null)(AppNavbar);
