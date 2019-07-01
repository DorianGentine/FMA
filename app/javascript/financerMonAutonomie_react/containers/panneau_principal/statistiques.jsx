import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// import { fetchFinancers, showFinancer } from '../../actions'

// import renderLogo from "../../../components/render_logo"

class Statistiques extends Component {
  render(){
    const api = this.props.api
    console.log("retour api", api)
    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="w-100 padding-horizontal-15 no-margin">Activités de la plateforme</h4>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-bleu font-12 black bold">Projets</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api.activities.projects != null ? api.activities.projects : "-"}</p>
            <p className="font-12 black">{`${api.activities.current != null ? api.activities.current : "-"} en cours`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api.activities.requests != null ? api.activities.requests : "-"} demandes`}</p>
          </div>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-jaune font-12 black bold">Visitors</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api.activities.visitors != null ? api.activities.visitors : "-"}</p>
            <p className="font-12 black">{`${api.activities.formulaires != null ? api.activities.formulaires : "-"} formulaires`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api.activities.inscription!= null ? api.activities.inscription : "-"} inscriptions`}</p>
          </div>
          <div className="margin-top-15 col-lg-4" style={{ height: "145px" }}>
            <p className="point point-vert font-12 black bold">Connectés</p>
            <p className="no-margin black bold" style={{fontSize: "34px", lineHeight: "41px"}}>{api.activities.connected != null  ? api.activities.connected : "-"}</p>
            <p className="font-12 black">{`${api.activities.unloged != null ? api.activities.unloged : "-"} hors-ligne`}</p>
            <hr className="ligne-horizontal gray-200-background no-margin"/>
            <p className="font-12 black">{`${api.activities.dormant != api.activities.dormant ? 10 : "-"} inactifs`}</p>
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
