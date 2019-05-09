import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../components/render_initiales"

const MenuProfil = (props) => {
  const beneficiaire = props.beneficiaire
  const styleAvatar = {
    height: "35px",
    width: "35px",
    fontSize: "12px",
    lineHeight: "35px",
    margin: "0 15px",
  }

  return (
    <div className="margin-bottom-30 row justify-content-end align-items-center">
      <p className="text-align-right">Bonjour, {beneficiaire.first_name} {beneficiaire.last_name}</p>
      <div className="avatar-app" style={styleAvatar}>{renderInitiale(beneficiaire.first_name, beneficiaire.last_name)}</div>
      <div className="icon-arrow-down"></div>
    </div>
  );
};

function mapStateToProps(state) {
  return {
    beneficiaire: state.api.beneficiaire,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MenuProfil);

