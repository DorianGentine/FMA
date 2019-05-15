import React, { Component } from 'react';

class RdvTel extends Component {
  render(){
    return (
      <div className="margin-top-30 blue-gray-box">
        <div className="icon-calendar"></div>
        <p className="rdv-tel-text">Accédez à votre calendrier <br/><strong>Fixez votre RDV à l'étape 3</strong></p>
        <div className="icon-arrow"></div>
      </div>
    );
  }
};

export default RdvTel;
