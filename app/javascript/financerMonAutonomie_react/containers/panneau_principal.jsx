import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PanneauPrincipalProjet from "./panneau_principal/panneau_principal_projet"

class PanneauPrincipal extends Component {
  render(){
    // const statut = this.props.api.statut

    const selectedMenu = this.props.selectedMenu
    const selectedMenuVolet = this.props.selectedMenuVolet

    if(selectedMenu.toLowerCase() == "projet"){
      return (
        <div>
          <PanneauPrincipalProjet />
        </div>
      );
    }else if(selectedMenu.toLowerCase() == "compte"){
      if (selectedMenuVolet.toLowerCase() == "identite") {
        return (
          <div>
            <h1>{selectedMenuVolet}</h1>
          </div>
        );
      }
      if (selectedMenuVolet.toLowerCase() == "email") {
        return (
          <div>
            <h1>{selectedMenuVolet}</h1>
          </div>
        );
      }
      if (selectedMenuVolet.toLowerCase() == "mdp") {
        return (
          <div>
            <h1>{selectedMenuVolet}</h1>
          </div>
        );
      }
      if (selectedMenuVolet.toLowerCase() == "telephone") {
        return (
          <div>
            <h1>{selectedMenuVolet}</h1>
          </div>
        );
      }
      if (selectedMenuVolet.toLowerCase() == "suppression") {
        return (
          <div>
            <h1>{selectedMenuVolet}</h1>
          </div>
        );
      }
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
