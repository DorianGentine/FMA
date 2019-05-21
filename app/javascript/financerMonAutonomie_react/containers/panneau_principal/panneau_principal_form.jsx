import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize } from 'redux-form';

import { fetchFORM } from '../../actions';

class PanneauPrincipalProjet extends Component {
  componentWillMount() {
    this.props.fetchFORM(this.props.urlForm)
    .then(this.handleInitialize())
  }

  handleInitialize() {
    const formResults = this.props.formResults

    let initData = {};

    for ( let i in formResults) {
      if( formResults[i].set_up.need_answer ){
        console.log("result", formResults[i])
        initData[formResults[i].set_up.column_name] = formResults[i].answer;
      }
    }

    this.props.initialize(initData);
  }

  onSubmit = (values) => {
    this.props.createPost(values, (post) => {
      this.props.history.push('/'); // Navigate after submit
        return post;
    });
  }

  renderField(field) {
    return (
      <div className="form-group">
        <label className="font-14 black">{field.label}</label>
        <input className="margin-bottom-15 no-padding form-control"
          type={field.type}
          {...field.input}
          placeholder={field.placeholder}
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

    const renderInput = (result) => {
      if(result.set_up.type == "input" || result.set_up.type == "number"){
        return(
          <Field
            label={result.set_up.question}
            name={result.set_up.column_name}
            type={result.set_up.type}
            component={this.renderField}
            placeholder={result.answer}
            id="tasoeur"
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
                value={result.answer}
              >
                {renderOptions(result.set_up.data)}
              </Field>
            </div>
          )
        }else{
          return(
            <div className="form-group">
              <label className="font-14 black">MULTI {result.set_up.question}</label>
              <Field
                className="margin-bottom-15 no-padding form-control"
                name={result.set_up.column_name}
                type={result.set_up.type}
                component={result.set_up.type}
                placeholder={result.answer}
              >
                {renderOptions(result.set_up.data, result.answer)}
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


    return (
      <div className="col-lg-12">
        <div className="white-box">
          <h4 className="no-margin margin-bottom-60">Bénéficiaire 1 <strong className="font-weight-normal blue font-12 margin-left-30">Vérification des réponses pour le bénéficiaire n°1</strong></h4>
          <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
            {renderForm(this.props.formResults)}
            <div type="submit" disabled={this.props.pristine || this.props.submitting} className="btn-blue margin-top-60 margin-bottom-60 margin-left-auto width-fit-content">Confirmez les réponses pour le bénéficiaire 1</div>
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
connect(mapStateToProps, { fetchFORM })(PanneauPrincipalProjet)
);


// , keepDirtyOnReinitialize: true, enableReinitialize: true, updateUnregisteredFields: true,















