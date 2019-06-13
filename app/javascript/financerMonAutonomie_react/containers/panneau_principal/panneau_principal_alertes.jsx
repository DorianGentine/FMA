import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Dropzone from 'react-dropzone'

import renderLogo from "../../../components/render_logo"

import { fetchPostCompte } from '../../actions'

class PanneauPrincipalAlertes extends Component {


  // onSubmit = (values, kind) => {
  //   let url = ""
  //   let method = "PATCH"
  //   if(kind === "classic"){
  //     console.log("Classic")
  //     url = `/api/v1/users/${this.props.user_id}`
  //   }else if(kind === "password"){
  //     console.log("password")
  //     url = `/mon_espace/${this.props.user_id}`
  //   }else if(kind === "email"){
  //     console.log("mail")
  //     url = `/mon_espace/${this.props.user_id}`
  //   }else if(kind === "delete"){
  //     console.log("delete")
  //     url = `/mon_espace/${this.props.user_id}`
  //     method = "DELETE"
  //   }
  //   this.props.fetchPostCompte(url, values, method)
  // }

  // renderField = ({ input, label, type, hint }) => (
  //   <div className="margin-top-15 form-group flex space-between align-items-center">
  //     <label className="font-14 min-width-25 no-margin">{label}</label>
  //     <div className="flex-grow-1">
  //       <input {...input}
  //         className="form-control"
  //         type={type}
  //         onBlur={event => {
  //           input.onBlur(event);
  //           // submitButton.click();
  //         }}
  //       />
  //       <p className="font-12 gray-300">{hint}</p>
  //     </div>
  //   </div>
  // )

  render(){
    const selectedMenuVolet = this.props.selectedMenuVolet

    switch(selectedMenuVolet){
      case "notifications": {

        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Notifications</h4>
                <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "classic")})}>
                  <div className="flex align-items-center">
                    <input type="checkbox" className="margin-right-15"/>
                    <p>Je veux être averti lors de chaque étape de mon projet</p>
                  </div>
                  <div className="flex align-items-center">
                    <input type="checkbox" className="margin-right-15"/>
                    <p>Je veux être averti lorsque je recois un message de la part de mon conseiller</p>
                  </div>
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
      case "actualites": {
        return(
          <div className="row">
            <div className="col-lg-12">
              <div className="white-box flex flex-wrap">
                <h4 className="col-lg-12">Actualités</h4>
                <form className="col-lg-12" onSubmit={this.props.handleSubmit((values) => {this.onSubmit(values, "email")})}>
                  <div className="flex align-items-center">
                    <input type="checkbox" className="margin-right-15"/>
                    <p>Je veux recevoir la newsletter généraliste</p>
                  </div>
                  <div className="flex align-items-center">
                    <input type="checkbox" className="margin-right-15"/>
                    <p>Je veux connaitre les prinicpaux événements de FMA</p>
                  </div>
                  <div className="flex align-items-center">
                    <input type="checkbox" className="margin-right-15"/>
                    <p>Après la cloture de mon dossier je souhaite continuer à recevoir l'actualité de FMA</p>
                  </div>
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
    }
  }
}

// function mapStateToProps(state) {
//   return {
//     api: state.api,
//     user_id: state.user_id,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({
//     fetchPostCompte,
//   }, dispatch);
// }

export default reduxForm({ form: 'validationForm', })(
connect(null, null)(PanneauPrincipalAlertes)
);