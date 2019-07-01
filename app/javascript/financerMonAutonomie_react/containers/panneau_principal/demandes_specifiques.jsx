import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchProjet, showDemandeAnswer } from '../../actions'

import renderLogo from "../../../components/render_logo"
import { postedAgo } from "../../../components/render_date"

class AppelsProgrammes extends Component {
  componentWillMount(){
    this.props.fetchProjet("/api/v1/projects")
  }

  render(){
    const projects = this.props.project
    // const clients = this.props.clients

    const renderDemandes = () => {
      let nbDemande = 0
      for (var i = projects.solutions.length - 1; i >= 0; i--) {
        if(projects.solutions[i].demandes.length > 0){
          nbDemande = nbDemande + 1
        }
      }

      if(nbDemande === 0){
        return (
          <div className="text-align-center margin-top-15">Aucune demande en cours</div>
        )
      }else{
        return projects.solutions.map((project, index) => {
          if(project.demandes != []){
            return project.demandes.map((demande, index) => {
              const author = demande.author
              const beneName = `${project.first_name} ${project.last_name}`
              const infoProject = {
                beneName: beneName,
                project_id: project.id,
              }
              const time = postedAgo(new Date(demande.created_at));

              return (
                <div className="flex margin-top-15 align-items-center" key={index}>
                  <p className="col-lg-2 font-12 bold black" style={{paddingLeft: 0}}>{demande.category}</p>
                  <div className="col-lg-3 flex align-items-center">
                    {renderLogo(author)}
                    <p className="bold font-12 black">{author.name}</p>
                  </div>
                  <p className="col-lg-3 font-12 blue">{beneName}</p>
                  <p className="col-lg-2 font-12 black">{time}</p>
                  <button
                    className="col-lg-2 blue-gray-btn"
                    style={{padding: "5px"}}
                    onClick={()=>(this.props.showDemandeAnswer(demande, infoProject))}
                    >
                    Voir&nbsp;la&nbsp;demande
                  </button>
                </div>
              );
            })
          }
        });
      }
    };


    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Demandes spécifiques</h4>
          <p className="padding-horizontal-15">
            {`${String(4).padStart(2, '0')}`}
          </p>

          <div className="bordure-bas flex w-100" style={{margin: "15px 15px 0"}}>
            <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Catégorie</p>
            <p className="col-lg-3 font-12">Conseiller</p>
            <p className="col-lg-3 font-12">Bénéficiaire</p>
            <p className="col-lg-4 font-12" style={{paddingRight: 0}}>Envoyé il y a</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "120px" }}>
            {projects != null ? renderDemandes() : <p className="text-align-center margin-top-15">Chargement...</p> }
          </div>
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    project: state.project,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet, showDemandeAnswer }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(AppelsProgrammes);
