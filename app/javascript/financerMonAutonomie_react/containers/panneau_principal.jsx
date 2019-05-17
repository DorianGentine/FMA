import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PanneauPrincipalProjet from "./panneau_principal/panneau_principal_projet"

class PanneauPrincipal extends Component {
  render(){
    const selectedMenu = this.props.selectedMenu

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div className="container_panneau_principal">
          <PanneauPrincipalProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return (
        <div>
          <h1>{selectedMenu}</h1>
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div>
          <h1>{selectedMenu}</h1>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    project: state.api.project,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(PanneauPrincipal);
