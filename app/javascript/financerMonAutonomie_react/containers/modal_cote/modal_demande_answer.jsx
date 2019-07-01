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
      // nbDocs: 1,
      docs: [],
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
    const docs = this.state.docs

    const values = {
      project_id: this.props.modal_selected.infoProject.project_id,
      name: oldValues.name,
      message: oldValues.message,
      docs: docs,
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
        let updatedDocs = Object.assign({}, this.state.docs, { documentJoint: formPayLoad });

        this.setState({
          docs: updatedDocs
        })
      }

      const readFile = (files) => {
        console.log(files)
        if (files && files[0]) {
          nameFichier = files[0].name
          document.getElementById(`doc_joint_${name}`).innerText = nameFichier
          sendDocToState(files[0])
        }
      }

      return (
        <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
          {({getRootProps, getInputProps}) => (
            <div className="pointer margin-bottom-30 font-12 col-12" {...getRootProps()}>
              <input {...getInputProps()} />
              <button id={`doc_joint_${name}`} className="col-12 margin-top-15 app-white-btn">Joindre un fichier à cette demande</button>
            </div>
          )}
        </Dropzone>
      )
    }

    // const renderDropZones = (name) => {
    //   console.log(this.state.nbDocs)
    //   for (var i = this.state.nbDocs; i >= 1; i--) {
    //     console.log(i)
    //     const nameDoc = `${name}${i}`
    //     renderDropZone(nameDoc)
    //   }
    // }

    // const addDoc = () => this.setState(prevState => ({
    //   nbDocs: prevState.nbDocs + 1
    // }))

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

          {renderDropZone("documentJoint")}

          <p className="black font-14 margin-bottom-15 col-12">Nom du package</p>
          <Field
            name="name"
            type="text"
            component={this.renderField}
          />
          <p className="black font-14 margin-bottom-15 col-12">Message</p>
          <Field
            name="message"
            type="text"
            component={this.renderField}
          />

          <button
            className="btn-blue margin-top-30 offset-6 col-6 text-align-center"
            type="submit"
            disabled={this.props.pristine || this.props.submitting}>
            Envoyer
          </button>
        </form>
      </div>
          // <p
          //   className="col-6 offset-6 blue font-12 margin-bottom-30 text-align-right pointer"
          //   onClick={addDoc}
          //   >Ajouter un fichier
          // </p>
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
