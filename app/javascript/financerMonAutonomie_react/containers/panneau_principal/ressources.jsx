import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchRessources, showRessource, showCreateRessource, fetchPostCompte } from '../../actions'

class Ressources extends Component {
  componentWillMount(){
    this.props.fetchRessources("/api/v1/ressources")
  }

  render(){
    const ressources = this.props.ressources
    const statut = this.props.api.statut

    const renderRessources = () => {
      return ressources.map((ressource, index) => {

        let fetchDelete
        if(statut === "admin"){
          fetchDelete = () => {
            let url = `/api/v1/ressources/${ressource.id}`
            let method = "DELETE"

            this.props.fetchPostCompte(url, null, method, ()=>{this.props.fetchRessources(`/api/v1/ressources`)})
          }
        }

        return (
          <div className="flex space-between align-items-center margin-bottom-15" key={index}>
            <div className="icon-doc margin-right-15"></div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">{ressource.title}</h4>
              <p className="font-12">{ressource.description}</p>
            </div>
            <button className="blue-gray-btn" onClick={()=>{this.props.showRessource(ressource)}}>Accéder</button>
            {statut === "admin" ?
              <button className="blue-gray-btn" onClick={fetchDelete}><i className="red far fa-trash-alt"></i></button>
            : null}
          </div>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Liste des ressources</h4>
          <p className="bold padding-horizontal-15" style={{paddingLeft: "unset"}}>{`${ressources ? ressources.length : 0} ressources`}</p>
          <p
            className={`margin-right-15 text-align-right font-12 ${statut === "conseiller" ? "icon-arrow-right-gray" : "pointer" } flex-grow-1`}
            onClick={statut === "admin" ? this.props.showCreateRessource : ()=>{}}
            >
            {statut === "admin" ? "Créer une ressource" : ""}
          </p>
          <div className="scroll col-lg-12 margin-top-15" style={{ height: "calc(100vh - 700px)", minHeight: "80px" }}>
            {ressources != null ? renderRessources() : <h2>Chargement...</h2> }
          </div>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    ressources: state.ressources,
    api: state.api,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchRessources, showRessource, showCreateRessource, fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Ressources);
