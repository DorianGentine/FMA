import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchProjet, showDemandeAnswer } from '../../actions'

import renderLogo from "../../../components/render_logo"
import { postedAgo } from "../../../components/render_date"

class AppelsProgrammes extends Component {
  constructor(props) {
    super(props)
    this.state = {
      nbDemandeEnCours: 0,
    };
  }

  calculateNbDemandeEnCours = (projects) => {
  // calcul nombre de demandes en cours
    for (var i = projects.solutions.length - 1; i >= 0; i--) {
      if(projects.solutions[i].demandes.length > 0){
        for (var j = projects.solutions[i].demandes.length - 1; j >= 0; j--) {
          if(projects.solutions[i].demandes[j].close === false){
            this.setState(prevState => ({nbDemandeEnCours: prevState.nbDemandeEnCours + 1}))
          }
        }
      }
    }
  }

  componentWillMount(){
    if(!this.props.project){
      this.props.fetchProjet("/api/v1/projects")
    }
    if(this.props.project){
      this.calculateNbDemandeEnCours(this.props.project)
    }
  }

  componentWillReceiveProps(nextProps){
    const projects = nextProps.project
    if(nextProps.project != this.props.project){
      this.calculateNbDemandeEnCours(nextProps.project)
    }
  }

  render(){
    const projects = this.props.project

    const renderDemandes = () => {
      let nbDemandeEnCours = this.state.nbDemandeEnCours

      if(nbDemandeEnCours === 0){
        return (
          <div className="text-align-center margin-top-15">Aucune demande en cours</div>
        )
      }else{
        return projects.solutions.map((project, index) => {
          if(project.demandes != []){
            return project.demandes.map((demande, index) => {
              if(demande.close === false){
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
                    <div className={`col-lg-3 ${this.props.isMobile ? "" : "flex "}align-items-center d-none d-sm-block`}>
                      {renderLogo(author)}
                      <p className="bold font-12 black">{author.name}</p>
                    </div>
                    <p className="col-lg-3 font-12 blue">{beneName}</p>
                    <p className="col-lg-2 font-12 black d-none d-sm-block">{time}</p>
                    <button
                      className="col-lg-2 blue-gray-btn"
                      style={{padding: "5px"}}
                      onClick={()=>(this.props.showDemandeAnswer(demande, infoProject))}
                      >
                      {this.props.isMobile ? "Demande" : "Voir&nbsp;la&nbsp;demande"}
                    </button>
                  </div>
                );
              }
            })
          }
        });
      }
    };


    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Demandes spécifiques</h4>
          {this.props.isMobile ? null : <p className="padding-horizontal-15">{`${String(this.state.nbDemandeEnCours).padStart(2, '0')}`}</p>}

          <div className="bordure-bas flex w-100" style={{margin: "15px 15px 0"}}>
            <p className="col-lg-2 font-12 col-xs-4" style={{paddingLeft: 0}}>Catégorie</p>
            <p className="col-lg-3 font-12 d-none d-sm-block">Conseiller</p>
            <p className="col-lg-3 font-12 col-xs-8">Bénéficiaire</p>
            <p className="col-lg-4 font-12 d-none d-sm-block" style={{paddingRight: 0}}>Envoyé il y a</p>
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
    isMobile: state.isMobile,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet, showDemandeAnswer }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(AppelsProgrammes);
