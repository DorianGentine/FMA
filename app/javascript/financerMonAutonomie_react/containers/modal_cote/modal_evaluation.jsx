import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

import { closeModal, fetchPostCompte, fetchRatings, validateStep, fetchProjet } from '../../actions';

import LabelRadio from './label_radio';

class ModalEvaluation extends Component {
  componentWillMount(){
    if(this.props.ratings === null){
      this.props.fetchRatings(this.props.modal_selected.project.project.id)
    }
  }

  renderField = ({ input, nameLabel, label, type, choices }) => {

    if(type === "radio"){
      const renderOptions = () => {

        let choicesMaps = []
        for ( let i in choices) {
          choicesMaps.push(choices[i])
        }

        return choicesMaps.map((choice, index) => {
          return <LabelRadio
            name={nameLabel}
            key={index}
            index={index}
            choice={choice}
            />
        })
      }

      return(
        <div className="margin-bottom-15">
          <label className="black font-14">{label}</label>
          <div>
            {renderOptions()}
          </div>
        </div>
      )
    }else if(type === "text"){
      return(
        <div>
          <label className="black font-14 margin-bottom-15">{label}</label>
          <input {...input}
            className="form-control margin-bottom-30"
            type={type}
            onBlur={event => {input.onBlur(event);}}
          />
        </div>
      )
    }
  }

  onSubmit = (values) => {
    console.log(values)
    let url = `/api/v1/projects/${this.props.modal_selected.project.project.id}/ratings`
    let method = "POST"
    console.log("url", url)

    this.props.fetchPostCompte(url, values, method, ()=>{
      this.props.validateStep(`/api/v1/projects/${this.props.project_id}/next_setp`, ()=>{
        this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
      })
    })
    this.props.closeModal()
  }

  render(){
    const project = this.props.modal_selected.project
    const ratings = this.props.ratings

    const renderForm = () => {
      let ratingsMaps = []
      for ( let i in ratings) {
        ratingsMaps.push(ratings[i])
      }

      return ratingsMaps.map((rating, index) => {
        return <Field key={index}
          name={rating.column}
          nameLabel={rating.column}
          label={rating.question}
          type={rating.type}
          choices={rating.choice}
          component={this.renderField}
        />
      })
    }


    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Créer une demande</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
          <div className="scroll" style={{ maxHeight: "calc(100vh - 240px)"}}>
            {ratings != null ? renderForm() : <p className="text-align-center margin-top-30">Chargement...</p>}
          </div>
          <button
            className="btn-blue margin-top-30 offset-3 col-6 text-align-center"
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
    project_id: state.project_id,
    ratings: state.ratings,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte, fetchRatings, validateStep, fetchProjet }, dispatch);
}

export default reduxForm({ form: 'evaluation', })(
connect(mapStateToProps, mapDispatchToProps)(ModalEvaluation)
);
