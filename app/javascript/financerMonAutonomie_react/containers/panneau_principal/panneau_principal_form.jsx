import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Multiselect from 'react-widgets/lib/Multiselect'

import { fetchFORM, fetchPostForm } from '../../actions';

import initSelectFma from "../../../components/select_fma";
import { initSelectize } from "../../../components/init_select2";

import 'react-widgets/dist/css/react-widgets.css'

class PanneauPrincipalProjet extends Component {
  componentWillMount() {
    this.props.fetchFORM(this.props.urlForm);
  }

  componentDidMount() {
    setTimeout( () => {this.handleInitialize()}, 1000);
    setTimeout( () => {initSelectFma()}, 1000);
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
    console.log('values are', values)
    this.props.fetchPostForm(`/api/v1/projects/1/formularies/1`, values)
  }

  renderField(field) {
    return (
      <div className="form-group">
        <label className="font-14 black">{field.label}</label>
        <input className="margin-bottom-15 no-padding form-control"
          type={field.type}
          {...field.input}
        />
      </div>
    );
  }



  render(){
    const etape = this.props.project.etape

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
      console.log(datas)
      return(
        <Multiselect {...input}
        onBlur={() => input.onBlur()}
        value={input.value || []} // requires value to be an array
        data={datas}
        valueField={valueField}
        textField={textField}
        />
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
                type={result.set_up.type}
                component={result.set_up.type}
                // value={result.answer}
              >
                {renderOptions(result.set_up.data)}
              </Field>
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
              // <Field
                // name="hobbies"
                // component={renderMultiselect}
                // data={[ 'Guitar', 'Cycling', 'Hiking' ]}/>
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


    return (
      <div className="col-lg-12">
        <div className="white-box">
          <h4 className="no-margin margin-bottom-60">Bénéficiaire 1 <strong className="font-weight-normal blue font-12 margin-left-30">Vérification des réponses pour le bénéficiaire n°1</strong></h4>
          <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
            {renderForm(this.props.formResults)}
            <button type="submit" disabled={this.props.pristine || this.props.submitting} className="btn-blue margin-top-60 margin-bottom-60 margin-left-auto width-fit-content">Confirmez les réponses pour le bénéficiaire 1</button>
          </form>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    project: state.api.project,
    urlForm: state.urlForm,
    formResults: state.formResults,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default reduxForm({ form: 'validationForm' })(
connect(mapStateToProps, { fetchFORM, fetchPostForm })(PanneauPrincipalProjet)
);


// , keepDirtyOnReinitialize: true, enableReinitialize: true, updateUnregisteredFields: true,















