import React, { Component } from 'react';

class Conseiller extends Component {
  render(){
    const conseiller = this.props.conseiller
    const telTo = `tel:${conseiller.phone}`

    const renderInitiale = () => {
      const prenom = conseiller.first_name
      const nom = conseiller.last_name
      const initiales = prenom.substring(0,1) + nom.substring(0,1)
      return initiales
    };

    return (
      <div className="conseiller">
        <div className="avatar-app">
          <div className="statut"></div>
          {renderInitiale()}
        </div>
        <p className="blue margin-top-30 font-12">votre conseillé est</p>
        <p className="">{conseiller.first_name} {conseiller.last_name}</p>
        <div className="margin-top-15 flex space-evenly">
          <a href={telTo}><img className="conseiller-tel" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/Te%CC%81l_bjyxz7.svg" alt={conseiller.phone} /></a>
          <a href={conseiller.phone}><img className="conseiller-messagerie" src="https://res.cloudinary.com/financermonautonomie/image/upload/v1557207527/Chat_dtjlyt.svg" alt={conseiller.phone} /></a>

        </div>
      </div>
    );
  }
};

export default Conseiller;
