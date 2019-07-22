import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
// import Multiselect from 'react-widgets/lib/Multiselect'

import {
  fetchAPI,
  fetchFORM,
  fetchProjet,
  fetchPostForm,
  fetchPostCompte,
  validateStep,
  changeBeneficiaireForm,
} from '../../actions';

import ValidationModal from "../beneficiaire/validation_modal"
import RenderDropdownList from "./render_dropdown_list"
import RenderMultiSelect from "./render_multi_select"

import 'react-widgets/dist/css/react-widgets.css'

class PanneauPrincipalForm extends Component {
  constructor(props){
    super(props)
    this.state = {
      beneficiaireActif: 1,
      certified: true,
      changedToNewBene: false,
      envoiEnCours: false,
      formResults: this.props.formResults,
      infoIncomplete: 0,
      multiple_beneficiaires: false,
      valueToAdd: {
        name: null,
        value: null,
      },
    }
  }

  componentWillMount() {
    if(this.props.formulary_id != this.props.formulary_ids[0]){
      this.props.changeBeneficiaireForm(this.props.formulary_ids[0])
    }
  }
  componentDidMount(){
    if(this.props.formulary_id === this.props.formulary_ids[0]){
      this.handleInitialize(this.props.formResults)
    }
  }

  componentWillReceiveProps(nextProps) {
    if(nextProps.formulary_id === "add" && nextProps.formulary_id != this.props.formulary_id){
      this.setState({ formResults:  null })
      this.props.fetchFORM(`/api/v1/projects/${this.props.project_id}/formularies/new`)
    }else if (nextProps.formulary_id != this.props.formulary_id) {
      this.setState({ formResults:  null })
      this.props.fetchFORM(`/api/v1/formularies/${nextProps.formulary_id}/edit`)
    }

    if(nextProps.formResults != null && nextProps.formResults != this.props.formResults){
      this.handleInitialize(nextProps.formResults)
      this.setState({ formResults:  nextProps.formResults })
    }

    if(nextProps.project.formularies.length != this.props.project.formularies.length && !this.state.changedToNewBene){
      this.setState({ changedToNewBene: true })
      const formularyIdNewUser = nextProps.formulary_ids[nextProps.project.formularies.length - 1]
      this.props.changeBeneficiaireForm(formularyIdNewUser)
    }

    if(this.props.formResults != null && this.props.formResults.length > 0 ){
      this.props.formResults.map((result, index) => {
        if(result.set_up.column_name === "occupant"){
          if(result.answer > this.props.formulary_ids.length){
            this.setState({ multiple_beneficiaires: true })
          }else{
            this.setState({ multiple_beneficiaires: false })
          }
        }
      })
    }
  }

  handleInitialize(formResults) {
    let initData = {};

    for ( let i in formResults) {
      if( formResults[i].set_up.need_answer ){
        initData[formResults[i].set_up.column_name] = formResults[i].answer;
      }
    }

    this.props.initialize(initData);
  }

  onSubmit = (values) => {
    // remplace la valeur à ajouter
    if(this.state.valueToAdd.name != null){
      values[this.state.valueToAdd.name] = this.state.valueToAdd.value
    }
    // corrige la valeur en supprimant "text" de l'objet value
    for( let i in values){
      if(values[i] && values[i].text){
        values[i] = values[i].value
      }
    }

    if(this.props.formulary_id === "add"){
      this.props.fetchPostForm(`/api/v1/projects/${this.props.project_id}/formularies`, values, "POST")
      .then(()=>{
        this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
        this.setState({
          changedToNewBene: false,
          envoiEnCours: false
        })
      })
    }else{
      this.props.fetchPostForm(`/api/v1/formularies/${this.props.formulary_id}`, values, "PATCH")
      .then(()=>{
        this.props.fetchFORM(`/api/v1/formularies/${this.props.formulary_id}/edit`)
        this.setState({
          envoiEnCours: false,
          valueToAdd: { name: null, value: null, },
        })
      })
    }
  }

  renderField = ({ input, label, type, submitButton, meta: { touched, error } }) => (
    <div className="form-group">
      <label className="font-14 black">{label}</label>
      <div>
        <input {...input}
          className="margin-bottom-15 form-control"
          type={type}
          onBlur={event => {
            input.onBlur(event);
            submitButton.click();
          }}
          disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
        />
        {touched && (error && <span>{error}</span>)}
      </div>
    </div>
  )

  checkInfos = async () => {
    this.setState({ infoIncomplete: 0 })
    const formulary_ids = this.props.formulary_ids
    for(let i = 0; i < formulary_ids.length; i++ ){
      let response = await fetch(`/api/v1/formularies/${formulary_ids[i]}/edit`)

      if(response.ok){
        response = await response.json()
        for(let j = 0; j < response.length; j++ ){
          if(response[j].answer === null){
            this.setState(prevState => ({ infoIncomplete: prevState.infoIncomplete + 1 }))
          }
        }
      }else{
        console.error(`fonction checkInfos ne passe pas pour le formulary_id ${formulary_ids[i]}`)
      }
    }
  }

