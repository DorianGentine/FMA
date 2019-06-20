import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import ModalClient from './modal_cote/modal_client';
import ModalDocument from './modal_cote/modal_document';
import ModalFinancer from './modal_cote/modal_financer';
import ModalRessource from './modal_cote/modal_ressource';
import ModalReponses from './modal_cote/modal_reponses';
import ModalDemande from './modal_cote/modal_demande';

class ModalCote extends Component {
  render(){
    const modalSelected = this.props.modal_selected
    if(modalSelected == null){
      return null
    }else if(modalSelected.modalActive === "showClient"){
      return (<ModalClient />)
    }else if(modalSelected.modalActive === "showDoc"){
      return (<ModalDocument />)
    }else if(modalSelected.modalActive === "showFinancer"){
      return (<ModalFinancer />)
    }else if(modalSelected.modalActive === "showRessource"){
      return (<ModalRessource />)
    }else if(modalSelected.modalActive === "showReponses"){
      return (<ModalReponses />)
    }else if(modalSelected.modalActive === "showDemande"){
      return (<ModalDemande />)
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

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(ModalCote);
