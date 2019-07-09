import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Document, Page } from 'react-pdf';
import { pdfjs } from 'react-pdf';
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;

import { closeModalPdf, showModalPdf } from '../actions';

class ModalPdf extends Component {
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
    const doc = this.props.modal_pdf
    const { numPages, pageNumber } = this.state;

    return(
      <div className="fixed scroll" style={{
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          backgroundColor: "rgba(0,0,0,.7)",
          zIndex: 15,
        }}>
        <i className="float-right margin-top-30 margin-right-30 white far fa-times-circle pointer" onClick={this.props.closeModalPdf}></i>
        <div
          className="flex flex-column align-items-center margin-top-30 margin-bottom-30"
          // onClick={this.props.closeModalPdf}
          >
          <Document
            file={doc}
            onLoadSuccess={this.onDocumentLoadSuccess}
          >
            <Page
              className= "margin-auto"
              pageNumber={this.state.pageNumber}
              // className="pdf_css"
              // width={300}
            />
          </Document>
          <div className="row margin-top-15 margin-bottom-30">
            <button className="blue-gray-btn" type="button" disabled={pageNumber <= 1} onClick={this.previousPage}>
              Préc.
            </button>
            <p className="text-align-center margin-right-15 margin-left-15">Page {pageNumber || (numPages ? 1 : '--')} sur {numPages || '--'}</p>
            <button className="blue-gray-btn" type="button" disabled={pageNumber >= numPages} onClick={this.nextPage}>
              Suiv.
            </button>
          </div>
        </div>
      </div>
        // <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center">Fermer</button>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_pdf: state.modal_pdf
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModalPdf, showModalPdf }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalPdf);
