import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

class VoletCompte extends Component {
  render(){
    const rootCompte = `${this.props.rootUrl}/compte`
    const selectedMenuVolet = "compte/" + this.props.selectedMenuVolet

    const active = (param) => {
      if(param == selectedMenuVolet){
        return "active"
      }
    }

    return(
      <div>
        <h2 className="text-align-center margin-bottom-60">Réglages du compte</h2>
        <Link className={`volet-item-menu ${active("compte/identite")}`} to={`${rootCompte}/identite`}>
          Identité
        </Link>
        <Link className={`volet-item-menu ${active("compte/email")}`} to={`${rootCompte}/email`}>
          Email
        </Link>
        <Link className={`volet-item-menu ${active("compte/mdp")}`} to={`${rootCompte}/mdp`}>
          Mot de passe
        </Link>
        <Link className={`volet-item-menu ${active("compte/telephone")}`} to={`${rootCompte}/telephone`}>
          Téléphone
        </Link>
        <Link className={`volet-item-menu ${active("compte/suppression")}`} to={`${rootCompte}/suppression`}>
          Suppression du compte
        </Link>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    rootUrl: state.rootUrl,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VoletCompte);
