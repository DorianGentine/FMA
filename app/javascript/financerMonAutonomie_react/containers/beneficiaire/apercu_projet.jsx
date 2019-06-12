import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchProjet } from '../../actions';

class ApercuProjet extends Component {

  render(){
    const statut = this.props.api.statut

    // App client
      if(statut === "client"){
        const project = this.props.project
        const financers = project.financers

        const mydate = new Date(project.project.date_de_creation);
        const month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][mydate.getMonth()];
        const dateInscription = mydate.getDate() + ' ' + month + ' ' + mydate.getFullYear();

        return (
          <div className="margin-top-30">
            <div className="flex black align-items-center">
              <div className="icon-align-left margin-right-15"></div>
              Détails du projet
            </div>
            <div className="row margin-top-30">
              <p className="col-lg-6 font-14">Date d'inscription</p>
              <p className="col-lg-6 font-14 text-align-right blue bold">{dateInscription}</p>
              <p className="col-lg-6 font-14">Financeurs</p>
              <p className="col-lg-6 font-14 bold text-align-right black">+ {financers.length}</p>
            </div>
          </div>
        );

    // App conseiller
    }else if(statut === "conseiller"){
      return (
        <div className="margin-top-30">
          <div className="flex black align-items-center">
            <div className="icon-align-left margin-right-15"></div>
            Détails
          </div>
          <div className="row margin-top-30">
            <p className="col-lg-6 font-14">Clients</p>
            <p className="col-lg-6 font-14 text-align-right black bold">{`${this.props.api.clients.length} en cours`}</p>
            <p className="col-lg-8 font-14">Demandes spécifiques</p>
            <p className="col-lg-4 font-14 text-align-right black bold">{`${"X"} en cours`}</p>
          </div>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    project: state.project,
    project_id: state.project_id
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ApercuProjet);
