import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../../components/render_initiales"

class FinanceursPotentiels extends Component {

  render(){
    const financers = this.props.financers
    const renderLogo = (financer) => {
      // TODO
      if(false){
        const logo = document.getElementById(`logo_financer${financer.name.toLowerCase()}`)
        logo.style.backgroundImage = `url(${financer.logo})`
      }else{
        const initiales = renderInitiale(`${financer.name}`)
        return initiales
      }
    }

    const renderFinanceurs = () => {
      return financers.map((financer, index) => {
        return (
          <div className="flex space-between align-items-center margin-bottom-30" key={financer.id}>
            <div id={`logo_financer${financer.name.toLowerCase()}`} className="logo-financeur margin-right-15" style={{ height: "35px", width: "35px"}}>
              {renderLogo(financer)}
            </div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">{financer.name}</h4>
              <p className="font-12">Aide sociale de la caisse de...</p>
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
  }
};

function mapStateToProps(state) {
  return {
    financers: state.api.financers,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(FinanceursPotentiels);
