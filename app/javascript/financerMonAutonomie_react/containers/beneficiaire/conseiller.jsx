import React, { Component } from 'react';
// import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../../components/render_initiales"

class Conseiller extends Component {
  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const conseiller = this.props.api.conseiller
      const telTo = `tel:${conseiller.phone}`

      return (
        <div className="conseiller">
          <div className="avatar-app">
            <div className="statut"></div>
            {renderInitiale(`${conseiller.first_name} ${conseiller.last_name}`)}
          </div>
          <p className="blue margin-top-30 font-12">votre conseillé est</p>
          <p className="">{conseiller.first_name} {conseiller.last_name}</p>
          <div className="margin-top-15 flex space-evenly">
            <a href={telTo}><img className="conseiller-tel" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Te%CC%81l_bjyxz7.svg" alt={conseiller.phone} /></a>
            <a href={conseiller.phone}><img className="conseiller-messagerie" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/icons/Chat_dtjlyt.svg" alt={conseiller.phone} /></a>
          </div>
        </div>
      );
    }else if(statut === "conseiller"){
      const user = this.props.api.user
      return (
        <div className="conseiller">
          <div className="avatar-app">
            <div className="statut"></div>
            {renderInitiale(`${user.first_name} ${user.last_name}`)}
          </div>
          <p className="blue margin-top-30 font-12">conseiller</p>
          <p className="">{user.first_name} {user.last_name}</p>
        </div>
      );
    }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Conseiller);
