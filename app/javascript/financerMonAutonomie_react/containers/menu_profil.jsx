import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { selectClients } from '../actions';

import renderLogo from "../../components/render_logo"

class MenuProfil extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedMenu: null,
      showLeftSide: false,
      clientsLength: 0,
      clientsEnCours: 0,
      clientsArchives: 0,
    };
  }

  renderFiltresNumberClients = (clients) => {
    this.setState({clientsLength: 0})
    this.setState({clientsEnCours: 0})
    this.setState({clientsArchives: 0})

    if(clients != null && clients.clients != undefined){
      this.setState({clientsLength: clients.clients.length})

      for (var i = clients.clients.length - 1; i >= 0; i--) {
        if(clients.clients[i].étape === "archived"){
          this.setState(prevState => ({clientsArchives: prevState.clientsArchives + 1}))
        }else{
          this.setState(prevState => ({clientsEnCours: prevState.clientsEnCours + 1}))
        }
      }
    }
  }

  renderFiltresNumberConseillers = (advisors) => {
    this.setState({clientsLength: 0})
    this.setState({clientsEnCours: 0})
    this.setState({clientsArchives: 0})

    if(advisors != null && advisors.advisors != undefined){
      this.setState({clientsLength: advisors.advisors.length})
    }
  }

  renderFiltresNumberDemandes = (demandes) => {
    this.setState({clientsLength: 0})
    this.setState({clientsEnCours: 0})
    this.setState({clientsArchives: 0})

    if(demandes != null){
      for (var i = demandes.solutions.length - 1; i >= 0; i--) {
        if(demandes.solutions[i].demandes.length > 0){
          for (var j = demandes.solutions[i].demandes.length - 1; j >= 0; j--) {
            this.setState(prevState => ({clientsLength: prevState.clientsLength + 1}))
            if(demandes.solutions[i].demandes[j].close){
              this.setState(prevState => ({clientsArchives: prevState.clientsArchives + 1}))
            }else if(!demandes.solutions[i].demandes[j].close){
              this.setState(prevState => ({clientsEnCours: prevState.clientsEnCours + 1}))
            }
          }
        }
      }
    }
  }

  componentWillReceiveProps(nextProps){
    let selectedMenu = null
    if(nextProps.selectedMenu){
      selectedMenu = nextProps.selectedMenu
    }

    if(selectedMenu && selectedMenu != this.state.selectedMenu){
      this.setState({selectedMenu: selectedMenu})
    }

    if (selectedMenu === "clients" || selectedMenu === "conseillers" || selectedMenu === "demandes") {
      this.setState({showLeftSide: true})
    }else{
      this.setState({showLeftSide: false})
    }

    if(selectedMenu === "clients" && selectedMenu != this.state.selectedMenu || nextProps.clients != this.props.clients){
      const clients = nextProps.clients
      this.renderFiltresNumberClients(clients)
    }else if(selectedMenu === "conseillers" && selectedMenu != this.state.selectedMenu || nextProps.conseillers != this.props.conseillers){
      const advisors = nextProps.conseillers
      this.renderFiltresNumberConseillers(advisors)
    }else if(selectedMenu === "demandes" && selectedMenu != this.state.selectedMenu || nextProps.project != this.props.project){
      const demandes = nextProps.project
      this.renderFiltresNumberDemandes(demandes)
    }
  }

  render(){
    const user = this.props.api.user
    const selectedClients = this.props.selectedClients

    const selectedMenu = this.state.selectedMenu
    const showLeftSide = this.state.showLeftSide
    const clientsLength = this.state.clientsLength
    const clientsEnCours = this.state.clientsEnCours
    const clientsArchives = this.state.clientsArchives

    const renderFiltres = ()=> {
      return(
        <div className="col-lg-6 row align-items-end">
          <div
            className={`padding-horizontal-15 titre-filtre ${selectedClients === "tous" ? "active" : null}`}
            onClick={()=>{this.props.selectClients("tous")}}>Tous <span>{clientsLength}</span></div>
          <div
            className={`padding-horizontal-15 titre-filtre ${selectedClients === "en_cours" ? "active" : null}`}
            onClick={()=>{this.props.selectClients("en_cours")}}>
              {selectedMenu != "conseillers" ? "En cours " : "" }
              {selectedMenu != "conseillers" ? <span>{clientsEnCours}</span> : "" }
          </div>
          <div
            className={`padding-horizontal-15 titre-filtre ${selectedClients === "archives" ? "active" : null}`}
            onClick={()=>{this.props.selectClients("archives")}}>
              {selectedMenu != "conseillers" ? "Archivés " : "" }
              {selectedMenu != "conseillers" ? <span>{clientsArchives}</span> : "" }
          </div>
        </div>
      )
    }

    return (
      <div className={showLeftSide ? 'flex bordure-bas-300' : "" }>
        {showLeftSide ? renderFiltres() : null}
        <div className={`relative col-lg-6 ${showLeftSide ? "margin-left-30" : "offset-lg-6 offset-sm-0"}`} role="group">
          <div
            id="drop-navbar"
            className="dropdown-toggle margin-bottom-15 flex justify-content-end align-items-center"
            data-toggle={ this.props.otherUser ? null : "dropdown" } // désactive bouton si conseiller connecté
            aria-haspopup="true"
            aria-expanded="false">
            <p className={`${ this.props.otherUser ? "not-allowed" : "pointer" } text-align-right`}>Bonjour, {user.first_name} {user.last_name}</p>
            <div className={`${ this.props.otherUser ? "not-allowed" : "pointer" } margin-left-15`}>{renderLogo(user)}</div>
          </div>
          <div className="dropdown-menu" aria-labelledby="drop-navbar">
            <Link to={`/mon_espace/${this.props.current_user_id}/compte/identite`}>Mon compte</Link>
            <a href="/users/sign_out" rel="nofollow" data-method="delete">Se déconnecter</a>
          </div>
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    clients: state.clients,
    conseillers: state.conseillers,
    rootUrl: state.rootUrl,
    current_api: state.current_api,
    current_user_id: state.current_user_id,
    otherUser: state.otherUser,
    project: state.project,
    selectedClients: state.selectedClients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectClients }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(MenuProfil);
