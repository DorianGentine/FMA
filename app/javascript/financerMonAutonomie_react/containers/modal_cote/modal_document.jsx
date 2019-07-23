import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Document, Page } from 'react-pdf';
import { pdfjs } from 'react-pdf';
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;

import { closeModal, showModalPdf } from '../../actions';

class ModalDocument extends Component {
  constructor(props) {
    super(props)
    this.state = {
      numPages: null,
      pageNumber: 1,
    };
  }

  onDocumentLoadSuccess = (document) => {
    const { numPages } = document;
    this.setState({
      numPages,
      pageNumber: 1,
    });
  };

  changePage = offset => this.setState(prevState => ({
    pageNumber: prevState.pageNumber + offset,
  }));

  previousPage = () => this.changePage(-1);

  nextPage = () => this.changePage(1);

  render(){
    const doc = this.props.modal_selected.doc
    const { numPages, pageNumber } = this.state;

    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>{`${doc.title.substr(0,25)}...`}</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <Document
          file={doc.notice}
          onLoadSuccess={this.onDocumentLoadSuccess}
          className="pointer"
          onClick={()=>{this.props.showModalPdf(doc.notice)}}
        >
          <Page
            pageNumber={this.state.pageNumber}
            className="pdf_css"
            // width={300}
          />
        </Document>
        <div className="row margin-top-15 margin-bottom-30">
          <button className="col-2 blue-gray-btn" type="button" disabled={pageNumber <= 1} onClick={this.previousPage}>
            Préc.
          </button>
          <p className="col-8 text-align-center">Page {pageNumber || (numPages ? 1 : '--')} sur {numPages || '--'}</p>
          <button className="col-2 blue-gray-btn" type="button" disabled={pageNumber >= numPages} onClick={this.nextPage}>
            Suiv.
          </button>
        </div>
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, showModalPdf }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalDocument);
