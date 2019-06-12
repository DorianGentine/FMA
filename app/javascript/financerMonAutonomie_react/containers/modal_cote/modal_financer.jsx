import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalFinancer extends Component {
  render(){
    const financer = this.props.modal_selected.financer

    const changeText = () => {
      if(event.target.innerHTML === "... Voir plus"){
        event.target.innerHTML = "<br/>Réduire"
      }else{
        event.target.innerHTML = "... Voir plus"
      }
    }

    const renderAnswers = (answers) => {
      return answers.map((answer, index) => {
        const randomId = Math.floor((Math.random() * 100) + 1);
        return (
          <p className="margin-bottom-15" key={randomId}>
            {answer.content.substr(0, 60)}
            <span
              className="collapse"
              id={`collapseAnswer${randomId}`}>
              {answer.content.substr(60)}
            </span>
            <span
              className="blue pointer"
              data-toggle="collapse"
              data-target={`#collapseAnswer${randomId}`}
              aria-expanded="false"
              aria-controls={`collapseAnswer${randomId}`}
              onClick={()=>{changeText()}}>
               ... Voir plus
            </span>
          </p>
        )
      })
    }

    return(
      <div>
        <div className="flex space-between black margin-bottom-30">
          <h2>Vos financeurs potentiels</h2>
          <i className="far fa-times-circle pointer" onClick={this.props.closeModal}></i>
        </div>
        <div className="blue-gray-box align-text-center vertical margin-bottom-30 margin-top-30">
          <div style={{marginRight: "-15px"}}>{renderLogo(financer)}</div>
          <h4 className="black">{financer.name}</h4>
          <p className="blue">Conseil en solutions</p>
        </div>
        <p className="black">Description de l'organisme</p>
        <p>{financer.description.substr(0, 60)}
          <span
            className="collapse"
            id="collapseDescription">
            {financer.description.substr(60)}
          </span>
          <span
            className="blue pointer"
            data-toggle="collapse"
            data-target="#collapseDescription"
            aria-expanded="false"
            aria-controls="collapseDescription"
            onClick={()=>{changeText()}}>
             ... Voir plus
          </span>
        </p>
        <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
        <p className="black">Analyse de votre situation</p>
        {renderAnswers(financer.answers)}
        <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
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

export default connect(mapStateToProps, mapDispatchToProps)(ModalFinancer);