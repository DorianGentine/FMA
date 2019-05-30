import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import ModalDocument from './modal_cote/modal_document';

class ModalCote extends Component {
  render(){
    const modalSelected = this.props.modal_selected
    if(modalSelected == null){
      return null
    }else if(modalSelected.modalActive === "showDoc"){
      return (<ModalDocument />)
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
