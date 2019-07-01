import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Multiselect from 'react-widgets/lib/Multiselect'
import DropdownList from 'react-widgets/lib/DropdownList'

import {
  fetchAPI,
  fetchFORM,
  fetchProjet,
  fetchPostForm,
  validateStep,
  changeBeneficiaireForm,
} from '../../actions';

import ValidationModal from "../beneficiaire/validation_modal"
import RenderDropdownList from "./render_dropdown_list"

import 'react-widgets/dist/css/react-widgets.css'

class PanneauPrincipalForm extends Component {
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
    if(nextProps.formulary_id === "add" && nextProps.formulary_id !== this.props.formulary_id){
      this.props.fetchFORM(`/api/v1/projects/${this.props.project_id}/formularies/new`)
    }else if (nextProps.formulary_id !== this.props.formulary_id) {
      this.props.fetchFORM(`/api/v1/formularies/${nextProps.formulary_id}/edit`)
    }

    if(nextProps.formResults != null && nextProps.formResults != this.props.formResults){
      this.handleInitialize(nextProps.formResults)
    }

    if(nextProps.project.formularies.length != this.props.project.formularies.length){
      const formularyIdNewUser = nextProps.formulary_ids[nextProps.project.formularies.length - 1]
      this.props.changeBeneficiaireForm(formularyIdNewUser)
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
    console.log('values', values)
    if(this.props.formulary_id === "add"){
      this.props.fetchPostForm(`/api/v1/projects/${this.props.project_id}/formularies`, values, "POST")
      .then(()=>{
        this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
      })
    }else{
      console.log(values)
      this.props.fetchPostForm(`/api/v1/formularies/${this.props.formulary_id}`, values, "PATCH")
      .then(()=>{
        this.props.fetchFORM(`/api/v1/formularies/${this.props.formulary_id}/edit`)
      })
    }
  }

  renderField = ({ input, label, type, submitButton }) => (
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
      </div>
    </div>
  )

  handleClickBenef = (event) => {
    this.props.changeBeneficiaireForm(event)
  }


  render(){
    const submitButton = document.getElementById('btn-validation-infos')
    const etape = this.props.project.project.etape

    const renderOptions = (data) => {
      let options = []
      for ( let i in data) {
        options.push(<option key={i} value={data[i]} >{data[i]}</option>);
      }
      return options
    }

    const renderMultiselect = ({ input, data, valueField, textField }) => {
      let datas = []
      for ( let i in data) {
        datas.push(data[i].props.value);
      }

      let splitValue = []
      if(input.value == ""){
        splitValue = splitValue
      }else if(typeof input.value == "string"){
        splitValue = input.value.split(', ')
        // console.log("input.value", input.value)
        // console.log("splitValue", splitValue)
        // if(splitValue.length > 1){
        //   splitValue[0] = splitValue[0].substr(splitValue[0].lastIndexOf(splitValue[0].lastIndexOf('"')))
        //   splitValue[splitValue.length - 1] = splitValue[splitValue.length -1].slice(0, -2);
        // }
      }else{
        splitValue = input.value
      }

      return(
        <Multiselect {...input}
        onBlur={() => {
          input.onBlur();
          submitButton.click();
        }}
        disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
        value={splitValue} // requires value to be an array
        data={datas}
        valueField={valueField}
        textField={textField}
        />
      )
    }

    // const renderDropdownList = ({ input, data, valueField, textField }) => {
    //   let datas = []
    //   for ( let i in data) {
    //     datas.push(data[i].props.value);
    //   }

    //   return(
    //     <DropdownList {...input}
    //       data={datas}
    //       disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
    //       value={this.state.value}
    //       onChange={value => this.setState({ value })}
    //     />
    //   )
    // }


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
        if(result.set_up.multiple_answers == false){
          console.log("result", result)
          let data = renderOptions(result.set_up.data)
          return <RenderDropdownList valueInitial={result.answer} label={result.set_up.question} name={result.set_up.column_name} data={data} submitButton={submitButton} />

          // return(
          //   <div className="form-group">
          //     <label className="font-14 black">{result.set_up.question}</label>
          //     <Field
          //       className="margin-bottom-15 no-padding form-control"
          //       name={result.set_up.column_name}
          //       component={renderDropdownList}
          //       data={renderOptions(result.set_up.data)}
          //     />
          //   </div>
          // )

        }else{ // Multiple select
          return(
            <div className="form-group">
              <label className="font-14 black">{result.set_up.question}</label>
              <Field
                className="margin-bottom-15 no-padding form-control"
                name={result.set_up.column_name}
                component={renderMultiselect}
                data={renderOptions(result.set_up.data)}
              >
              </Field>
            </div>
          )
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
          <h4
            className={`no-margin btn-select-onglet ${formulary_id == this.props.formulary_id ? 'active' : null}`}
            data-benef-index={formulary_id}
            onClick={() => {this.handleClickBenef(event)} }
            key={formulary_id}>
              Bénéficiaire {index+1}
          </h4>
        )
      })
    }


    return (
      <div className="col-lg-12">
        <div className="flex space-between">
          <div className="flex">
            {renderBeneficiaires()}
            <h4
              className={`no-margin btn-select-onglet ${"add" == this.props.formulary_id ? 'active' : null}`}
              data-benef-index="add"
              onClick={() => {this.handleClickBenef(event)} }>
                +
            </h4>
          </div>
        </div>
        <div className="flex flex-column white-box relative">
          {etape === "validation_data" ? <ValidationModal /> : null}
          <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
            {renderForm(this.props.formResults)}
            <button
              id="btn-validation-infos"
              type="submit"
              disabled={this.props.pristine || this.props.submitting}>
                Vos informations ont bien été enregistrées
            </button>
          </form>
          <button
            className={`
              btn-blue
              margin-top-60
              margin-bottom-30
              font-14
              align-self-end
              ${this.props.formulary_id === "add" ? "d-none" : ""}
            `}
            disabled={this.props.otherUser}
            style={{padding: "5px 10px"}}
            onClick={ etape === "validation_data" && !this.props.otherUser ? () => { // désactive bouton si pas bonne étape et si user pas bon
              this.props.validateStep(`/api/v1/projects/${this.props.project_id}/next_setp`,
                () => { this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`) }
              )
            } : ()=>{} }>
              Je valide mes réponses et je passe à la prochaine étape <i className="fas fa-arrow-right"></i>
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
    validateStep,
    changeBeneficiaireForm,
  }, dispatch);
}

export default reduxForm({ form: 'validationForm', })(
connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalForm)
);















