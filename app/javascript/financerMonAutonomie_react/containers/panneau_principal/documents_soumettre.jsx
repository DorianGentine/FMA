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
        {etape === "documentation" ? <ValidationModal /> : null}
        <div className="white-box flex flex-wrap align-items-baseline">
          <h4 className="margin-right-15">Documents à soumettre</h4>
          {this.props.isMobile ? null : <p className="blue font-12">Format PDF, PNG ou JPG</p>}
          <RenderDocs />
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    etape: state.project.project.etape,
    isMobile: state.isMobile,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(DocumentsSoumettre);
