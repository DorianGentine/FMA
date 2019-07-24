import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchProjet, selectClients } from '../../actions';

import CardDemande from './card_demande';

class PanneauPrincipalDemandes extends Component {
  componentWillMount(){
    if(!this.props.project){
      this.props.fetchProjet("/api/v1/projects")
    }
  }

  render(){
    const projects = this.props.project

    const renderDemandes = () => {
      let nbDemande = 0
      for (var i = projects.solutions.length - 1; i >= 0; i--) {
        if(projects.solutions[i].demandes.length > 0){
          nbDemande = nbDemande + 1
        }
      }

      if(nbDemande != 0){
        return projects.solutions.map((project, index) => {
          if(project.demandes != []){
            return project.demandes.map((demande, index) => {
              return <CardDemande demande={demande} project={project} key={index} />
            })
          }
        })
      }else{
        return <h2 className="margin-auto margin-top-30 gray">Pas de demandes</h2>
      }
    }

    const options = [
      { name: "Sélectionnez une catégorie", value: "en_cours", key: 0, },
      { name: "Diagnostic", value: "diagnostic", key: 1, },
      { name: "Chiffrage", value: "chiffrage", key: 2, },
      { name: "Financement", value: "financement", key: 3, },
    ]

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
              placeholder="Nom ou prénom du client"
              style={{width: "100%"}}
              onChange={()=>{this.props.selectClients(event.target.value)}}
            />
          </div>
          <div className="col-lg-4 offset-lg-4 margin-top-15-xs">
            <Select
              className="react-dropdown-select"
              options={options}
              valueField="value"
              values={[options.find(opt => opt.name === "Sélectionnez une catégorie")]}
              onChange={(value) => {this.props.selectClients(value[0].value)}}
              labelField="name"
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
          {projects != null ? renderDemandes() : <h2>Chargement...</h2>}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    project: state.project,
    selectedClients: state.selectedClients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet, selectClients }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalDemandes);
