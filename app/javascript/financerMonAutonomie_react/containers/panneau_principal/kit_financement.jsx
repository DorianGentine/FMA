import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Financers from './financers'

class KitDeFinancement extends Component {
  render(){
    const kit = this.props.project.kit
    const renderDocs = () => {
      // return this.props.messages.map((message, index) => {
        return (
          <div className="flex margin-top-15">
            <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>Intérieur</p>
            <p className="col-lg-4 font-12">Dossier de maintenance</p>
            <p className="col-lg-3 font-12">Caisse retraite</p>
            <p className="col-lg-3 font-12">12/03/2019</p>
          </div>
        );
      // });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-6">Découvrez votre kit de financement</h4>
          <p className="bold col-lg-1">2</p>
          <a className="col-lg-5 text-align-right font-12" href="#">Tout télécharger</a>
          <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
            <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Catégorie</p>
            <p className="col-lg-4 font-12">Nom du fichier</p>
            <p className="col-lg-3 font-12">Financeurs éligibles</p>
            <p className="col-lg-3 font-12" style={{paddingRight: 0}}>Date de publication</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "80px" }}>
            {kit ? renderDocs() : <h2 className="text-align-center margin-top-30 gray-300">Votre conseiller confectionne votre kit</h2>}
          </div>
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    project: state.project,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(mapStateToProps, null)(KitDeFinancement);
