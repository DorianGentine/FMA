import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

import { closeModal, fetchPostCompte } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalNotes extends Component {

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
    const notes = this.props.modal_selected.notes

    const renderNotes = () => {
      // return notes.map((answer, index) => {
        return(
          <div className="flex margin-bottom-30">
            <div>{renderLogo(this.props.api.user)}</div>
            <div className="flex flex-wrap">
              <div className="col-10 black font-12 no-padding">Wireframe for new prototypage de la ...</div>
              <div className="col-2 blue font-12 no-padding">Il y a 1h</div>
              <div className="col-12 font-12 no-padding">Bonjour je viens de formuler une demande spécifique concernant le dossier.</div>
              <div className="col-6 no-padding flex">
                <a href="#" className="col-6 font-12 no-padding black">modifier</a>
                <a href="#" className="col-6 font-12 no-padding black">supprimer</a>
              </div>
            </div>
          </div>
        )
      // }
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
            type="submit"
            // onClick={this.props.closeModal}
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
connect(mapStateToProps, mapDispatchToProps)(ModalNotes)
);
