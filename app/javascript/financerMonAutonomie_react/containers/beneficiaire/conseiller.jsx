import React, { Component } from 'react';
// import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../../components/render_initiales"

class Conseiller extends Component {
  render(){
    const conseiller = this.props.conseiller
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
  }
};

function mapStateToProps(state) {
  return {
    conseiller: state.api.conseiller,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Conseiller);
