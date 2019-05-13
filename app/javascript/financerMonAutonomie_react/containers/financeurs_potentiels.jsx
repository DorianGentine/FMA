import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../components/render_initiales"

class FinanceursPotentiels extends Component {

  render(){
    const solutions = this.props.solutions
    const renderLogo = (financer_id) => {
      if(financer_id.logo){
        const logo = document.getElementById(`logo_financer${solution.financer_id}`)
        logo.style.backgroundImage = `url(${xxx})`
      }else{
        const initiales = renderInitiale(`${financer_id}`)
        return initiales
      }
    }

    const renderFinanceurs = () => {
      return solutions.map((solution, index) => {
        return (
          <div className="flex space-between margin-bottom-30" key={solution.id}>
            <div id={`logo_financer${solution.financer_id}`} className="logo-financeur margin-right-15" style={{ height: "35px", width: "35px"}}>
              {renderLogo(solution.financer_id)}
            </div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">La caisse de retraite principale</h4>
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
          <p className="bold font-12 col-lg-2">{solutions.length}</p>
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
    solutions: state.api.solutions,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(FinanceursPotentiels);
