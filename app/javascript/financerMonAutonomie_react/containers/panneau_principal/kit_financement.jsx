import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import DownloadLink from "react-download-link";
import { saveAs } from 'file-saver';

import Financers from './financers'
import ValidationModal from '../beneficiaire/validation_modal'

const JSZip = require("jszip");

class KitDeFinancement extends Component {
  render(){
    const kits = this.props.project.kits
    const etape = this.props.project.project.etape
    const first_name = this.props.project.formularies[0].first_name

    const renderKits = () => {
      return kits.map((kit, index) => {
        let nbDocs = 0
        {kit.notice.url != null ? nbDocs = nbDocs + 1 : null}
        {kit.formulary.url != null ? nbDocs = nbDocs + 1 : null}
        {kit.model_1.url != null ? nbDocs = nbDocs + 1 : null}
        {kit.model_2.url != null ? nbDocs = nbDocs + 1 : null}

        return (
          <div className="flex margin-top-15" key={index}>
            <p className="col-lg-4 font-12" style={{paddingLeft: 0}}>{kit.notice.url ? kit.notice.url.substr(kit.notice.url.lastIndexOf('/') + 1, 25) : ""}</p>
            <p className="col-lg-2 font-12 blue bold text-align-right">{nbDocs}</p>
            <p className="col-lg-4 font-12">_______</p>
            <a className="blue-gray-btn" href={kit.download_ressource}>Télécharger <i className="fas fa-download"></i></a>
          </div>
            // <p className="col-lg-4 font-12">{kit.formulary && kit.formulary.url != null ? kit.formulary.url.substr(kit.notice.lastIndexOf('/') + 1, 20) : ""}</p>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap relative">
          {etape === "progression" ? <ValidationModal /> : null}
          <h4 className="col-lg-6">Découvrez votre kit de financement</h4>
          <p className="bold col-lg-1">{etape === "progression" ? 0 : kits.length}</p>
          {etape === "evaluation" ?
            <div className="col-lg-5 text-align-right"><a className="blue-gray-btn" href={this.props.project.download_all_ressources}>Tout télécharger <i className="fas fa-download"></i></a></div>
            : null
          }
          <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
            <p className="col-lg-4 font-12" style={{paddingLeft: 0}}>Titre</p>
            <p className="col-lg-2 font-12">Documents</p>
            <p className="col-lg-4 font-12">Date de dernière mise à jour</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "calc(100vh - 720px)", minHeight: "80px" }}>
            { kits != undefined && etape === "evaluation" ? renderKits() : <h2 className="text-align-center margin-top-30 gray-300">Votre conseiller confectionne votre kit</h2>}
          </div>
        </div>
      </div>
            // <p className="col-lg-2 font-12" style={{paddingRight: 0}}>Date de publication</p>
    );
  }
};

function mapStateToProps(state) {
  return {
    project: state.project,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(mapStateToProps, null)(KitDeFinancement);
