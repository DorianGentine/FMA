import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import { closeModal, fetchPostCompte, fetchRessources } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalCreateRessource extends Component {
  constructor(props) {
    super(props)
    this.state = {
      docs: [],
      btnPushed: false,
    };
  }


  onSubmit = async (oldValues) => {
    let url = `/api/v1/ressources`
    let method = "POST"
    const docs = this.state.docs

    let formData = new FormData();
    formData.append('ressource[title]', oldValues.title);
    formData.append('ressource[description]', oldValues.description);
    formData.append('ressource[formulary]', docs.formulary);
    formData.append('ressource[notice]', docs.notice);
    formData.append('ressource[model_1]', docs.model_1);
    formData.append('ressource[model_2]', docs.model_2);

    let response = await fetch(url, {
      credentials: 'same-origin',
      headers: {},
      method: method,
      body: formData,
    })
    console.log(response)
    if(response.ok){
      response = await response.json();
      this.props.fetchRessources(url)
      this.setState({ btnPushed: false })
      this.props.closeModal()
    }
  }

  renderField = ({ input, type, label }) => (
    <input {...input}
      className="form-control margin-bottom-30"
      type={type}
      onBlur={event => {input.onBlur(event);}}
    />
  )

  render(){
    const renderDropZone = (name) => {
      let nameFichier

      const sendDocToState = async (formPayLoad) => {
        let updatedDocs
        if( name === "formulary"){
          updatedDocs = Object.assign({}, this.state.docs, { formulary: formPayLoad });
        }else if( name === "notice"){
          updatedDocs = Object.assign({}, this.state.docs, { notice: formPayLoad });
        }else if( name === "model_1"){
          updatedDocs = Object.assign({}, this.state.docs, { model_1: formPayLoad });
        }else if( name === "model_2"){
          updatedDocs = Object.assign({}, this.state.docs, { model_2: formPayLoad });
        }

        this.setState({
          docs: updatedDocs
        })
      }

      const readFile = (files) => {
        if (files && files[0]) {
          nameFichier = files[0].name
          document.getElementById(`creation_ressource_${name}`).innerText = nameFichier
          sendDocToState(files[0])
        }
      }

      return (
        <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
          {({getRootProps, getInputProps}) => (
            <div className="pointer margin-bottom-30 font-12" id={`creation_ressource_${name}`} {...getRootProps()}>
              <input {...getInputProps()} />
              Ajouter votre fichier
            </div>
          )}
        </Dropzone>
      )
    }

    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>Création ressource</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {
          this.setState({ btnPushed: true })
          this.onSubmit(values)
        })}>
          <p className="black font-14 margin-bottom-15">Titre</p>
          <Field
            name="title"
            type="text"
            component={this.renderField}
          />
          <p className="black font-14 margin-bottom-15">Description</p>
          <Field
            name="description"
            type="text"
            component={this.renderField}
          />
          <p className="black font-14 margin-bottom-15">Formulaire</p>
          {renderDropZone("formulary")}
          <p className="black font-14 margin-bottom-15">Notice</p>
          {renderDropZone("notice")}
          <p className="black font-14 margin-bottom-15">Modèle 1</p>
          {renderDropZone("model_1")}
          <p className="black font-14 margin-bottom-15">Modèle 2</p>
          {renderDropZone("model_2")}
          <button
            className="btn-blue margin-top-30 offset-6 col-6 text-align-center"
            type="submit"
            disabled={this.props.pristine || this.props.submitting || this.state.btnPushed }>
            Ajouter
          </button>
        </form>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    api: state.api,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte, fetchRessources }, dispatch);
}

export default reduxForm({ form: 'note', })(
connect(mapStateToProps, mapDispatchToProps)(ModalCreateRessource)
);
