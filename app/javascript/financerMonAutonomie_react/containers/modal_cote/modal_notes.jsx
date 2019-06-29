import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

import { closeModal, fetchPostCompte, fetchProjet } from '../../actions';

import renderLogo from "../../../components/render_logo"
import {postedAgo} from "../../../components/render_date"

class ModalNotes extends Component {
  constructor(props) {
    super(props)
    this.state = {
      modifying: false,
      modNoteId: 0,
      uploaded: false,
    };
  }

  componentWillMount(){
    if(this.props.project === null){
      this.props.fetchProjet(`/api/v1/projects/${this.props.api.project.id}`)
    }

    if(this.props.current_api && this.props.current_api.statut === "admin"){
      const note = {
        title: "Fonctionnalité réservée",
        description: "aux conseillers",
      }
      this.handleInitialize(note)
    }
  }

  componentWillReceiveProps(nextProps){
    if(this.state.uploaded){
      const note_zero = {title: "", description: ""}
      this.handleInitialize(note_zero)
      this.setState({ uploaded: false })
    }
  }

  handleInitialize(note) {
    let initData = {
      title: note.title,
      description: note.description,
    };
    this.props.initialize(initData);
  }

  onSubmit = (values) => {
    let url = `/api/v1/projects/${this.props.api.project.id}/notes`
    let method = "POST"

    if(this.state.modifying){
      url = `/api/v1/notes/${this.state.modNoteId}`
      method = "PATCH"
    }

    this.props.fetchPostCompte(url, values, method, ()=>{
      this.props.fetchProjet(`/api/v1/projects/${this.props.api.project.id}`)
    })
    this.setState({ uploaded: true })
  }

  renderField = ({ input, type, label }) => (
    <input {...input}
      className={`form-control margin-bottom-30 ${this.props.current_api && this.props.current_api.statut === "admin" ? "not-allowed" : ""}`}
      disabled={this.props.current_api && this.props.current_api.statut === "admin"}
      type={type}
      onBlur={event => {input.onBlur(event);}}
    />
  )

  render(){
    const notes = this.props.project.notes
    console.log("notes", notes)

    const modifyNote = (note) => {
      this.setState({
        modifying: true,
        modNoteId: note.id,
      })
      this.handleInitialize(note)
    }

    const deleteNote = (note) => {
      this.props.fetchPostCompte(`/api/v1/notes/${note.id}`, null, "DELETE", ()=>{this.props.fetchProjet(`/api/v1/projects/${this.props.api.project.id}`)})
    }

    const renderNotes = () => {
      return notes.map((note, index) => {
        return(
          <div className="margin-bottom-30" key={index}>
            <div className="flex flex-wrap">
              <div className="col-8 black font-12 no-padding">{note.title}</div>
              <div className="col-4 blue font-12 no-padding text-align-right">{`Il y a ${postedAgo(new Date(note.created_at))}`}</div>
              <div className="col-12 font-12 no-padding">{note.description}</div>
              <div className="col-6 no-padding flex">
                <p onClick={()=>{modifyNote(note)}} className="col-6 font-12 no-padding black pointer">modifier</p>
                <p onClick={()=>{deleteNote(note)}} className="col-6 font-12 no-padding black pointer">supprimer</p>
              </div>
            </div>
          </div>
            // <div>{renderLogo(this.props.api.user)}</div>
        )
      })
    }


    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>Notes du projet</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        {renderNotes()}
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
          <p className="black font-14 margin-bottom-15">Titre</p>
          <Field
            name="title"
            type="text"
            component={this.renderField}
          />
          <p className="black font-14 margin-bottom-15">Message</p>
          <Field
            name="description"
            type="text"
            component={this.renderField}
          />
          <button
            className="btn-blue margin-top-30 offset-6 col-6 text-align-center"
            disabled={this.props.current_api && this.props.current_api.statut === "admin" || this.props.pristine || this.props.submitting}
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
    current_api: state.current_api,
    project: state.project,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte, fetchProjet }, dispatch);
}

export default reduxForm({ form: 'note', })(
connect(mapStateToProps, mapDispatchToProps)(ModalNotes)
);
