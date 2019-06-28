import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import { closeModal, fetchPostCompte } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalCreateRessource extends Component {

  onSubmit = (values) => {
    console.log("values", values)
    console.log("this.props.api.project.id", this.props.api.project.id)
    let url = `/api/v1/projects/${this.props.api.project.id}/notes`
    let method = "POST"

    this.props.fetchPostCompte(url, values, method, ()=>{})
    this.props.closeModal()
  }

  renderField = ({ input, type, label }) => (
    <input {...input}
      className="form-control margin-bottom-30"
      type={type}
      onBlur={event => {input.onBlur(event);}}
    />
  )

  render(){
    const readFile = (files) => {
      if (files && files[0]) {
        console.log(files[0])
        let formPayLoad = new FormData();
        formPayLoad.append('uploaded_image', files[0]);
        sendImageToController(formPayLoad)
      }
    }
    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>Notes du projet</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
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
          <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
            {({getRootProps, getInputProps}) => (
              <div className="photo-compte relative pointer" {...getRootProps()}>
                <input {...getInputProps()} />
                {renderLogo(user)}
                <div className="btn-light btn-light-compte absolute"></div>
              </div>
            )}
          </Dropzone>
          <p className="black font-14 margin-bottom-15">Notice</p>
          <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
            {({getRootProps, getInputProps}) => (
              <div className="photo-compte relative pointer" {...getRootProps()}>
                <input {...getInputProps()} />
                {renderLogo(user)}
                <div className="btn-light btn-light-compte absolute"></div>
              </div>
            )}
          </Dropzone>
          <p className="black font-14 margin-bottom-15">Modèle 1</p>
          <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
            {({getRootProps, getInputProps}) => (
              <div className="photo-compte relative pointer" {...getRootProps()}>
                <input {...getInputProps()} />
                {renderLogo(user)}
                <div className="btn-light btn-light-compte absolute"></div>
              </div>
            )}
          </Dropzone>
          <p className="black font-14 margin-bottom-15">Modèle 2</p>
          <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
            {({getRootProps, getInputProps}) => (
              <div className="photo-compte relative pointer" {...getRootProps()}>
                <input {...getInputProps()} />
                {renderLogo(user)}
                <div className="btn-light btn-light-compte absolute"></div>
              </div>
            )}
          </Dropzone>
          <button
            className="btn-blue margin-top-30 offset-6 col-6 text-align-center"
            type="submit"
            >
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
  return bindActionCreators({ closeModal, fetchPostCompte }, dispatch);
}

export default reduxForm({ form: 'note', })(
connect(mapStateToProps, mapDispatchToProps)(ModalCreateRessource)
);
