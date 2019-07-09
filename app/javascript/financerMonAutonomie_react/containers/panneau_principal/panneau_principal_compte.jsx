import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import renderLogo from "../../../components/render_logo"

import { fetchPostCompte, fetchAPI } from '../../actions'

class PanneauPrincipalCompte extends Component {
  componentDidMount(){
    this.handleInitialize()
  }

  componentWillReceiveProps(nextProps) {
    if(nextProps.selectedMenuVolet != this.props.selectedMenuVolet){
      this.handleInitialize(nextProps.formResults)
    }
  }

  handleInitialize(formResults) {
    let initData = {
      first_name: this.props.api.user.first_name,
      last_name: this.props.api.user.last_name,
      phone: this.props.api.user.phone,
      mail: this.props.api.user.email,
    };
    this.props.initialize(initData);
  }

  onSubmit = (values, kind) => {
    console.log("valuesLOG", values)
    let url = ""
    let method = "PATCH"
    if(kind === "classic"){
      console.log("Classic")
      url = `/api/v1/users/${this.props.user_id}`
    }else if(kind === "password"){
      console.log("password")
      url = `/mon_espace/${this.props.user_id}`
    }else if(kind === "email"){
      console.log("mail")
      url = `/mon_espace/${this.props.user_id}`
    }else if(kind === "delete"){
      console.log("delete")
      url = `/mon_espace/${this.props.user_id}`
      method = "DELETE"
    }
    this.props.fetchPostCompte(url, values, method, ()=>{this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)})
  }

  renderField = ({ input, label, type, hint }) => (
    <div className="margin-top-15 form-group flex space-between align-items-center">
      <label className="font-14 min-width-25 no-margin">{label}</label>
      <div className="flex-grow-1">
        <input {...input}
          className="form-control"
          type={type}
          disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
          onBlur={event => {
            input.onBlur(event);
            // submitButton.click();
          }}
        />
        <p className="font-12 gray-300">{hint}</p>
      </div>
    </div>
  )

  render(){
    const selectedMenuVolet = this.props.selectedMenuVolet

    switch(selectedMenuVolet){
      case "identite": {
        const user = this.props.api.user

        const sendImageToController = (formPayLoad) => {
          fetch(`/api/v1/users/${this.props.user_id}`, {
            credentials: 'same-origin',
            headers: {},
            method: 'PATCH',
            body: formPayLoad
          })
          .then(response => response.json())
          .then(()=>{this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)})
        }

        const readFile = (files) => {
          if (files && files[0]) {
            console.log(files[0])
            let formPayLoad = new FormData();
            formPayLoad.append('avatar', files[0]);
            sendImageToController(formPayLoad)
          }
        }

        return(
          <div>
            <form className="row" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "classic")})}>
              <div className="col-lg-8">
                <div className="white-box flex flex-wrap">
                  <h4 className="col-lg-12">Identité</h4>
                  <div className="col-lg-12">
                    <Field
                      label="Prénom"
                      name={"first_name"}
                      type="text"
                      component={this.renderField}
                    />
                    <Field
                      label="Nom"
                      name={"last_name"}
                      type="text"
                      component={this.renderField}
                    />
                    <button
                      className="float-right btn-blue"
                      type="submit"
                      disabled={this.props.pristine || this.props.submitting}>
                        Enregistrer
                    </button>
                  </div>
                </div>
              </div>
              <div className="col-lg-4">
                <div className="white-box flex flex-wrap" style={{height: "calc(100% - 20px)"}}>
                  <h4 className="col-lg-12">Ma photo</h4>
                    <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles)}}>
                      {({getRootProps, getInputProps}) => (
                        <div className="photo-compte relative pointer" {...getRootProps()}>
                          <input {...getInputProps()} />
                          {renderLogo(user)}
                          <div className="btn-light btn-light-compte absolute"></div>
                        </div>
                      )}
                    </Dropzone>
                </div>
              </div>
              <div className="col-lg-12">
                <div className="white-box flex flex-wrap">
                  <h4 className="col-lg-12">Téléphone</h4>
                  <div className="col-lg-12">
                    <Field
                      label="Numéro de téléphone"
                      name={"phone"}
                      type="tel"
                      component={this.renderField}
                      // hint="Votre numéro de téléphone ne sera jamais communiqué aux clients et autres utilisateurs du site"
                      // Recevez vos notifications de message par SMS.
                    />
                    <button
                      className="float-right btn-blue"
                      type="submit"
                      disabled={this.props.pristine || this.props.submitting}>
                        Enregistrer
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        )
      }
      case "email_mdp": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Modification de votre email</h4>
                <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "email")})}>
                  <Field
                    label="Email"
                    name={"mail"}
                    type="email"
                    component={this.renderField}
                  />
                  <Field
                    label="Mot de passe actuel"
                    name={"password"}
                    type="password"
                    component={this.renderField}
                  />
                  <button
                    className="float-right btn-blue"
                    type="submit"
                    disabled={this.props.pristine || this.props.submitting}>
                      Enregistrer
                  </button>
                </form>
              </div>
            </div>
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Modification de votre mot de passe</h4>
                <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "password")})}>
                  <Field
                    label="Ancien mot de passe"
                    name={"password"}
                    type="password"
                    component={this.renderField}
                  />
                  <Field
                    label="Nouveau"
                    name={"new-password"}
                    type="password"
                    component={this.renderField}
                    hint="6 caractères minimum"
                  />
                  <Field
                    label="Confirmation"
                    name={"new-password-confirm"}
                    type="password"
                    component={this.renderField}
                  />
                  <button
                    className="float-right btn-blue"
                    type="submit"
                    disabled={this.props.pristine || this.props.submitting}>
                      Enregistrer
                  </button>
                </form>
              </div>
            </div>
          </div>
        )
      }
      case "suppression": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "delete")})}>
                  <button
                    className="black btn no-padding"
                    type="submit"
                    disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
                    style={{
                      fontSize: "1rem",
                      fontWeight: "700",
                      border: "none",
                      textDecoration: "underline",
                    }}>
                    Supprimer mon compte
                  </button>
                </form>
              </div>
            </div>
          </div>
        )
      }
    }
  }
}

function mapStateToProps(state) {
  return {
    api: state.api,
    user_id: state.user_id,
    otherUser: state.otherUser,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchPostCompte, fetchAPI }, dispatch);
}

export default reduxForm({ form: 'validationForm', })(
connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalCompte)
);
