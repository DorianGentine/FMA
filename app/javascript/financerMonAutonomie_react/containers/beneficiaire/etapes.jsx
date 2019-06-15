import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class Etapes extends Component {
  render(){
    const etape = this.props.project.project.etape
    let numEtape;
    let nomEtape;
    const calculEtape = () => {
      switch (etape) {
        case "validation_data": {
          numEtape = 1
          nomEtape = "Confirmation des réponses"
          return [numEtape, nomEtape];
        }
        case "documentation": {
          numEtape = 2
          nomEtape = "Documents à soumettre"
          return [numEtape, nomEtape];
        }
        case "meeting": {
          numEtape = 3
          nomEtape = "Fixez un rendez-vous"
          return [numEtape, nomEtape];
        }
        case "call": {
          numEtape = 4
          nomEtape = "Appel téléphonique fixé"
          return [numEtape, nomEtape];
        }
        case "progression": {
          numEtape = 5
          nomEtape = "Kit en cours d'élaboration"
          return [numEtape, nomEtape];
        }
        case "evaluation": {
          numEtape = 6
          nomEtape = "Évaluation du service"
          return [numEtape, nomEtape];
        }
        default: {
          numEtape = 0
          nomEtape = "Commencez un nouveau projet"
          return [numEtape, nomEtape];
        }
      }
    }
    const etapeEnCours = calculEtape()
    numEtape = etapeEnCours[0]
    nomEtape = etapeEnCours[1]

    const styleAfter = { width: `calc( ${numEtape} / 6 * 100%)` }

    return (
      <div className="margin-top-30">
        <p className="etape-text"><strong>{`Étape ${numEtape}/6:`}</strong> {nomEtape}</p>
        <div className="progression-etapes">
          <div className="after" style={styleAfter}></div>
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
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(Etapes);
