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
    if(etape === "documentation"){
      textTitre = "Bienvenue sur votre dashboard"
      textPrincipal = `Commencez par envoyer les documents demandés ici !`
      style = { top: "32px" }
    }else if(etape === "meeting"){
      textTitre = "Félicitations !"
      textPrincipal = `Nous avons bien reçu tous vos documents.
      Vous pouvez désormais prendre rdv avec votre conseiller ici`
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

