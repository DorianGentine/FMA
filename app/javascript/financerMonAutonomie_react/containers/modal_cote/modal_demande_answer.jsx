import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import { closeModal, fetchPostCompte } from '../../actions';
import { postedAgo } from "../../../components/render_date"

class ModalDemandeAnswer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      docs: []
    };
  }

  renderField = ({ input, type, label }) => {
    return(
      <div className="col-12">
        <input {...input}
          className="form-control margin-bottom-30"
          type={type}
          onBlur={event => {input.onBlur(event);}}
        />
      </div>
    )
  }

  onSubmit = (oldValues) => {
    let url = `/api/v1/ressources`
    let method = "POST"
    const notice = this.state.notice

    const values = {
      project_id: this.props.modal_selected.infoProject.project_id,
      title: oldValues.title,
      message: oldValues.message,
      formulary: docs.formulary,
      notice: docs.notice,
      model_1: docs.model_1,
      model_2: docs.model_2,
    }
    console.log("values", values)

    this.props.fetchPostCompte(url, values, method, ()=>{})
    this.props.closeModal()
  }

  render(){
    const demande = this.props.modal_selected.demande
    const beneName = this.props.modal_selected.infoProject.beneName
    const time = postedAgo(new Date(demande.created_at));

    const renderDropZone = (name) => {
      let nameFichier

      const sendDocToState = (formPayLoad) => {
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
        console.log(files)
        if (files && files[0]) {
          nameFichier = files[0].name
          document.getElementById(`doc_${name}`).innerText = nameFichier
          sendDocToState(files[0])
        }
      }

      return (
        <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
          {({getRootProps, getInputProps}) => (
            <div className="pointer margin-bottom-30 font-12 col-12" {...getRootProps()}>
              <input {...getInputProps()} />
              <button id={`doc_${name}`} className="col-12 margin-top-15 app-white-btn">Joindre un fichier</button>
            </div>
          )}
        </Dropzone>
      )
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Demande spécifique</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <form className="row" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
          <p className=" col-12 font-14 font-italic margin-bottom-15">{`Créé il y a ${time}`}</p>

          <p className="col-12 font-14">Catégorie</p>
          <p className="col-12 font-14 black margin-bottom-15">{demande.category}</p>

          <p className="col-6 font-14">Conseiller</p>
          <p className="col-6 font-14">Bénéficiaire</p>
          <p className="col-6 font-14 margin-bottom-15 black">{demande.author.name}</p>
          <p className="col-6 font-14 margin-bottom-15 blue">{beneName}</p>

          <p className="col-12 font-14">Message</p>
          <p className="col-12 font-14 black margin-bottom-15">{demande.description}</p>

          <hr
            className="ligne-horizontal blue-gray-darker-background"
            style={{margin: "15px -30px", width: "calc(100% + 60px)" }}
          />

          <p className="black font-14 margin-bottom-15 col-12">Nom du package</p>
          <Field
            name="titre"
            type="text"
            component={this.renderField}
          />
          <p className="black font-14 margin-bottom-15 col-12">Description</p>
          <Field
            name="description"
            type="text"
            component={this.renderField}
          />

          <p className="black font-14 margin-bottom-15 col-12">Formulaire</p>
          {renderDropZone("formulary")}
          <p className="black font-14 margin-bottom-15 col-12">Notice</p>
          {renderDropZone("notice")}
          <p className="black font-14 margin-bottom-15 col-12">Modèle 1</p>
          {renderDropZone("model_1")}
          <p className="black font-14 margin-bottom-15 col-12">Modèle 2</p>
          {renderDropZone("model_2")}

          <button
            className="btn-blue margin-top-30 offset-6 col-6 text-align-center"
            type="submit"
            disabled={this.props.pristine || this.props.submitting}>
            Envoyer
          </button>
        </form>
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
  return bindActionCreators({ closeModal, fetchPostCompte }, dispatch);
}

export default reduxForm({ form: 'demande_answer', })(
connect(mapStateToProps, mapDispatchToProps)(ModalDemandeAnswer)
);
