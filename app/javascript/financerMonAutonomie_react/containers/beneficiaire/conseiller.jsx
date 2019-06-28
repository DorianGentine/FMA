import React, { Component } from 'react';
// import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderLogo from "../../../components/render_logo"

class Conseiller extends Component {
  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      if(this.props.otherUser){
        const user = this.props.api.user
        const telTo = "#"

        return (
          <div className="conseiller">
            <div className="avatar-app">
              <div className="statut"></div>
              {renderLogo(user)}
            </div>
            <p className="blue margin-top-30 font-12">Bénéficiaire :</p>
            <p className="">{user.first_name} {user.last_name}</p>
            <div className="margin-top-15 flex space-evenly">
              <a href={telTo}><img className="conseiller-tel" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Te%CC%81l_bjyxz7.svg" alt="phone" /></a>
              <a href={null}><img className="conseiller-messagerie" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Chat_dtjlyt.svg" alt="message" /></a>
            </div>
          </div>
        );

      }else{
        const conseiller = this.props.api.conseiller
        const telTo = `tel:${conseiller.phone}`

        return (
          <div className="conseiller">
            <div className="avatar-app">
              <div className="statut"></div>
              {renderLogo(conseiller)}
            </div>
            <p className="blue margin-top-30 font-12">votre conseillé est</p>
            <p className="">{conseiller.first_name} {conseiller.last_name}</p>
            <div className="margin-top-15 flex space-evenly">
              <a href={telTo}><img className="conseiller-tel" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Te%CC%81l_bjyxz7.svg" alt={conseiller.phone} /></a>
              <a href={conseiller.phone}><img className="conseiller-messagerie" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Chat_dtjlyt.svg" alt={conseiller.phone} /></a>
            </div>
          </div>
        );
      }
    // App conseiller / admin
    }else if(statut === "conseiller" || statut === "admin"){
      const user = this.props.api.user
      return (
        <div className="conseiller">
          <div className="avatar-app">
            <div className="statut"></div>
            {renderLogo(user)}
          </div>
          <p className="blue margin-top-30 font-12">{`${statut === "conseiller" ? "conseiller" : "administrateur" }`}</p>
          <p className="">{user.first_name} {user.last_name}</p>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    otherUser: state.otherUser,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Conseiller);
