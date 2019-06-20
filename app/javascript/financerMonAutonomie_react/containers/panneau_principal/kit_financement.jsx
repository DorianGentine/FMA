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
    console.log(etape)
    const first_name = this.props.project.formularies[0].first_name

    const zip = new JSZip();
    for (var i = 0; i < kits.length; i++) {
      const kitZip = zip.folder(`Ressource ${i + 1}`);
      const notice = $.get(kits[i].notice);
      kitZip.file(`notice_ressource_${i + 1}.pdf`, notice);
      const formulary = $.get(kits[i].formulary);
      kitZip.file(`formulary_ressource_${i + 1}.pdf`, formulary);
    }
    console.log(zip)

    const download = () =>{
      zip.generateAsync({type:"blob"}).then(function (blob) { // 1) generate the zip file
        saveAs(blob, `kit_${first_name}.zip`);                          // 2) trigger the download
      }, function (err) {
        console.log(err);
      });
    }


    // let promise = null;
    // if (JSZip.support.uint8array) {
    //   promise = zip.generateAsync({type : "uint8array"});
    // } else {
    //   promise = zip.generateAsync({type : "string"});
    // }
    // console.log(promise)
    const renderKits = () => {
      return kits.map((kit, index) => {
        return (
          <div className="flex margin-top-15" key={index}>
            <p className="col-lg-2 font-12 blue bold" style={{paddingLeft: 0}}>{kit.ressource}</p>
            <p className="col-lg-4 font-12">{kit.notice ? kit.notice.substr(kit.notice.lastIndexOf('/') + 1, 25) : ""}</p>
            <p className="col-lg-3 font-12">{kit.formulary ? kit.formulary.substr(kit.notice.lastIndexOf('/') + 1, 20) : ""}</p>
            <p className="col-lg-3 font-12">_____</p>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap relative">
          {etape === "progression" ? <ValidationModal /> : null}
          <h4 className="col-lg-6">Découvrez votre kit de financement</h4>
          <p className="bold col-lg-1">2</p>
          <a
            className="col-lg-5 text-align-right font-12"
            onClick={download}
            >{`${ this.props.project.project.etape === "evaluation" ? "Tout télécharger" : ""}`}
          </a>
          <div className="bordure-bas flex w-100" style={{margin: "0 15px"}}>
            <p className="col-lg-4 font-12" style={{paddingLeft: 0}}>Titre</p>
            <p className="col-lg-2 font-12">Documents</p>
            <p className="col-lg-4 font-12">Date de dernière mise à jour</p>
            <p className="col-lg-2 font-12" style={{paddingRight: 0}}>Date de publication</p>
          </div>
          <div className="scroll col-lg-12" style={{ height: "80px" }}>
            { kits != undefined && this.props.project.project.etape === "evaluation" ? renderKits() : <h2 className="text-align-center margin-top-30 gray-300">Votre conseiller confectionne votre kit</h2>}
          </div>
        </div>
      </div>
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
