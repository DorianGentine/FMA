import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import renderLogo from "../../../components/render_logo"

import { fetchPostCompte } from '../../actions'

class PanneauPrincipalAbout extends Component {
  render(){
    const selectedMenuVolet = this.props.selectedMenuVolet

    switch(selectedMenuVolet){
      case "cgu_cgv": {

        return(
          <div className="row">
            <h1 className="col-lg-8 offset-lg-2 col-xs-12 text-align-center">Conditions générales d'utilisation et de vente</h1>
            <p>FinancerMonAutonomie est une plateforme web, qui facilite l’accès des personnes en situation de handicap à un logement adapté à leurs besoins. En alliant l'expertise d'ergothérapeutes professionnels et la technologie d'une plateforme intuitive, elle résout les</p>
          </div>

        )
      }
      case "protection_donnees": {
        return(
          <div className="row">
            <h1 className="col-lg-8 offset-lg-2 col-xs-12 text-align-center">Centre de protection des données</h1>
            <p>FinancerMonAutonomie est une plateforme web, qui facilite l’accès des personnes en situation de handicap à un logement adapté à leurs besoins. En alliant l'expertise d'ergothérapeutes professionnels et la technologie d'une plateforme intuitive, elle résout les</p>
          </div>
        )
      }
      default: {
        return null
      }
    }
  }
}

// function mapStateToProps(state) {
//   return {
//     api: state.api,
//     user_id: state.user_id,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({
//     fetchPostCompte,
//   }, dispatch);
// }

export default PanneauPrincipalAbout;
