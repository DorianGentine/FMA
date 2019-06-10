import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class KitDeFinancement extends Component {
  render(){
    const statut = this.props.api.statut

    if(statut === "client"){
      const renderDocs = () => {
        // return this.props.messages.map((message, index) => {
          return (
            <div className="flex margin-top-15">
              <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>Intérieur</p>
              <p className="col-lg-4 font-12">Dossier de maintenance</p>
              <p className="col-lg-3 font-12">Caisse retraite</p>
              <p className="col-lg-3 font-12">12/03/2019</p>
            </div>
          );
        // });
      };

      return (
        <div className="col-lg-12">
          <div className="white-box flex flex-wrap">
            <h4 className="col-lg-6">Découvrez votre kit de financement</h4>
            <p className="bold col-lg-1">2</p>
            <a className="col-lg-5 text-align-right font-12" href="#">Tout télécharger</a>
            <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
              <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Catégorie</p>
              <p className="col-lg-4 font-12">Nom du fichier</p>
              <p className="col-lg-3 font-12">Financeurs éligibles</p>
              <p className="col-lg-3 font-12" style={{paddingRight: 0}}>Date de publication</p>
            </div>
            <div className="scroll col-lg-12" style={{ height: "80px" }}>
              {renderDocs()}
            </div>
          </div>
        </div>
      );

    // App conseiller
      // Appels programmés
      }else if(statut === "conseiller" && this.props.appelsProgrammes){
        const renderCalls = () => {
          // return this.props.messages.map((message, index) => {
            return (
              <div className="flex margin-top-15">
                <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>9H <span className="gray-300">aujourd'hui</span></p>
                <p className="col-lg-3 font-12">Michel de Fremont</p>
                <p className="col-lg-3 font-12">4 Financeurs</p>
                <p className="col-lg-2 font-12">0630208894</p>
                <div className="col-lg-1">
                  <label className="switch">
                    <input type="checkbox" />
                    <span className="slider round"></span>
                  </label>
                </div>
                <div className="relative col-lg-1 text-align-right" role="group">
                  <div
                    id={`drop-call${"michou"}`}
                    className="pointer font-12"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false">...
                  </div>
                  <div className="dropdown-menu drop-menu-call" aria-labelledby={`drop-call${"michou"}`}>
                    <a href="#">Voir&nbsp;le&nbsp;profil</a>
                    <a href="#">Envoyer&nbsp;un&nbsp;message</a>
                  </div>
                </div>
              </div>
            );
          // });
        };

        return (
          <div className="col-lg-12">
            <div className="white-box flex flex-wrap align-items-center">
              <h4 className="padding-horizontal-15 no-margin">Appels programmés</h4>
              <p className="blue padding-horizontal-15">{`${3} appels aujourd'hui`}</p>
              <p className="padding-horizontal-15 text-align-right font-12 icon-arrow-right-gray flex-grow-1"></p>
              <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
                <p className="col-lg-2 font-12" style={{paddingLeft: 0}}>Heure</p>
                <p className="col-lg-3 font-12">Nom</p>
                <p className="col-lg-3 font-12">Financeurs éligibles</p>
                <p className="col-lg-2 font-12">Tél</p>
                <p className="col-lg-2 font-12" style={{paddingRight: 0}}>Appelé</p>
              </div>
              <div className="scroll col-lg-12" style={{ height: "120px" }}>
                {renderCalls()}
              </div>
            </div>
          </div>
        );

      // Liste des financeurs
      }else if(statut === "conseiller" && !this.props.appelsProgrammes){
        const renderFinanceurs = () => {
          // return this.props.messages.map((message, index) => {
            return (
              <div className="flex margin-top-15">
                <p className="col-lg-3 font-12 black" style={{paddingLeft: 0}}>Caisse retraite</p>
                <p className="col-lg-7 font-12 black">Description</p>
                <p className="col-lg-2 font-12 blue-gray-btn center-text">Accéder</p>
              </div>
            );
          // });
        };

        return (
          <div className="col-lg-12">
            <div className="white-box flex flex-wrap align-items-center">
              <h4 className="padding-horizontal-15 no-margin">Liste des financeurs</h4>
              <p className="bold padding-horizontal-15">{`${10}`}</p>
              <a className="padding-horizontal-15 text-align-right font-12 flex-grow-1" href="#">Rechercher un financeur</a>
              <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
                <p className="col-lg-3 font-12" style={{paddingLeft: 0}}>Nom</p>
                <p className="col-lg-9 font-12" style={{paddingRight: 0}}>Description</p>
              </div>
              <div className="scroll col-lg-12" style={{ height: "80px" }}>
                {renderFinanceurs()}
              </div>
            </div>
          </div>
        );
      }
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(mapStateToProps, null)(KitDeFinancement);
