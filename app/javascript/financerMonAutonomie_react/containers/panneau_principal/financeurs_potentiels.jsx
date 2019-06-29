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
        const showHint = () => {
          const hintText = document.getElementById(`hint${index}`)
          hintText.classList.toggle("d-none")
        }
        return (
        <div className="icon-alert relative pointer text-align-right" onClick={showHint}>
          <div
            id={`hint${index}`}
            className="red-background white d-none absolute margin-right-15"
            style={{padding: "20px", right: "-80px", top: "32px", width: "400px", borderRadius: "3px", zIndex: "10"}}
          >
            <h4 className="white">Informations supplémentaires:</h4>
            <p><ul>{financer.unmatched} </ul> <strong>Sachez que ces financeurs ne peuvent être cumulés. Vous aurez donc à faire un choix entre l'un d'entre eux si vous les sollicitez.</strong></p>
          </div>
        </div>
        );
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
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-9">Financeurs potentiels</h4>
          <p className="bold font-12 col-lg-2">{financers.length}</p>
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
