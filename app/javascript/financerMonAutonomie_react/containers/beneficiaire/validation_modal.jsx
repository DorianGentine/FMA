import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class ValidationModal extends Component {
  render(){
    const etape = this.props.etape
    console.log(etape)

    const closeLilModal = () => {
      const modal = document.getElementById(`tip_${etape}`)
      modal.style.opacity = 0
      setTimeout( () => {modal.style.display = "none"}, 600 )
    }

    let textTitre = ""
    let textPrincipal = ""
    if(etape === "documentation"){
      textTitre = "Bienvenue sur votre dashboard"
      textPrincipal = `Commencez par envoyer les documents demandés ici !`
    }else if(etape === "meeting"){
      textTitre = "Félicitations !"
      textPrincipal = `Nous avons bien reçu tous vos documents.
      Vous pouvez désormais prendre rdv avec votre conseiller ici`
    } else {
      return null
    }

    return(
      <div className="validation_modal">
        <div className="validation_modal-point"></div>
        <div className="validation_modal-text" id={`tip_${etape}`}>
          <div className="flex">
            <p className="white flex-grow-1 margin-right-15 bold">{textTitre}</p>
            <i className="fas fa-times white text-align-right align-center" onClick={closeLilModal}></i>
          </div>
          <p className="white" style={{ whiteSpace: "pre-line" }}>{textPrincipal}</p>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    etape: state.api.project.etape,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(ValidationModal);

