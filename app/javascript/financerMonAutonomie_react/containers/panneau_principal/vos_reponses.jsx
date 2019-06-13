import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showReponses } from '../../actions'

import renderLogo from "../../../components/render_logo"
import renderInitiale from "../../../components/render_initiales"

class VosReponses extends Component {

  render(){
    const users = this.props.project.formularies

    const renderUsers = () => {
      return users.map((user, index) => {
        return (
          <div className="flex space-between margin-bottom-30" key={user.id}>
            <div className="margin-right-15" style={{ marginLeft: 0 }}>{renderLogo(user)}</div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">Bénéficiaire {index + 1}:</h4>
              <p className="font-12">{user.first_name}</p>
            </div>
            <button className="blue-gray-btn" onClick={()=>{this.props.showReponses(user, index)}}>Voir les réponses</button>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-12">Vos réponses</h4>
          <div className="scroll col-lg-12 align-items-center" style={{ height: "145px" }}>
            {renderUsers()}
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
  return bindActionCreators({ showReponses }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(VosReponses);
