import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Ressources from './ressources';

import { showFinancer } from '../../actions'

import renderLogo from "../../../components/render_logo"

class FinanceursPotentiels extends Component {

  render(){
    const financers = this.props.project.financers

    const renderUnmatch = (financer, index) => {
      if (financer.unmatched) {
        return <div
          className="icon-alert pointer text-align-right margin-right-15"
          onClick={()=>{this.props.showFinancer(financer)}}>
        </div>
      }
    }


    const renderFinanceurs = () => {
      return financers.map((financer, index) => {

        return (
          <div className="flex space-between align-items-center margin-bottom-30" key={index}>
            {renderLogo(financer)}
            <div className="flex-grow-1 margin-right-15">
              <h4 className="font-12 no-margin">{financer.name}</h4>
              <p className="font-12">{financer.description ? `${financer.description.substring(0,20)}...` : ""}</p>
            </div>
            {renderUnmatch(financer, index)}
            <button className="blue-gray-btn" onClick={()=>{this.props.showFinancer(financer)}}>Infos</button>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-baseline">
          <h4 className="margin-right-15">Financeurs potentiels</h4>
          <p className="bold font-14">{financers.length}</p>
          <div className="scroll col-lg-12" style={{ height: "145px" }}>
            {renderFinanceurs()}
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

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ showFinancer }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(FinanceursPotentiels);
