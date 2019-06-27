import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchConseillers } from '../../actions';

import renderLogo from "../../../components/render_logo"

class MonEquipe extends Component {
  componentWillMount(){
    this.props.fetchConseillers("/api/v1/users/advisors")
  }

  render(){
    const conseillers = this.props.conseillers

    const renderConseillers = () => {
      return conseillers.advisors.map((conseiller, index) => {
        return (
          <div className="flex" key={index}>
            {renderLogo(conseiller)}
            <p className="col-lg-12 font-12 black margin-bottom-15">{`${conseiller.first_name} ${conseiller.last_name}`}</p>
          </div>
        )
      })
    }

    return (
      <div className="margin-top-30 flex-grow-1">
        <div className="flex black align-items-center margin-bottom-30">
          <div className="icon-live margin-right-15"></div>
          Mon équipe de conseillers
        </div>
        <div className="row scroll" style={{ maxHeight: "calc(100vh - 560px)", minHeight: "30px" }}>
          { conseillers != null ? renderConseillers() : <p>Chargement...</p>}
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    conseillers: state.conseillers,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchConseillers }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(MonEquipe);
