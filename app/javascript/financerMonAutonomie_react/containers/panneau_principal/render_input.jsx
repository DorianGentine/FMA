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

import initSelectFma from "../../../components/select_fma";
import { initSelectize } from "../../../components/init_select2";

import 'react-widgets/dist/css/react-widgets.css'

class RenderForm extends Component {
  componentWillMount() {
    if(this.props.formulary_id !== this.props.formulary_ids[0]){
      this.props.changeBeneficiaireForm(this.props.formulary_ids[0])
    }
  }

  componentWillReceiveProps(nextProps) {
    if(nextProps.formulary_id === "add" && nextProps.formulary_id !== this.props.formulary_id){
      this.props.fetchFORM(`/api/v1/projects/${this.props.project_id}/formularies/new`)
      .then( setTimeout( () => {this.handleInitialize()}, 500) )
    }else if (nextProps.formulary_id !== this.props.formulary_id) {
      this.props.fetchFORM(`/api/v1/formularies/${nextProps.formulary_id}/edit`)
      .then( setTimeout( () => {this.handleInitialize()}, 500) )
    }
  }

  handleInitialize() {
    const formResults = this.props.formResults

    let initData = {};

    for ( let i in formResults) {
      if( formResults[i].set_up.need_answer ){
        initData[formResults[i].set_up.column_name] = formResults[i].answer;
      }
    }

    this.props.initialize(initData);
  }

  onSubmit = (values) => {
    if(this.props.formulary_id === "add"){
      this.props.fetchPostForm(`/api/v1/projects/${this.props.project_id}/formularies`, values, "POST")
      .then( ()=>{
        this.props.fetchAPI(this.props.urlAPI)
        setTimeout( () => {
          const formularyIdNewUser = this.props.formulary_ids[this.props.formulary_ids.length-1]
          this.props.changeBeneficiaireForm(formularyIdNewUser)
        }, 500)
      })
    }else{
      this.props.fetchPostForm(`/api/v1/formularies/${this.props.formulary_id}`, values, "PATCH")
      .then(()=>{
        this.props.fetchFORM(`/api/v1/formularies/${this.props.formulary_id}/edit`)
        .then( setTimeout( () => {this.handleInitialize()}, 500) )
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
        splitValue = input.value.split('", "')
        if(splitValue.length > 1){
          splitValue[0] = splitValue[0].substr(splitValue[0].lastIndexOf(splitValue[0].lastIndexOf('"')))
          splitValue[splitValue.length - 1] = splitValue[splitValue.length -1].slice(0, -2);
        }
      }else{
        splitValue = input.value
      }

      return(
        <Multiselect {...input}
        onBlur={() => {
          input.onBlur();
          submitButton.click();
        }}
        value={splitValue} // requires value to be an array
        data={datas}
        valueField={valueField}
        textField={textField}
        />
      )
    }

    const renderDropdownList = ({ input, data, valueField, textField }) => {
      let datas = []
      for ( let i in data) {
        datas.push(data[i].props.value);
      }

      return(
        <DropdownList {...input}
          data={datas}
          valueField={valueField}
          textField={textField}
          onChange={input.onChange}
          onBlur={event => {
            input.onBlur(event);
            submitButton.click();
          }} />
      )
    }


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
          return(
            <div className="form-group">
              <label className="font-14 black">{result.set_up.question}</label>
              <Field
                className="margin-bottom-15 no-padding form-control"
                name={result.set_up.column_name}
                component={renderDropdownList}
                data={renderOptions(result.set_up.data)}
                valueField="value"
                textField="color"/>
            </div>
          )
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


  }
}

function mapStateToProps(state) {
  return {
    formulary_id: state.formulary_id,
    formulary_ids: state.project.project.formulary_ids,
    formResults: state.formResults,
    project_id: state.project_id,
    project: state.project,
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
connect(mapStateToProps, mapDispatchToProps)(RenderForm)
);
