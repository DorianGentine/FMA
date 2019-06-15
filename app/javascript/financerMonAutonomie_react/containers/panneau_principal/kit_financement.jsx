import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Financers from './financers'

class KitDeFinancement extends Component {
  render(){
    const kits = this.props.project.kits
    console.log(kits)
    const renderKits = () => {
      return kits.map((kit, index) => {
        return (
          <div className="flex margin-top-15" key={index}>
            <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>{kit.ressource}</p>
            <p className="col-lg-4 font-12">{kit.notice ? kit.notice.substr(kit.notice.lastIndexOf('/') + 1, 25) : ""}</p>
            <p className="col-lg-3 font-12">{kit.formulary ? kit.formulary.substr(kit.notice.lastIndexOf('/') + 1, 20) : ""}</p>
            <p className="col-lg-3 font-12">_____</p>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-6">Découvrez votre kit de financement</h4>
          <p className="bold col-lg-1">2</p>
          <a className="col-lg-5 text-align-right font-12" href="#">{`${ this.props.project.project.etape === "evaluation" ? "Tout télécharger" : ""}`}</a>
          <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
            <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Id</p>
            <p className="col-lg-4 font-12">Notice</p>
            <p className="col-lg-3 font-12">Formulary</p>
            <p className="col-lg-3 font-12" style={{paddingRight: 0}}>Date de publication</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "80px" }}>
            { kits != undefined ? renderKits() : <h2 className="text-align-center margin-top-30 gray-300">Votre conseiller confectionne votre kit</h2>}
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