  render(){
    const submitButton = document.getElementById('btn-validation-infos')
    const etape = this.props.project.project.etape


    const renderInput = (result) => {
      if(result.set_up.type == "input" || result.set_up.type == "number"){
        return(
          <Field
            name={result.set_up.column_name}
            type={result.set_up.type}
            component={this.renderField}
            label={result.set_up.question}
            submitButton={submitButton}
          >
          </Field>
        )
      }else if(result.set_up.type == "select"){
        const clickButton = (name, value) => {
          this.setState({ envoiEnCours: true, })
          this.setState(prevState => {
            let valueToAdd = Object.assign({}, prevState.valueToAdd);
            valueToAdd["name"] = name
            valueToAdd.value = value
            return { valueToAdd }
          })
          submitButton.disabled = false,
          submitButton.click()
          setTimeout(submitButton.disabled = true, 100)
        }
        const renderOptions = (data, multiple) => {
          let options = []
          if(multiple){
            for ( let i in data) {
              options.push(<option key={i} value={data[i]} >{data[i]}</option>);
            }
          }
          else{
            for ( let i in data) {
              options.push({ text: data[i], value: i, });
            }
          }
          return options
        }

        let data = renderOptions(result.set_up.data, result.set_up.multiple_answers)
        if(result.set_up.multiple_answers){
          return <RenderMultiSelect submitting={this.state.envoiEnCours} valueInitial={result.answer} label={result.set_up.question} name={result.set_up.column_name} data={data} clickButton={clickButton} />

        }else{ // Multiple select
          return <RenderDropdownList submitting={this.state.envoiEnCours} valueInitial={result.answer} label={result.set_up.question} name={result.set_up.column_name} data={data} clickButton={clickButton} />

        }
      }
    }

    const renderForm = (formResults) => {
      if(formResults != null && formResults.length > 0 ){
        return formResults.map((result, index) => {
          if(result.set_up.need_answer == true){
            return(
              <div key={result.set_up.id}>
                {renderInput(result)}
              </div>
            )
          }
        });
      }
    }

    const renderBeneficiaires = () => {
      return this.props.formulary_ids.map((formulary_id, index) => {
        return (
          <div className={`btn-select-onglet ${formulary_id == this.props.formulary_id ? 'active' : null}`} key={index}>
            <h4
              className="no-margin"
              data-benef-index={formulary_id}
              onClick={() => {
                this.setState({ beneficiaireActif: index + 1 })
                this.props.changeBeneficiaireForm(event)
              }}>
                Bénéficiaire&nbsp;{index+1}
            </h4>
            {index === 0 ? null :
              <i
                onClick={()=>{
                  this.props.fetchPostCompte(`/api/v1/formularies/${formulary_id}`, null, "DELETE", ()=>{this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)})
                }}
                className="red far fa-trash-alt margin-left-15">
              </i>
            }
          </div>
        )
      })
    }



    return (
      <div className="col-lg-12">
        <div className="flex space-between">
          <div className="flex">
            {renderBeneficiaires()}
            {this.state.multiple_beneficiaires ?
              <h4
                className={`no-margin btn-select-onglet ${"add" == this.props.formulary_id ? 'active' : null}`}
                data-benef-index="add"
                onClick={() => {
                  this.setState({ beneficiaireActif: null })
                  this.props.changeBeneficiaireForm(event)
                }}>
                  Ajouter un bénéficiaire
              </h4>
            : null}
          </div>
        </div>
        <div className="flex flex-column white-box relative">
          {etape === "validation_data" ? <ValidationModal /> : null}

          {this.state.beneficiaireActif ?
            <h2 className="margin-bottom-30">Validation des réponses du <strong className="blue">Bénéficiaire {this.state.beneficiaireActif}</strong></h2> :
            <h2 className="margin-bottom-30">Ajout d'un nouveau <strong className="blue">Bénéficiaire</strong></h2>
          }

          <form onSubmit={this.props.handleSubmit(values => {
              setTimeout(()=> {this.onSubmit(values)}, 10)
            })}>
            {this.state.formResults ? renderForm(this.state.formResults) : <p className="text-align-center">Chargement...</p>}
            <button
              id="btn-validation-infos"
              type="submit"
              disabled={this.props.pristine || this.props.submitting}>
                Vos informations ont bien été enregistrées
            </button>
          </form>

          <div className={`flex align-items-center margin-top-60 ${this.props.formulary_id === "add" ? "d-none" : ""}`}>
            <label className="custom-checkbox-form black font-14">Je certifie la véracité de mes réponses
              <input className="margin-right-15" type="checkbox" value={!this.state.certified} onClick={()=>{
                this.checkInfos()
                this.setState((prevState) => { return { certified: !prevState.certified}; });
              } }/>
              <span className="checkmark"></span>
            </label>
          </div>
          {this.state.certified || this.state.infoIncomplete === 0 ? null :
            <p className="margin-bottom-15 red font-14">{this.state.infoIncomplete === 1 ? `${this.state.infoIncomplete} question est sans réponse 😟` : `${this.state.infoIncomplete} questions sont sans réponses 😟` }</p>
          }
          <button
            className={`
              btn-blue
              margin-bottom-30
              font-14
              align-self-baseline
              ${this.props.formulary_id === "add" ? "d-none" : ""}
            `}
            disabled={this.props.otherUser || this.state.certified || this.state.infoIncomplete != 0}
            style={{padding: "5px 55px"}}
            onClick={ etape === "validation_data" && !this.props.otherUser ? () => { // désactive bouton si pas bonne étape et si user pas bon
              this.props.validateStep(`/api/v1/projects/${this.props.project_id}/next_setp`,
                () => { this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`) }
              )
            } : ()=>{} }>
              Valider cette étape
          </button>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    formulary_id: state.formulary_id,
    formulary_ids: state.project.project.formulary_ids,
    formResults: state.formResults,
    project_id: state.project_id,
    project: state.project,
    otherUser: state.otherUser,
    urlAPI: state.urlAPI,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    fetchAPI,
    fetchFORM,
    fetchProjet,
    fetchPostForm,
    fetchPostCompte,
    validateStep,
    changeBeneficiaireForm,
  }, dispatch);
}

export default reduxForm({ form: 'validationForm', })(
connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalForm)
);















