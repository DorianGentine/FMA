import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalFinancer extends Component {
  render(){
    const statut = this.props.statut
    const financer = this.props.modal_selected.financer

    const changeText = () => {
      if(event.target.classList.value === "fas fa-chevron-down"){
        event.target.classList.add('fa-chevron-up')
        event.target.classList.remove('fa-chevron-down')
      }else{
        event.target.classList.add('fa-chevron-down')
        event.target.classList.remove('fa-chevron-up')
      }
    }

    const renderUnmatched = () =>{
      if(financer.unmatched != null){
        return (
          <div>
            <div className="flex space-between">
              <p className="black"><i className="red margin-right-15 fas fa-exclamation-triangle"></i> À noter</p>
              <div className="red pointer"
                data-toggle="collapse"
                data-target="#collapseNote"
                aria-expanded="false"
                aria-controls="collapseNote">
                <i className="fas fa-chevron-down" onClick={()=>{changeText()}}></i>
              </div>
            </div>
            <p className="collapse" id="collapseNote">{financer.unmatched}<br/><br/><strong>Sachez que ces financeurs ne peuvent être cumulés. Vous aurez donc à faire un choix entre l'un d'entre eux si vous les sollicitez.</strong></p>
            <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
          </div>
        )
      }
    }

    const renderDescription = () =>{
      if(financer.description != null){
        return (
          <div>
            <div className="flex space-between">
              <p className="black">Description de l'organisme</p>
              <div className="blue pointer"
                data-toggle="collapse"
                data-target="#collapseDescription"
                aria-expanded="false"
                aria-controls="collapseDescription">
                <i className="fas fa-chevron-down" onClick={()=>{changeText()}}></i>
              </div>
            </div>
            <p className="collapse" id="collapseDescription">{financer.description}</p>
            <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
          </div>
        )
      }
    }

    const renderConseil = () =>{
      if(financer.answer != null){
        return (
          <div>
            <div className="flex space-between">
              <p className="black">Conseil</p>
              <div className="blue pointer"
                data-toggle="collapse"
                data-target="#collapseDescription"
                aria-expanded="false"
                aria-controls="collapseDescription">
                <i className="fas fa-chevron-down" onClick={()=>{changeText()}}></i>
              </div>
            </div>
            <p className="collapse" id="collapseDescription">{financer.answer}</p>
            <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
          </div>
        )
      }
    }

    const renderAnswers = (answers) => {
      if(answers != []){
        console.log(answers.length)
        return answers.map((answer, index) => {
          const randomId = Math.floor((Math.random() * 100) + 1);
          return (
            <div key={index}>
              { index === 0 && answers.length > 1 ? <p className="black">Analyse de votre situation</p> : ""}
              <div className="flex space-between">
                { answers.length > 1 ? <p className="margin-bottom-15">{`Solution ${index + 1}`}</p> : <p className="black">Analyse de votre situation</p>}
                <div className="blue pointer"
                  data-toggle="collapse"
                  data-target={`#collapseAnswer${randomId}`}
                  aria-expanded="false"
                  aria-controls={`collapseAnswer${randomId}`}>
                  <i className="fas fa-chevron-down" onClick={()=>{changeText()}}></i>
                </div>
              </div>
              <p className="margin-bottom-15" className="collapse"
                  id={`collapseAnswer${randomId}`}>
                {answer.content}</p>
            </div>
          )
        })
      }
    }

    if(statut === "client"){
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
          {renderUnmatched()}
          {renderDescription()}
          {renderConseil()}
          {renderAnswers(financer.answers)}
          <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
        </div>
      )


    }else if(statut === "conseiller" || statut === "admin"){

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
          {renderDescription()}
          <button className="btn-blue margin-top-30 offset-3 col-6 text-align-center" onClick={this.props.closeModal}>Fermer</button>
        </div>
      )
    }
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
    statut: state.api.statut,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeModal }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ModalFinancer);
