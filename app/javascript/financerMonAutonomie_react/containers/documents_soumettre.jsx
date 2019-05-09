import React, { Component } from 'react';

class DocumentsSoumettre extends Component {
  render(){
    const renderDocs = () => {
      // return this.props.messages.map((message, index) => {
        return (
          <div className="doc-to-send">
            <div className="icon-eye float-right"></div>
            <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
            <p className="black font-12">4 financeurs trouvés</p>
            <div className="flex space-between align-items-center">
              <p className="gray-300 font-12">Aucun document</p>
              <button className="blue-gray-btn">Soumettre</button>
            </div>
          </div>
        );
      // });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-4">Documents à soumettre</h4>
          <p className="blue font-12 col-lg-4">Format PDF, PNG ou JPG</p>
          <div className="scroll col-lg-12 flex-wrap flex" style={{ height: "155px" }}>
            {renderDocs()}
            <div className="doc-to-send">
              <div className="icon-eye float-right"></div>
              <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
              <p className="black font-12">4 financeurs trouvés</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12">Aucun document</p>
                <button className="blue-gray-btn">Soumettre</button>
              </div>
            </div>
            <div className="doc-to-send">
              <div className="icon-eye float-right"></div>
              <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
              <p className="black font-12">4 financeurs trouvés</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12">Aucun document</p>
                <button className="blue-gray-btn">Soumettre</button>
              </div>
            </div>
            <div className="doc-to-send">
              <div className="icon-eye float-right"></div>
              <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
              <p className="black font-12">4 financeurs trouvés</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12">Aucun document</p>
                <button className="blue-gray-btn">Soumettre</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
};

export default DocumentsSoumettre;
