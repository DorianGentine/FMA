import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PanneauPrincipalProjet from "./panneau_principal/panneau_principal_projet"
import PanneauPrincipalCompte from "./panneau_principal/panneau_principal_compte"

class PanneauPrincipal extends Component {
  render(){

    const selectedMenu = this.props.selectedMenu
    // const selectedMenuVolet = this.props.selectedMenuVolet

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div>
          <PanneauPrincipalProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      return <PanneauPrincipalCompte selectedMenuVolet={this.props.selectedMenuVolet} />
    }else if(selectedMenu.toLowerCase() == "alertes"){
      return (
        <div>
          <h1>{selectedMenu}</h1>
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "bureau"){
      return (
        <div>
          <PanneauPrincipalProjet />
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    // api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(PanneauPrincipal);
