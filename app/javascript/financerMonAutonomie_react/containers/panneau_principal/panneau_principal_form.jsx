import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field } from 'redux-form';

import { fetchFORM } from '../../actions';

class PanneauPrincipalProjet extends Component {
  componentWillMount() {
    this.props.fetchFORM(this.props.urlForm);
  }

  render(){
    const etape = this.props.project.etape
    // console.log("urlForm", this.props.urlForm )
    const handleChange = (event) => {
      console.info(`New value : ${event}`)
    }

    const renderInput = (result) => {
      if(result.set_up.type == "input"){
        return(
          <input type="text" value={result.answer} onChange={(event) => handleChange(event.target.value)} className="margin-bottom-15 no-padding"/>
        )
      }else if(result.set_up.type == "select"){
        if(result.set_up.multiple_answers == false){
          return(
            <p>select single</p>
          )
        }else{
          return(
            <p>select multiple</p>
          )
        }
      }
    }

    const renderForm = (formResults) => {
      if(formResults){
        return formResults.map((result, index) => {
          if(result.set_up.need_answer == true){
            return(
              <div key={result.set_up.id}>
                <p className="font-14 black">{result.set_up.question}</p>
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
          <form>{renderForm(this.props.formResults)}</form>
          <div className="btn-blue margin-top-60 margin-bottom-60 margin-left-auto width-fit-content">Confirmez les réponses pour le bénéficiaire 1</div>
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

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchFORM }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalProjet);

























