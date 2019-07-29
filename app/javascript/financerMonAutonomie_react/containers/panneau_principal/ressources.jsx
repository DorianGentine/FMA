import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchRessources, showRessource, showCreateRessource, fetchPostCompte } from '../../actions'

class Ressources extends Component {
  componentWillMount(){
    if(!this.props.ressources){
      this.props.fetchRessources("/api/v1/ressources")
    }
  }

  render(){
    const ressources = this.props.ressources
    const statut = this.props.api.statut
    const isMobile = this.props.isMobile

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
        console.log(ressource.title.replace("_", " ").replace("CaisseRetraiteComplementaire", "Caisse retraite complémentaire").replace("CaisseRetraitePrincipale", "Caisse retraite principale").replace("_", " "))
        return (
          <div className="flex space-between align-items-center margin-bottom-15" key={index}>
            {isMobile?null:<div className="icon-doc margin-right-15"></div>}
            <div className="flex-grow-1 margin-right-15">
              <h4 className="font-12 no-margin">{ressource.title.replace("_", " ").replace("CaisseRetraiteComplementaire", "Caisse retraite complémentaire").replace("CaisseRetraitePrincipale", "Caisse retraite principale").replace("_", " ")}</h4>
              <p className="font-12 d-none d-sm-block">{ressource.description}</p>
            </div>
            <button className="blue-gray-btn" onClick={()=>{this.props.showRessource(ressource)}}>Accéder</button>
            {statut === "admin" ?
              <button className="blue-gray-btn margin-left-15" onClick={fetchDelete}><i className="red far fa-trash-alt"></i></button>
            : null}
          </div>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-baseline">
          <h4 className="margin-right-15 no-margin-xs">Liste des ressources</h4>
          <p className="flex-grow-1 text-align-right-xs">{`${ressources ? ressources.length : 0}${this.props.isMobile ? "" : " ressources"}`}</p>
          {statut === "conseiller" ? null :
            <p className="text-align-right font-12 pointer create-doc"
              onClick={this.props.showCreateRessource}>
              Créer une ressource</p>
          }
          <div className="scroll w-100 margin-top-15-xs" style={{ height: "calc(100vh - 700px)", minHeight: `${isMobile?"200px":"80px"}` }}>
            {ressources != null ? renderRessources() : <p className="text-align-center margin-top-30">Chargement...</p> }
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
    isMobile: state.isMobile,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchRessources, showRessource, showCreateRessource, fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Ressources);
