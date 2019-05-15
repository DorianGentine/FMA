import React, { Component } from 'react';

class Etapes extends Component {
  render(){
    const numEtape = 2 // a modifier
    const styleAfter = { width: `calc( ${numEtape} / 6 * 100%)` }

    return (
      <div className="margin-top-30">
        <p className="etape-text"><strong>Étape {numEtape}/6:</strong> {"Documents à soumettre"}</p>
        <div className="progression-etapes">
          <div className="after" style={styleAfter}></div>
        </div>
      </div>
    );
  }
};

export default Etapes;
