import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Ressources from './ressources';
import Financers from './financers'

import { showFinancer } from '../../actions'

import renderLogo from "../../../components/render_logo"

class FinanceursPotentiels extends Component {

  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const financers = this.props.project.financers

      const renderFinanceurs = () => {
        return financers.map((financer, index) => {
          return (
            <div className="flex space-between align-items-center margin-bottom-30" key={index}>
              {renderLogo(financer)}
              <div className="flex-grow-1">
                <h4 className="font-12 no-margin">{financer.name}</h4>
                <p className="font-12">{financer.description ? `${financer.description.substring(0,30)}...` : ""}</p>
              </div>
              <button className="blue-gray-btn" onClick={()=>{this.props.showFinancer(financer)}}>Infos</button>
            </div>
          );
        });
      };

      return (
        <div className="col-lg-6">
          <div className="white-box flex flex-wrap">
            <h4 className="col-lg-9">Financeurs potentiels</h4>
            <p className="bold font-12 col-lg-2">{financers.length}</p>
            <div className="scroll col-lg-12" style={{ height: "145px" }}>
              {renderFinanceurs()}
            </div>
          </div>
        </div>
      );


    }else if(statut === "conseiller"){

      return <Financers />
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    project: state.project,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ showFinancer }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(FinanceursPotentiels);
