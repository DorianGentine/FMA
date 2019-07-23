import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { menuMobileOpened } from '../../actions';

class VoletAbout extends Component {
  render(){
    const rootAbout = `${this.props.rootUrl}/a_propos`
    const selectedMenuVolet = this.props.selectedMenuVolet

    const active = (param) => {
      if(param == selectedMenuVolet){
        return "active"
      }
    }

    return(
      <div>
        <h2 className="text-align-center margin-bottom-60">À propos</h2>
        <Link className={`volet-item-menu ${active("cgu_cgv")}`} to={`${rootAbout}/cgu_cgv`} onClick={()=>{this.props.menuMobileOpened(false)}}>
          CGU & CGV
        </Link>
        <Link className={`volet-item-menu ${active("protection_donnees")}`} to={`${rootAbout}/protection_donnees`} onClick={()=>{this.props.menuMobileOpened(false)}}>
          Protection de données
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

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ menuMobileOpened }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(VoletAbout);
