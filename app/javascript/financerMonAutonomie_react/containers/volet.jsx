import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { menuMobileOpened } from '../actions';

import VoletProjet from "./Volet/volet_projet"
import VoletCompte from "./Volet/volet_compte"
import VoletAlertes from "./Volet/volet_alertes"
import VoletAbout from "./Volet/volet_about"

class Volet extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu
    const isMobile = this.props.isMobile

    if(selectedMenu.toLowerCase() == "projet"
      || selectedMenu.toLowerCase() == "bureau"
      || selectedMenu.toLowerCase() == "demandes"
      || selectedMenu.toLowerCase() == "conseillers"
      || selectedMenu.toLowerCase() == "clients"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""} ${isMobile ? "relative" : "" }`}>
          { isMobile ? <i className="far fa-times-circle absolute" style={{ top: "20px", right: "20px", zIndex: 1 }} onClick={()=>{this.props.menuMobileOpened(false)}}></i> : null }
          <VoletProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""} ${isMobile ? "relative" : "" }`}>
          { isMobile ? <i className="far fa-times-circle absolute" style={{ top: "20px", right: "20px", zIndex: 1 }} onClick={()=>{this.props.menuMobileOpened(false)}}></i> : null }
          <VoletCompte selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""} ${isMobile ? "relative" : "" }`}>
          { isMobile ? <i className="far fa-times-circle absolute" style={{ top: "20px", right: "20px", zIndex: 1 }} onClick={()=>{this.props.menuMobileOpened(false)}}></i> : null }
          <VoletAlertes selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "a_propos"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""} ${isMobile ? "relative" : "" }`}>
          { isMobile ? <i className="far fa-times-circle absolute" style={{ top: "20px", right: "20px", zIndex: 1 }} onClick={()=>{this.props.menuMobileOpened(false)}}></i> : null }
          <VoletAbout selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    modal_opened: state.modal_opened,
    api: state.api,
    isMobile: state.isMobile,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ menuMobileOpened }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Volet);
