import React, { Component } from 'react';

import RenderDocs from "../containers/render_docs"

class DocumentsSoumettre extends Component {
  render(){
    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-4">Documents à soumettre</h4>
          <p className="blue font-12 col-lg-4">Format PDF, PNG ou JPG</p>
          <RenderDocs />
        </div>
      </div>
    );
  }
};

export default DocumentsSoumettre;
