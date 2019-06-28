import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import DropdownList from 'react-widgets/lib/DropdownList'

import { closeModal, fetchPostCompte } from '../../actions';

class ModalDemande extends Component {
  componentDidMount(){
    this.handleInitialize()
  }

  handleInitialize(formResults) {
    const client = this.props.modal_selected.client
    let initData = {
      project: {
        fullName: client.first_name + " " + client.last_name,
        project: client.project,
      },
    };
    this.props.initialize(initData);
  }

  renderField = ({ input, type, label }) => {
    if(type === "checkbox"){
      return(
        <label className={`custom-checkbox ${label === "Financement" ? "no-margin" : "" }`}>
          <input {...input}
            type={type}
            onBlur={event => {input.onBlur(event);}}
          />
          <span className="checkmark">{label}</span>
        </label>
      )
    }else{
      return(
        <input {...input}
          className="form-control margin-bottom-30"
          type={type}
          onBlur={event => {input.onBlur(event);}}
        />
      )
    }
  }

  renderDropdownList = ({ input, data, valueField, textField }) => {
    let datas = []
    for ( let i in data) {
      datas.push({
        fullName: data[i].first_name + " " + data[i].last_name,
        project: data[i].project,
      });
    }

    return(
      <DropdownList {...input}
        className="margin-bottom-30"
        data={datas}
        textField={textField}
        valueField={valueField}
        onChange={input.onChange}
        onBlur={event => {
          input.onBlur(event);
        }} />
    )
  }

  onSubmit = (oldValues) => {
    console.log("Old Values", oldValues)
    let category = ""
    if(oldValues.category1){
      category = `${category === "" ? "diagnostic" : category + ", diagnostic"}`
    }
    if(oldValues.category2){
      category = `${category === "" ? "chiffrage" : category + ", chiffrage"}`
    }
    if(oldValues.category3){
      category = `${category === "" ? "financement" : category + ", financement"}`
    }

    const values = {
      project: oldValues.project.project,
      description: oldValues.description,
      category: category,
    }
    console.log("values", values)
    let url = `/api/v1/projects/${values.project}/requests`
    let method = "POST"

    this.props.fetchPostCompte(url, values, method, ()=>{})
  }

  render(){
    const client = this.props.modal_selected.client
    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Créer une demande</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>

        <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values)})}>
          <p className="black font-14 margin-bottom-15">Bénéficiaire</p>
          <Field
            className="margin-bottom-15 no-padding form-control"
            name="project"
            component={this.renderDropdownList}
            data={this.props.clients.clients}
            valueField="project"
            textField="fullName"
          />
          <p className="black font-14 margin-bottom-15">Catégorie</p>
          <div className="flex margin-bottom-30">
            <Field
              label="Diagnostic"
              name="category1"
              type="checkbox"
              component={this.renderField}
            />
            <Field
              label="Chiffrage"
              name="category2"
              type="checkbox"
              component={this.renderField}
            />
            <Field
              label="Financement"
              name="category3"
              type="checkbox"
              component={this.renderField}
            />
          </div>
          <p className="black font-14 margin-bottom-15">Message</p>
          <Field
            name="description"
            type="text"
            component={this.renderField}
          />
          <button
            className="btn-blue margin-top-30 offset-3 col-6 text-align-center"
            type="submit"
            // onClick={this.props.closeModal}
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
    clients: state.clients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchPostCompte }, dispatch);
}

export default reduxForm({ form: 'demande', })(
connect(mapStateToProps, mapDispatchToProps)(ModalDemande)
);
