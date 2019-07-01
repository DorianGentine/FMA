import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// import { fetchFinancers, showFinancer } from '../../actions'

// import renderLogo from "../../../components/render_logo"

class Statistiques extends Component {
  render(){
    const api = this.props.api
    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="w-100 padding-horizontal-15 no-margin">Activités de la plateforme</h4>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-bleu font-12 black bold">Projets</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api.inscrits != null ? api.inscrits : 0}</p>
            <p className="font-12 black">{`${api.in_progress != null ? api.in_progress : 0} en cours`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api.archived != null ? api.archived : 0} archivés`}</p>
          </div>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-jaune font-12 black bold">Formulaires</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api != null ? 10 : 0}</p>
            <p className="font-12 black">{`${api != null ? 10 : 0} inachevés`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api.inscrits != null ? api.inscrits : 0} inscriptions`}</p>
          </div>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-vert font-12 black bold">Connectés</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api != null ? 10 : 0}</p>
            <p className="font-12 black">{`${api != null ? 10 : 0} hors-ligne`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api != null ? 10 : 0} inactifs`}</p>
          </div>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFinancers, showFinancer }, dispatch);
// }

export default connect(mapStateToProps, null)(Statistiques);
