import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import renderInitiale from "../../components/render_initiales"

const MenuProfil = (props) => {
  const user = props.api.user

  return (
    <div className="relative" role="group">
      <div id="drop-navbar" className="dropdown-toggle margin-bottom-15 flex justify-content-end align-items-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <p className="pointer text-align-right">Bonjour, {user.first_name} {user.last_name}</p>
        <div className="pointer navbar-avatar">{renderInitiale(`${user.first_name} ${user.last_name}`)}</div>
      </div>
      <div className="dropdown-menu" aria-labelledby="drop-navbar">
        <Link to={`${props.rootUrl}/compte/identite`}>Mon compte</Link>
        <a href="/users/sign_out" rel="nofollow" data-method="delete">Se déconnecter</a>
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

