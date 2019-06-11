import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Ressources from './ressources';

import renderLogo from "../../../components/render_logo"

class FinanceursPotentiels extends Component {

  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const financers = this.props.project.financers

      const renderFinanceurs = () => {
        return financers.map((financer, index) => {
          const randomId = Math.floor((Math.random() * 100) + 1);
          return (
            <div className="flex space-between align-items-center margin-bottom-30" key={`${financer.name}${randomId}`}>
              {renderLogo(financer)}
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">{financer.name}</h4>
                <p className="font-12">{financer.description ? `${financer.description.substring(0,30)}...` : ""}</p>
              </div>
              <button className="blue-gray-btn">Infos</button>
            </div>
          );
        });
      };

      return (
        <div className="col-lg-6">
          <div className="white-box flex flex-wrap">
            <h4 className="col-lg-9">Financeurs potentiels</h4>
            <p className="bold font-12 col-lg-2">0{financers.length}</p>
            <div className="scroll col-lg-12" style={{ height: "145px" }}>
              {renderFinanceurs()}
            </div>
          </div>
        </div>
      );


    }else if(statut === "conseiller"){

      return (
        <div className="col-lg-6">
          <div className="white-box flex flex-wrap align-items-center">
            <h4 className="padding-horizontal-15 no-margin">Les ressources</h4>
            <p className="blue font-12 padding-horizontal-15" style={{paddingLeft: "unset"}}>{`${2000} ressources`}</p>
            <p className="margin-right-15 text-align-right font-12 icon-arrow-right-gray flex-grow-1"></p>
            <div className="scroll col-lg-12 margin-top-15" style={{ height: "145px" }}>
              <Ressources />
            </div>
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
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(FinanceursPotentiels);
