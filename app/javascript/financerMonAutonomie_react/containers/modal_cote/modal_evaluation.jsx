import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

import { closeModal, fetchPostCompte, fetchRatings } from '../../actions';

class ModalEvaluation extends Component {
  componentWillMount(){
    if(this.props.ratings === null){
      this.props.fetchRatings()
    }
  }

  renderField = ({ input, type, label }) => {
    return(
      <input {...input}
        className="form-control margin-bottom-30"
        type={type}
        onBlur={event => {input.onBlur(event);}}
      />
    )
  }

  onSubmit = (values) => {
    console.log("values", values)
    let url = `/api/v1/projects/${values.project}/requests`
    let method = "POST"

    // this.props.fetchPostCompte(url, values, method, ()=>{})
    // this.props.closeModal()
  }

  render(){
    const project = this.props.modal_selected.project
    const ratings = this.props.ratings
    console.log(ratings)

    const renderForm = () => {
      let ratings = []
      for ( let i in data) {
        options.push(<option key={i} value={data[i]} >{data[i]}</option>);
      }
      return options
      return ratings.map((rating, index) => {
        let type = rating.type
        if(type === "select"){
          type = "radio"
        }
        return(
          <div key={index}>
            <p className="black font-14 margin-bottom-15">{rating.question}</p>
            <Field
              name={rating.question}
              type={type}
              component={this.renderField}
            />
          </div>
        )
      })
    }
    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Créer une demande</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
          <div className="scroll" style={{ maxHeight: "calc(100vh - 390px)"}}>
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
    ratings: state.ratings,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte, fetchRatings }, dispatch);
}

export default reduxForm({ form: 'evaluation', })(
connect(mapStateToProps, mapDispatchToProps)(ModalEvaluation)
);
