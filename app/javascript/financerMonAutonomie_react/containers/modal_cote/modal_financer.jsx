import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeModal } from '../../actions';

import renderLogo from "../../../components/render_logo"

class ModalFinancer extends Component {
  render(){
    const statut = this.props.statut
    const financer = this.props.modal_selected.financer

    const changeText = (id) => {
      const chevron = document.getElementById(`chevron_${id}`)
      if(chevron.classList.value === "fas fa-chevron-down"){
        chevron.classList.add('fa-chevron-up')
        chevron.classList.remove('fa-chevron-down')
      }else{
        chevron.classList.add('fa-chevron-down')
        chevron.classList.remove('fa-chevron-up')
      }
    }

    const renderUnmatched = () =>{
      if(financer.unmatched != null){
        return (
          <div>
            <div className="flex space-between pointer"
                data-toggle="collapse"
                data-target="#collapseNote"
                aria-expanded="false"
                aria-controls="collapseNote"
                onClick={()=>{changeText("Note")}}>
              <p className="black"><i className="red margin-right-15 fas fa-exclamation-triangle"></i> À noter</p>
              <div className="red">
                <i className="fas fa-chevron-down" id={`chevron_Note`}></i>
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
            <div className="flex space-between pointer"
                data-toggle="collapse"
                data-target="#collapseDescription"
                aria-expanded="false"
                aria-controls="collapseDescription"
                onClick={()=>{changeText("Description")}}>
              <p className="black">Description de l'organisme</p>
              <div className="blue">
                <i className="fas fa-chevron-down" id={`chevron_Description`}></i>
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
            <div className="flex space-between pointer"
                data-toggle="collapse"
                data-target="#collapseConseil"
                aria-expanded="false"
                aria-controls="collapseConseil"
                onClick={()=>{changeText("Conseil")}}>
              <p className="black">Conseil</p>
              <div className="blue">
                <i className="fas fa-chevron-down" id={`chevron_Conseil`}></i>
              </div>
            </div>
            <p className="collapse" id="collapseConseil">{financer.answer}</p>
            <hr className="ligne-horizontal gray-200-background margin-bottom-30 margin-top-30"/>
          </div>
        )
      }
    }

    const renderAnswers = (financer) => {
      const answers = financer.answers
      const randomId = Math.floor((Math.random() * 100) + 1);
      if(answers != [] && financer.name != "ANAH"){
        return answers.map((answer, index) => {
          return (
            <div key={index}>
              { index === 0 && answers.length > 1 ? <p className="black">Analyse de votre situation</p> : ""}
              <div className="flex space-between pointer"
                  data-toggle="collapse"
                  data-target={`#collapseAnswer${index}`}
                  aria-expanded="false"
                  aria-controls={`collapseAnswer${index}`}
                  onClick={()=>{changeText(index)}}>
                { answers.length > 1 ? <p className="margin-bottom-15">{`Solution ${index + 1}`}</p> : <p className="black">Analyse de votre situation</p>}
                <div className="blue">
                  <i className="fas fa-chevron-down" id={`chevron_${index}`}></i>
                </div>
              </div>

              <p className="margin-bottom-15" className="collapse"
                  id={`collapseAnswer${index}`}>
                {answer.content}</p>
            </div>
          )
        })
      }else if(answers != [] && financer.name === "ANAH"){
        return (
            <div>
              <div className="flex space-between pointer"
                  data-toggle="collapse"
                  data-target={`#collapseAnswer${randomId}`}
                  aria-expanded="false"
                  aria-controls={`collapseAnswer${randomId}`}
                  onClick={()=>{changeText(randomId)}}>
                <p className="black">Analyse de votre situation</p>
                <div className="blue">
                  <i className="fas fa-chevron-down" id={`chevron_${randomId}`}></i>
                </div>
              </div>

              <p className="margin-bottom-15" className="collapse"
                  id={`collapseAnswer${randomId}`}>
                {answers[0].content}
                <br/><br/>
                {answers[1].content}
              </p>
            </div>
          )
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
          {renderAnswers(financer)}
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
