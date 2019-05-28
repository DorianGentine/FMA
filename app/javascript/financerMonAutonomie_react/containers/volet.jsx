import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import VoletProjet from "./Volet/volet_projet"
import VoletCompte from "./Volet/volet_compte"

class Volet extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    if(selectedMenu.toLowerCase() == "projet"){
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
          <div>
            <h2 className="text-align-center">{selectedMenu}</h2>
          </div>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    modal_opened: state.modal_opened,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Volet);
