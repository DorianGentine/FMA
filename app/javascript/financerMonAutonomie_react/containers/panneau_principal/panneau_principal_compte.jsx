import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

class PanneauPrincipalCompte extends Component {
  render(){
    const selectedMenuVolet = this.props.selectedMenuVolet

    const renderField = ({ input, label, type, hint }) => (
      <div className="margin-top-15 form-group flex space-between align-items-center">
        <label className="font-14 min-width-25 no-margin">{label}</label>
        <div className="flex-grow-1">
          <input {...input}
            className="form-control"
            type={type}
            onBlur={event => {
              input.onBlur(event);
              // submitButton.click();
            }}
          />
          <p className="font-12 gray-300">{hint}</p>
        </div>
      </div>
    )

    switch(selectedMenuVolet){
      case "identite": {
        return(
          <div className="row">
            <div className="col-lg-7">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Identité</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Nom"
                    name={"last_name"}
                    type="text"
                    component={renderField}
                  />
                  <Field
                    label="Prénom"
                    name={"first_name"}
                    type="text"
                    component={renderField}
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
            <div className="col-lg-5">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Ma photo</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Nom"
                    name={"last_name"}
                    type="text"
                    component={renderField}
                  />
                  <Field
                    label="Prénom"
                    name={"first_name"}
                    type="text"
                    component={renderField}
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
                <h4 className="col-lg-12">Informations générales</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Date de naissance"
                    name={"birthdate"}
                    type="date"
                    component={renderField}
                  />
                  <Field
                    label="Sexe"
                    name={"gender"}
                    type="text"
                    component={renderField}
                    hint="(Nous ne communiquons pas ces informations. Elles ne sont utilisées que pour mieux vous connaître et/ou vous fournir des baromètres plus pertinents)."
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
      case "email": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Email</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Email"
                    name={"mail"}
                    type="email"
                    component={renderField}
                  />
                  <Field
                    label="Confirmer Email"
                    name={"mail-confirmation"}
                    type="email"
                    component={renderField}
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
      case "mdp": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Mot de passe</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Ancien mot de passe"
                    name={"password"}
                    type="password"
                    component={renderField}
                  />
                  <Field
                    label="Nouveau"
                    name={"new-password"}
                    type="password"
                    component={renderField}
                    hint="6 caractères minimum"
                  />
                  <Field
                    label="Confirmation"
                    name={"new-password-confirm"}
                    type="password"
                    component={renderField}
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
      case "telephone": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Téléphone</h4>
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <Field
                    label="Numéro de téléphone"
                    name={"phone"}
                    type="tel"
                    component={renderField}
                    hint="
                    Votre numéro de téléphone ne sera jamais communiqué aux clients et autres utilisateurs du site"
                    // Recevez vos notifications de message par SMS.
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
                <form className="col-lg-12" onSubmit={()=>{}}>
                  <h4 className="col-lg-12" type="submit">Supprimer mon compte</h4>
                </form>
              </div>
            </div>
          </div>
        )
      }
    }
  }
}

// function mapStateToProps(state) {
//   return {
//     formulary_id: state.formulary_id,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({
//     fetchAPI,
//   }, dispatch);
// }

export default reduxForm({ form: 'validationForm', })(
connect(null, null)(PanneauPrincipalCompte)
);
