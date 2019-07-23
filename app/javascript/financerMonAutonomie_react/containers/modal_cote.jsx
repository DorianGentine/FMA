import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../actions';

import ModalClientConseiller from './modal_cote/modal_client_conseiller';
import ModalCreateRessource from './modal_cote/modal_create_ressource';
import ModalDemande from './modal_cote/modal_demande';
import ModalDemandeAnswer from './modal_cote/modal_demande_answer';
import ModalDocument from './modal_cote/modal_document';
import ModalEvaluation from './modal_cote/modal_evaluation';
import ModalFinancer from './modal_cote/modal_financer';
import ModalKit from './modal_cote/modal_kit';
import ModalNotes from './modal_cote/modal_notes';
import ModalRessource from './modal_cote/modal_ressource';
import ModalReponses from './modal_cote/modal_reponses';

class ModalCote extends Component {

  render(){
    const modalSelected = this.props.modal_selected

    const fermerModal = () => {
      this.props.closeModal()
    }

    if(modalSelected != null){
      window.onkeydown = function(event){
        // console.log("modal_cote", modalSelected)
        if (event.key === "Escape") {
          fermerModal()
        }
      };
    }

    if(modalSelected == null){
      return null
    }else if(modalSelected.modalActive === "showClient"){
      return (<ModalKit />)
    }else if(modalSelected.modalActive === "showClientConseiller"){
      return (<ModalClientConseiller />)
    }else if(modalSelected.modalActive === "showCreateRessource"){
      return (<ModalCreateRessource />)
    }else if(modalSelected.modalActive === "showDemande"){
      return (<ModalDemande />)
    }else if(modalSelected.modalActive === "showDemandeAnswer"){
      return (<ModalDemandeAnswer />)
    }else if(modalSelected.modalActive === "showDoc"){
      return (<ModalDocument />)
    }else if(modalSelected.modalActive === "showEvaluation"){
      return (<ModalEvaluation />)
    }else if(modalSelected.modalActive === "showFinancer"){
      return (<ModalFinancer />)
    }else if(modalSelected.modalActive === "showNotes"){
      return (<ModalNotes />)
    }else if(modalSelected.modalActive === "showRessource"){
      return (<ModalRessource />)
    }else if(modalSelected.modalActive === "showReponses"){
      return (<ModalReponses />)
    }else{
      return null
    }
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

export default connect(mapStateToProps, mapDispatchToProps)(ModalCote);
