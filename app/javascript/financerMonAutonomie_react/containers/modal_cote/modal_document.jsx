import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Document } from 'react-pdf';
import { pdfjs } from 'react-pdf';
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;

import { closeModal } from '../../actions';

class ModalDocument extends Component {
  render(){
    const doc = this.props.modal_selected.doc
    console.log("docnotice", doc.notice)
    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>{`${doc.title.substr(0,25)}...`}</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <Document file={doc.notice} />
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
      </div>
        // <div
        //   className="image-document"
        //   style={{ backgroundImage: `url(${doc.notice})` }}
        // ></div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalDocument);
