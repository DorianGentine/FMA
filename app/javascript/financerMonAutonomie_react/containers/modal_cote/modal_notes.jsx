import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalNotes extends Component {
  render(){
    const notes = this.props.modal_selected.notes

    const addNote = () => {
      this.props.closeModal()
    }

    const renderNotes = () => {
      // return notes.map((answer, index) => {
        return(
          <div className="flex margin-bottom-30">
            <div>{renderLogo(this.props.api.user)}</div>
            <div className="flex flex-wrap">
              <div className="col-10 black font-12 no-padding">Wireframe for new prototypage de la ...</div>
              <div className="col-2 blue font-12 no-padding">Il y a 1h</div>
              <div className="col-12 font-12 no-padding">Bonjour je viens de formuler une demande spécifique concernant le dossier.</div>
              <div className="col-6 no-padding flex">
                <a href="#" className="col-6 font-12 no-padding black">modifier</a>
                <a href="#" className="col-6 font-12 no-padding black">supprimer</a>
              </div>
            </div>
          </div>
        )
      // }
    }

    return(
      <div>
        <div className="flex space-between margin-bottom-30">
          <h2>Notes du projet</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        {renderNotes()}
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
        <h4>Titre</h4>
        <input className="form-control margin-bottom-30" type="text"/>
        <h4>Message</h4>
        <textarea className="form-control margin-bottom-30" rows="4"/>
        <button className="btn-blue margin-top-30 offset-6 col-6 text-align-center" onClick={addNote}>Ajouter</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    api: state.api,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalNotes);
