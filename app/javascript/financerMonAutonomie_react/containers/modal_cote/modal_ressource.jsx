import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

class ModalRessource extends Component {
  render(){
    const ressource = this.props.modal_selected.ressource
    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Les ressources</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box align-text-center vertical margin-bottom-30 margin-top-30">
          <h4 className="black">{`La caisse ${ressource.id}`}</h4>
          <p className="blue">Conseil en solutions</p>
        </div>
        <p className="black">Actions rapides</p>
        <div className="flex">
          <button className="btn font-12 border margin-right-5 flex-grow-1" style={{padding: "3px"}}>Aperçu du guide</button>
          <button className="btn font-12 border margin-right-5 flex-grow-1" style={{padding: "3px"}}>Ajouter à un kit</button>
          <button className="btn font-12 border flex-grow-1" style={{padding: "3px"}}>Télécharger</button>
        </div>
        <hr className="ligne-horizontal gray-200-background"/>
        <p className="black">Demande spécifique</p>
        <button className="btn black gray-200-background font-12 w-100">Créer une demande spécifique</button>
        <hr className="ligne-horizontal gray-200-background"/>
        <p className="black">Description</p>
        <p>Bonjour je viens de formuler une demande spécifique concernant le dossier de. Bonjour je viens de formuler une demande spécifique concernant le dossier de......</p>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalRessource);
