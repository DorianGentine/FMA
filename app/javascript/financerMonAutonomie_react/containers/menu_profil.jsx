import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import renderLogo from "../../components/render_logo"

const MenuProfil = (props) => {
  const user = props.api.user
  let selectedMenu
  if(props.selectedMenu){
    selectedMenu = props.selectedMenu
  }

  const renderFiltres = ()=> {
    return(
      <div className="col-lg-6 row align-items-end">
        <div className="padding-horizontal-15 titre-filtre active">Tous <span>XX</span></div>
        <div className="padding-horizontal-15 titre-filtre">Tous <span>XX</span></div>
        <div className="padding-horizontal-15 titre-filtre">Tous <span>XX</span></div>
      </div>
    )
  }

  return (
    <div className={`${ selectedMenu === "clients" ? 'flex bordure-bas-300' : "" }`}>
      {selectedMenu === "clients" ? renderFiltres() : null}
      <div className={`relative col-lg-6 ${selectedMenu === "clients" ? "margin-left-30" : "offset-6"}`} role="group">
        <div
          id="drop-navbar"
          className="dropdown-toggle margin-bottom-15 flex justify-content-end align-items-center"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false">
          <p className="pointer text-align-right">Bonjour, {user.first_name} {user.last_name}</p>
          <div className="pointer margin-left-15">{renderLogo(user)}</div>
        </div>
        <div className="dropdown-menu" aria-labelledby="drop-navbar">
          <Link to={`${props.rootUrl}/compte/identite`}>Mon compte</Link>
          <a href="/users/sign_out" rel="nofollow" data-method="delete">Se déconnecter</a>
        </div>
      </div>
    </div>
  );
};

function mapStateToProps(state) {
  return {
    api: state.api,
    rootUrl: state.rootUrl,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MenuProfil);

