import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import VoletProjet from "./Volet/volet_projet"
import VoletCompte from "./Volet/volet_compte"
import VoletAlertes from "./Volet/volet_alertes"
import VoletAbout from "./Volet/volet_about"

class Volet extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    if(selectedMenu.toLowerCase() == "projet"
      || selectedMenu.toLowerCase() == "bureau"
      || selectedMenu.toLowerCase() == "demandes"
      || selectedMenu.toLowerCase() == "clients"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""}`}>
          <VoletProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""}`}>
          <VoletCompte selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""}`}>
          <VoletAlertes selectedMenuVolet={this.props.selectedMenuVolet} />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "a_propos"){
      return (
        <div className={`menu-principal ${ this.props.modal_opened ? "menu-principal-hidden" : ""}`}>
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
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Volet);
