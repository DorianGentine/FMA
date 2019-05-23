import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Multiselect from 'react-widgets/lib/Multiselect'
import DropdownList from 'react-widgets/lib/DropdownList'

import { fetchAPI, fetchFORM, fetchPostForm, validateStep, changeBeneficiaireForm } from '../../actions';

import initSelectFma from "../../../components/select_fma";
import { initSelectize } from "../../../components/init_select2";

import 'react-widgets/dist/css/react-widgets.css'

class PanneauPrincipalProjet extends Component {
  componentWillMount() {
    if(this.props.formulary_id !== this.props.formulary_ids[0])
      this.props.changeBeneficiaireForm(this.props.formulary_ids[0])
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
      this.props.fetchPostForm(`api/v1/projects/${this.props.project_id}/formularies`, values)
    }else{
      this.props.fetchPostForm(`/api/v1/formularies/${this.props.formulary_id}`, values)
    }
  }

  renderField(field) {
    return (
      <div className="form-group">
        <label className="font-14 black">{field.label}</label>
        <input className="margin-bottom-15 form-control"
          type={field.type}
          {...field.input}
        />
      </div>
    );
  }

  handleClickBenef = (event) => {
    this.props.changeBeneficiaireForm(event)
  }



  render(){

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
      if(typeof input.value == "string"){
        splitValue = input.value.split('", "')
        // if(splitValue > 1){
          splitValue[0] = splitValue[0].substr(2)
          splitValue[splitValue.length - 1] = splitValue[splitValue.length -1].slice(0, -2);
        // }
      }else{
        splitValue = input.value
      }

      return(
        <Multiselect {...input}
        onBlur={() => input.onBlur()}
        value={splitValue || []} // requires value to be an array
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
          onChange={input.onChange} />
      )
    }

    const renderInput = (result) => {
      if(result.set_up.type == "input" || result.set_up.type == "number"){
        return(
          <Field
            label={result.set_up.question}
            name={result.set_up.column_name}
            type={result.set_up.type}
            component={this.renderField}
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

    const renderForm = (formResults) => {
      if(formResults.length > 0 ){
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
        <div className="flex">
          {renderBeneficiaires()}
          <h4
            className={`no-margin btn-select-onglet ${"add" == this.props.formulary_id ? 'active' : null}`}
            data-benef-index="add"
            onClick={() => {this.handleClickBenef(event)} }>
              +
          </h4>
        </div>
        <div className="white-box">
          <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
            {renderForm(this.props.formResults)}
            <button
              id="btn-validation-infos"
              type="submit"
              disabled={this.props.pristine || this.props.submitting}
              className="btn-blue margin-top-60 margin-bottom-60 margin-left-auto width-fit-content">
                Confirmez les réponses pour ce bénéficiaire
            </button>
          </form>
          <h2
            className="blue text-align-right pointer"
            onClick={() => {
              this.props.validateStep(`/api/v1/projects/${this.props.project_id}/next_setp`,
                () => { this.props.fetchAPI(this.props.urlAPI) }
              )
            }}>
              Je valide mes réponses et je passe à la prochaine étape <i className="fas fa-arrow-right"></i>
          </h2>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    formulary_id: state.formulary_id,
    formulary_ids: state.api.project.formulary_ids,
    formResults: state.formResults,
    project_id: state.project_id,
    urlAPI: state.urlAPI
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI, fetchFORM, fetchPostForm, validateStep, changeBeneficiaireForm }, dispatch);
}

export default reduxForm({ form: 'validationForm' })(
connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalProjet)
);















