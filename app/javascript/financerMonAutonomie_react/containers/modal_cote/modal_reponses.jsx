import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal, fetchModalReponses } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalReponses extends Component {
  componentWillMount(){
    const user = this.props.modal_selected.user
    this.props.fetchModalReponses(`/api/v1/formularies/${user.id}`)
  }

  componentWillReceiveProps(nextProps){
    const user = nextProps.modal_selected.user
    if(this.props.modal_selected.user != user){
      this.props.fetchModalReponses(`/api/v1/formularies/${user.id}`)
    }
  }

  render(){
    const user = this.props.modal_selected.user
    const index = this.props.modal_selected.index
    const reponses = this.props.modal_reponses

    const renderReponses = () => {
      return reponses.map((reponse, index) => {
        return(
          <div className="margin-bottom-15" key={index}>
            <p className="black">{reponse.question}</p>
            <p>{reponse.answer}</p>
          </div>
        )
      })
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Vos réponses</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box align-text-center vertical margin-bottom-30 margin-top-30">
          <div className="margin-bottom-15" style={{marginRight: "-15px"}}>{renderLogo(user)}</div>
          <h4 className="black">{`Bénéficiaire ${index + 1}`}</h4>
          <p className="blue">{user.first_name}</p>
        </div>
        {reponses != null ? renderReponses() : <h2>Chargement...</h2>}
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    modal_reponses: state.modal_reponses,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal, fetchModalReponses }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalReponses);
