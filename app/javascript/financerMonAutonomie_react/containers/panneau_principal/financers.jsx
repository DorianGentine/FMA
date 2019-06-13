import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchFinancers, showFinancer } from '../../actions'

import renderLogo from "../../../components/render_logo"

class Financers extends Component {
  componentWillMount(){
    this.props.fetchFinancers("/api/v1/financers")
  }

  render(){
    const financers = this.props.financers

    const renderFinanceurs = () => {
      return financers.financers.map((financer, index) => {
        return (
          <div className="flex space-between align-items-center margin-bottom-15" key={index}>
            {renderLogo(financer)}
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin" style={{paddingLeft: 0}}>{financer.name}</h4>
              <p className="font-12 black">{financer.description ? financer.description.substr(0, 20) : ""}</p>
            </div>
            <p className="font-12 blue-gray-btn center-text" onClick={()=>{this.props.showFinancer(financer)}}>Accéder</p>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Les financeurs</h4>
          <p className="blue font-12 padding-horizontal-15">{`${financers ? financers.financers.length : 0} financeurs`}</p>
          <div className="scroll col-lg-12 margin-top-15" style={{ height: "145px" }}>
            {financers != null ? renderFinanceurs() : <h2>Chargement...</h2> }
          </div>
        </div>
      </div>
          // <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
          //   <p className="col-lg-3 font-12" style={{paddingLeft: 0}}>Nom</p>
          //   <p className="col-lg-9 font-12" style={{paddingRight: 0}}>Description</p>
          // </div>

          // <div className="input-wth-icon search-app margin-left-auto">
          //   <i className="fas fa-search"></i>
          //   <input type="text" placeholder="Rechercher une ressource" style={{width: "100%"}} />
          // </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    financers: state.financers,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchFinancers, showFinancer }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Financers);
