import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { selectClients } from '../actions';

import renderLogo from "../../components/render_logo"

class MenuProfil extends Component {
  // constructor(props) {
  //   super(props)
  //   this.state = {
  //     selectedMenu: null,
  //     showLeftSide: false,
  //     clientsLength: 0,
  //     clientsEnCours: 0,
  //     clientsArchives: 0,
  //   };
  // }

  // componentWillReceiveProps(nextProps){
  //   let selectedMenu
  //   if(nextProps.selectedMenu){
  //     selectedMenu = nextProps.selectedMenu
  //   }

  //   if(selectedMenu && selectedMenu != this.state.selectedMenu){
  //     this.setState({selectedMenu: selectedMenu})
  //   }

  //   if(selectedMenu === "clients" || selectedMenu === "conseillers" || selectedMenu === "demandes"){
  //     this.setState({showLeftSide: true})
  //   }else{
  //     this.setState({showLeftSide: false})
  //   }

  //   const renderFiltres = ()=> {
  //     const selectedClients = this.props.selectedClients
  //     let clients = this.props.clients

  //     if(clients != null && clients.clients != undefined){
  //       this.setState({clientsLength: clients.clients.length})
  //       this.setState({clientsEnCours: 0})
  //       this.setState({clientsArchives: 0})

  //       for (var i = this.state.clientsLength - 1; i >= 0; i--) {
  //         if(clients.clients[i].étape === "evaluation"){
  //           this.setState(prevState => ({clientsArchives: prevState.clientsArchives + 1}))
  //         }else{
  //           this.setState(prevState => ({clientsEnCours: prevState.clientsEnCours + 1}))
  //         }
  //       }
  //     }else if(clients != null && clients.advisors != undefined){
  //       this.setState({clientsLength: clients.advisors.length})
  //     }else if(selectedMenu === "demandes"){
  //       clients = this.props.project
  //       if(clients != null){
  //         this.setState({clientsLength: 0})
  //         this.setState({clientsEnCours: 0})
  //         this.setState({clientsArchives: 0})
  //         for (var i = clients.solutions.length - 1; i >= 0; i--) {
  //           if(clients.solutions[i].demandes.length > 0){
  //             this.setState(prevState => ({clientsLength: prevState.clientsLength + 1}))
  //             for (var j = clients.solutions[i].demandes.length - 1; j >= 0; j--) {
  //               if(clients.solutions[i].demandes[j].close){
  //                 this.setState(prevState => ({clientsArchives: prevState.clientsArchives + 1}))
  //               }else if(!clients.solutions[i].demandes[j].close){
  //                 this.setState(prevState => ({clientsEnCours: prevState.clientsEnCours + 1}))
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //     return(
  //       <div className="col-lg-6 row align-items-end">
  //         <div
  //           className={`padding-horizontal-15 titre-filtre ${selectedClients === "tous" ? "active" : null}`}
  //           onClick={()=>{this.props.selectClients("tous")}}>Tous <span>{clientsLength}</span></div>
  //         <div
  //           className={`padding-horizontal-15 titre-filtre ${selectedClients === "en_cours" ? "active" : null}`}
  //           onClick={()=>{this.props.selectClients("en_cours")}}>
  //             {selectedMenu != "conseillers" ? "En cours " : "" }
  //             {selectedMenu != "conseillers" ? <span>{clientsEnCours}</span> : "" }
  //         </div>
  //         <div
  //           className={`padding-horizontal-15 titre-filtre ${selectedClients === "archives" ? "active" : null}`}
  //           onClick={()=>{this.props.selectClients("archives")}}>
  //             {selectedMenu != "conseillers" ? "Archivés " : "" }
  //             {selectedMenu != "conseillers" ? <span>{clientsArchives}</span> : "" }
  //         </div>
  //       </div>
  //     )
  //   }

  // }

  render(){
    const user = this.props.api.user
    let selectedMenu
    if(this.props.selectedMenu){
      selectedMenu = this.props.selectedMenu
    }

    let showLeftSide = false
    if(selectedMenu === "clients" || selectedMenu === "conseillers" || selectedMenu === "demandes"){
      showLeftSide = true
    }


    const renderFiltres = ()=> {
      const selectedClients = this.props.selectedClients
      let clients = this.props.clients
      let clientsLength = 0
      let clientsEnCours = 0
      let clientsArchives = 0
      if(clients != null && clients.clients != undefined){
        clientsLength = clients.clients.length
        for (var i = clients.clients.length - 1; i >= 0; i--) {
          if(clients.clients[i].étape === "evaluation"){
            clientsArchives = clientsArchives + 1
          }else{
            clientsEnCours = clientsEnCours + 1
          }
        }
      }else if(clients != null && clients.advisors != undefined){
        clientsLength = clients.advisors.length
      }else if(selectedMenu === "demandes"){
        clients = this.props.project
        if(clients != null){
          clientsLength = 0
          clientsEnCours = 0
          clientsArchives = 0
          for (var i = clients.solutions.length - 1; i >= 0; i--) {
            if(clients.solutions[i].demandes.length > 0){
              clientsLength = clientsLength + 1
              for (var j = clients.solutions[i].demandes.length - 1; j >= 0; j--) {
                if(clients.solutions[i].demandes[j].close){
                  clientsArchives = clientsArchives + 1
                }else if(!clients.solutions[i].demandes[j].close){
                  clientsEnCours = clientsEnCours + 1
                }
              }
            }
          }
        }
      }
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
        <div className={`relative col-lg-6 ${showLeftSide ? "margin-left-30" : "offset-6"}`} role="group">
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
