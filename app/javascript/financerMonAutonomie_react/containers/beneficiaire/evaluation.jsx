import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showEvaluation } from '../../actions'

import ValidationModal from './validation_modal'

class Evaluation extends Component {
  render(){
    const etape = this.props.project.project.etape
    return (
      <div className="margin-top-30 relative">
        {etape === "evaluation" ? <ValidationModal /> : null}
        <button
          className="btn-evaluation"
          disabled={etape != "evaluation"}
          onClick={()=>{this.props.showEvaluation(this.props.project)}}
          >
          <i className="fas fa-star margin-right-15"></i>
          Évaluer le servicve
        </button>
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
  return bindActionCreators({ showEvaluation }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Evaluation);
