import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class ValidationModal extends Component {
  render(){
    const etape = this.props.project.etape
    const hint = this.props.project.hint

    const closeLilModal = () => {
      fetch(`/api/v1/projects/${this.props.project_id}/display_hint`,
      {
        method: "PATCH",
      })
      const modal = document.getElementById(`tip_${etape}`)
      const point = document.getElementById(`point_${etape}`)
      modal.classList.add('hidden')
      point.classList.add('hidden')
    }
    const toggleLilModal = () => {
      const modal = document.getElementById(`tip_${etape}`)
      const point = document.getElementById(`point_${etape}`)
      modal.classList.toggle('hidden')
      point.classList.toggle('hidden')
    }

    let textTitre = ""
    let textPrincipal = ""
    let style = {}
    if(etape === "validation_data"){
      textTitre = "Étape 1 : Confirmation des réponses"
      textPrincipal = `Veuillez vérifier et confirmer l’exactitude des réponses que vous avez fournis.
      Si vous le souhaitez vous pouvez ajouter un bénéficiaire à votre demande.`
      style = { top: "0px" }
    }else if(etape === "documentation"){
      textTitre = "Étape 2 : Document à soumettre"
      textPrincipal = `Grâce au bouton “soumettre” vous pouvez charger le document correspondant.
      Le bouton “ Aperçu” avec l’oeil vous permet d’avoir un visuel du document souhaité.`
      style = { top: "32px" }
    }else if(etape === "meeting"){
      textTitre = "Étape 3 : Fixer un rendez-vous"
      textPrincipal = `Grâce à votre calendrier, fixez un rendez-vous téléphonique avec votre conseiller selon les horaires qui vous sont proposés.`
    }else if(etape === "progression"){
      textTitre = "Étape 5: Kit en cours"
      textPrincipal = `A l’aide de cette section vous pourrez bientôt télécharger les documents nécessaires à votre demande de financement.
      Par ailleurs un guide détaillé vous sera fournis.`
      style = { top: "30px", left: "5px" }
    }else if(etape === "evaluation"){
      textTitre = "Étape 6: Evaluation du service"
      textPrincipal = `Pour améliorer notre accompagnement nous vous proposons d’accéder à un questionnaire de satisfaction.`
    } else {
      return null
    }

    return(
      <div className="validation_modal" style={style}>
        <div className={`validation_modal-point ${ hint ? "" : "hidden"}`} id={`point_${etape}`} onClick={toggleLilModal}></div>
        <div className={`validation_modal-text ${ hint ? "" : "hidden"}`} id={`tip_${etape}`}>
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
    project: state.project.project,
    project_id: state.project_id,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ validateStep, fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(ValidationModal);

