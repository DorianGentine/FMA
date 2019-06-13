import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

class VoletCompte extends Component {
  render(){
    const rootAlertes = `${this.props.rootUrl}/alertes`
    const selectedMenuVolet = this.props.selectedMenuVolet

    const active = (param) => {
      if(param == selectedMenuVolet){
        return "active"
      }
    }

    return(
      <div>
        <h2 className="text-align-center margin-bottom-60">Gérer mes alertes</h2>
        <Link className={`volet-item-menu ${active("notifications")}`} to={`${rootAlertes}/notifications`}>
          Notifications
        </Link>
        <Link className={`volet-item-menu ${active("actualites")}`} to={`${rootAlertes}/actualites`}>
          Actualités
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
