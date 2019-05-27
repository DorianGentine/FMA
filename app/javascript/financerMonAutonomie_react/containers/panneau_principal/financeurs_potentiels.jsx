import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../../components/render_initiales"

class FinanceursPotentiels extends Component {

  componentDidMount(){()=>{console.log("COUCOu2")}}

  render(){
    const financers = this.props.financers

    const renderLogo = (financer) => {
      if(financer.logo != null){
        return(
          <div
            id={`logo_financer${financer.name.split(" ")[0].toLowerCase()}`}
            className="logo-financeur margin-right-15"
            style={{ height: "35px", width: "35px", backgroundImage: `url(${financer.logo})`}}
            >
          </div>
        )
      }else{
        return(
          <div
            id={`logo_financer${financer.name.split(" ")[0].toLowerCase()}`}
            className="logo-financeur margin-right-15"
            style={{ height: "35px", width: "35px"}}
            >{renderInitiale(`${financer.name}`)}
          </div>
        )
      }
    }

    const renderFinanceurs = () => {
      return financers.map((financer, index) => {
        return (
          <div className="flex space-between align-items-center margin-bottom-30" key={financer.name}>
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
