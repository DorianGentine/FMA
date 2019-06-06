import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import RenderDocs from "./render_docs"
import ValidationModal from "../beneficiaire/validation_modal"

class DocumentsSoumettre extends Component {
  render(){
    const etape = this.props.etape
    return (
      <div className="col-lg-12 relative">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-4">Documents à soumettre</h4>
          <p className="blue font-12 col-lg-4">Format PDF, PNG ou JPG</p>
          <RenderDocs />
        </div>
        {etape === "documentation" ? <ValidationModal /> : null}
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    etape: state.api.project.etape,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(DocumentsSoumettre);
