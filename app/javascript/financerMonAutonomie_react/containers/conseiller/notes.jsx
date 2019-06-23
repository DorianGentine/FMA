import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showNotes } from "../../actions"

class RdvTel extends Component {
  render(){
    return (
      <div className="margin-top-30 blue-gray-box" onClick={()=>{this.props.showNotes(null)}}>
        <i className="fas fa-pencil-alt blue"></i>
        <p className="black">Voir les notes du projet</p>
        <p className="blue">00</p>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ showNotes }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RdvTel);
