import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import renderInitiale from "../../components/render_initiales"

const MenuProfil = (props) => {
  const beneficiaire = props.beneficiaire

  return (
    <div className="relative" role="group">
      <div id="drop-navbar" className="dropdown-toggle margin-bottom-15 flex justify-content-end align-items-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <p className="pointer text-align-right">Bonjour, {beneficiaire.first_name} {beneficiaire.last_name}</p>
        <div className="pointer navbar-avatar">{renderInitiale(`${beneficiaire.first_name} ${beneficiaire.last_name}`)}</div>
      </div>
      <div className="dropdown-menu" aria-labelledby="drop-navbar">
        <p><Link to={`${props.rootUrl}/compte/identite`}>Mon compte</Link></p>
        <p><a href="/users/sign_out" rel="nofollow" data-method="delete">Se déconnecter</a></p>
      </div>
    </div>
  );
};

function mapStateToProps(state) {
  return {
    beneficiaire: state.api.beneficiaire,
    rootUrl: state.rootUrl,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MenuProfil);

