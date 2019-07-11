import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Document, Page } from 'react-pdf';
import { pdfjs } from 'react-pdf';
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import DropdownList from 'react-widgets/lib/DropdownList'

import { closeModal, showModalPdf } from '../../actions';

class ModalRessource extends Component {
  constructor(props) {
    super(props)
    this.state = {
      numPages: null,
      pageNumber: 1,
      actionsShown: null,
      // value: {
      //   fullName: "",
      //   project: "",
      // },
      added: false,
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

  renderDropdownList = ({ input, data, valueField, textField }) => {
    let datas = []
    for ( let i in data) {
      if(data[i].étape === "progression" || data[i].étape === "evaluation" )
      datas.push({
        fullName: data[i].first_name + " " + data[i].last_name,
        project: data[i].project,
      });
    }

    const check = (value) => {
      const ressource_id = this.props.modal_selected.ressource.id
      const project_id = value.project
    }

    return(
      <DropdownList {...input}
        className="margin-bottom-30"
        data={datas}
        textField={textField}
        valueField={valueField}
        // value={this.state.value}
        // onChange={value => {
        //   this.setState({ value })
        //   check(value)
        // }}
      />
    )
  }

  onSubmit = (values) => {
    const project_id = values.project.project
    const ressource_id = this.props.modal_selected.ressource.id

    // const body = { ressource_id: ressource_id, project_id: project_id }
    // this.props.fetchPostCompte(`/api/v1/projects/${project_id}/kits`, body, "POST", () => {} )
  }

  render(){
    const ressource = this.props.modal_selected.ressource
    const { numPages, pageNumber } = this.state;

    const renderGuide = () => {
      if(ressource.notice){
        return(
          <div className="margin-top-15">
            <Document
              file={ressource.notice}
              onLoadSuccess={this.onDocumentLoadSuccess}
              className="pointer"
              onClick={()=>{this.props.showModalPdf(ressource.notice)}}
            >
              <Page
                pageNumber={this.state.pageNumber}
                className="pdf_css"
              />
            </Document>
            <div className="row margin-top-15 margin-bottom-30">
              <button className="col-lg-2 blue-gray-btn" type="button" disabled={pageNumber <= 1} onClick={this.previousPage}>
                Préc.
              </button>
              <p className="col-lg-8 text-align-center">Page {pageNumber || (numPages ? 1 : '--')} sur {numPages || '--'}</p>
              <button className="col-lg-2 blue-gray-btn" type="button" disabled={pageNumber >= numPages} onClick={this.nextPage}>
                Suiv.
              </button>
            </div>
          </div>
        )
      }else{
        return <p className="text-align-center margin-top-30">Pas de guide</p>
      }
    }
    const renderKit = () => {
      return(
        <div className="margin-top-15">
          <form className="" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
            <p className="black font-14 margin-bottom-15">Bénéficiaire</p>
            <Field
              className="no-padding form-control"
              name="project"
              component={this.renderDropdownList}
              data={this.props.clients.clients}
              valueField="project"
              textField="fullName"
            />
            <button
              className="no-padding btn-blue margin-top-15 offset-7 col-5 text-align-center"
              type="submit"
              disabled={this.props.pristine || this.props.submitting || this.state.added }>
              Envoyer
            </button>
          </form>
        </div>
      )
    }

    const changeAction = (next) => {
      if(this.state.actionsShown === next){
        this.setState({ actionsShown: null })
      }else{
        this.setState({ actionsShown: next })
      }
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Les ressources</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box align-text-center vertical margin-bottom-30 margin-top-30">
          <h4 className="black">{ressource.title}</h4>
          <p className="blue">Conseil en solutions</p>
        </div>
        <p className="black">Actions rapides</p>
        <div className="flex">
          <button
          className="btn font-12 border margin-right-5 flex-grow-1"
          style={{padding: "3px"}}
          onClick={()=>changeAction("guide")}
        >
          Aperçu du guide
        </button>
          <button
          className="btn font-12 border margin-right-5 flex-grow-1"
          style={{padding: "3px"}}
          onClick={()=>changeAction("kit")}
        >
          Ajouter à un kit
        </button>
        </div>
        { this.state.actionsShown === "guide" ? renderGuide() : null}
        { this.state.actionsShown === "kit" ? renderKit() : null}




        <hr className="ligne-horizontal gray-200-background"/>
        <p className="black">Description</p>
        <p>{ressource.description}</p>
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
      </div>
    )
  }
}
        // <a
        //   className="btn font-12 border flex-grow-1"
        //   style={{padding: "3px"}}
        //   href=""
        //   >
        //   Télécharger
        // </a>

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    clients: state.clients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, showModalPdf }, dispatch);
}

export default reduxForm({ form: 'ajoutKit', })(
connect(mapStateToProps, mapDispatchToProps)(ModalRessource)
);



















