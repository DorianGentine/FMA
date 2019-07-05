import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchConseillers, selectClients } from '../../actions';

import CardClient from './card_client';
import CardConseiller from './card_conseiller';

class PanneauPrincipalConseillers extends Component {
  componentWillMount(){
    if(this.props.conseillers === null){
      this.props.fetchConseillers("/api/v1/users/advisors")
    }
  }

  render(){
    const conseillers = this.props.conseillers
    let conseillersTrue = true

    const renderConseillers = () => {
      return conseillers.advisors.map((advisor, index) => {
        return <CardConseiller advisor={advisor} key={advisor.id}/>
      })
    }

    let titreBarre = this.props.selectedClients
    if(this.props.selectedClients === "en_cours"){
      titreBarre = "En cours"
    }else if(this.props.selectedClients === "archives"){
      titreBarre = "Archivés"
    }

    return (
      <div className="margin-top-15">
        <div className="row">
          <div className="input-wth-icon search-app col-lg-4">
            <i className="fas fa-search"></i>
            <input
              type="text"
              placeholder="Nom ou prénom du conseiller"
              style={{width: "100%"}}
              onChange={()=>{this.props.selectClients(event.target.value)}}
            />
          </div>
        </div>
        { this.props.selectedClients === "tous" ?
          <div className="margin-top-30 margin-bottom-30 flex align-items-center">
            <hr className="ligne-horizontal"/>
          </div>
          :
          <div className="margin-top-30 margin-bottom-30 flex align-items-center">
            <hr className="ligne-horizontal"/>
            <div
              className="font-14 black blue-gray-background flex-grow-1 text-align-center"
              style={{ width: "100%" }}>
              {titreBarre}
            </div>
            <hr className="ligne-horizontal"/>
          </div>
        }
        <div className="row">
          {conseillers != null ? renderConseillers() : <h2 className="text-align-center">Chargement...</h2>}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    conseillers: state.conseillers,
    selectedClients: state.selectedClients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchConseillers, selectClients }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalConseillers);
