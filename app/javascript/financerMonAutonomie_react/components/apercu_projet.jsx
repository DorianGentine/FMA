import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

const ApercuProjet = (props) => {
  const project = props.project
  const solutions = props.solutions

  const mydate = new Date(project.created_at);
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
        <p className="col-lg-6 font-14 bold text-align-right black">+ {solutions.length}</p>
      </div>
    </div>
  );
};

function mapStateToProps(state) {
  return {
    project: state.api.project,
    solutions: state.api.solutions,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(ApercuProjet);
