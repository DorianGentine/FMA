import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchPostCompte } from '../../actions'

import renderLogo from "../../../components/render_logo"

class CardDemande extends Component {
  render(){
    const project = this.props.project
    const demande = this.props.demande

    const mydate = new Date(demande.created_at);
    const month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][mydate.getMonth()];
    const dateInscription = mydate.getDate() + ' ' + month + ' ' + mydate.getFullYear();

    const fullNameAdivsor = `${demande.author.name}`
    const fullNameBene = `${project.first_name} ${project.last_name}`

    let value = {close: true}
    if(demande.close){
      {close: false}
    }

    const selectedClients = this.props.selectedClients
    if(selectedClients === "tous" ||
      fullNameAdivsor.toLowerCase().includes(selectedClients.toLowerCase()) ||
      fullNameBene.toLowerCase().includes(selectedClients.toLowerCase()) ||
      demande.category.toLowerCase().includes(selectedClients.toLowerCase()) ) {
      return(
        <div className="col-lg-4 col-xs-12 col-sm-6">
          <div className="white-box" style={{padding: "20px"}}>
            <div className="row">
              <div className="col-lg-12 flex align-items-center margin-bottom-15">
                <div /*style={{marginLeft: "-10px"}}*/>
                  <p className="font-12 black bold">{fullNameAdivsor}</p>
                  <p className="font-12">{`créée le ${dateInscription}`}</p>
                </div>
              </div>
              <div className="col-lg-12 font-12 margin-bottom-30">{demande.description}</div>
              <div className="col-lg-12 font-12">Catégorie:</div>
              <div className="col-lg-12 font-12 black margin-bottom-15">{demande.category}</div>
              <div className="col-lg-12 font-12">Bénéficiaire:</div>
              <div className="col-lg-12 font-12 black margin-bottom-30">{fullNameBene}</div>
              <div className="col-lg-12">
                <button
                  className={`w-100 blue-gray-btn ${demande.close ? "green" : "red"}`}
                  onClick={()=>{this.props.fetchPostCompte(`/api/v1/requests/${demande.id}`, value, "PATCH")}}
                  >{!demande.close ? "Archiver la demande" : "Rouvrir la demande"}</button>
              </div>
            </div>
          </div>
        </div>
                // {renderLogo(client)}
              // <div className="relative col-lg-4 text-align-right" role="group">
              //   <div
              //     id={`drop-demande${mydate.getSeconds()}${mydate.getMilliseconds()}`}
              //     className="pointer"
              //     data-toggle="dropdown"
              //     aria-haspopup="true"
              //     aria-expanded="false">...
              //   </div>
              //   <div
              //     className="dropdown-menu drop-menu-call"
              //     aria-labelledby={`drop-demande${mydate.getDate()}${mydate.getMonth()}`}>
              //     <a href="#">Archiver</a>
              //   </div>
              // </div>
      )
    }else{
      return null
    }
  }
}

function mapStateToProps(state) {
  return {
    selectedClients: state.selectedClients,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(CardDemande);
