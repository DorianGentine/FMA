import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchRessources, showRessource } from '../../actions'

class Ressources extends Component {
  componentWillMount(){
    this.props.fetchRessources("/api/v1/ressources")
  }

  render(){
    const ressources = this.props.ressources

    const renderRessources = () => {
      return ressources.map((ressource, index) => {
        return (
          <div className="flex space-between align-items-center margin-bottom-15" key={index}>
            <div className="icon-doc margin-right-15"></div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">{ressource.notice.substr(ressource.notice.lastIndexOf('/') + 1)}</h4>
              <p className="font-12">{"Description de la ressource"}</p>
            </div>
            <button className="blue-gray-btn" onClick={()=>{this.props.showRessource(ressource)}}>Accéder</button>
          </div>
        );
      });
    };

    return (
      <div className="col-lg-12">
        <div className="white-box flex flex-wrap align-items-center">
          <h4 className="padding-horizontal-15 no-margin">Liste des ressources</h4>
          <p className="bold padding-horizontal-15" style={{paddingLeft: "unset"}}>{`${ressources ? ressources.length : 0} ressources`}</p>
          <p className="margin-right-15 text-align-right font-12 icon-arrow-right-gray flex-grow-1"></p>
          <div className="scroll col-lg-12 margin-top-15" style={{ height: "calc(100vh - 700px)", minHeight: "80px" }}>
            {ressources != null ? renderRessources() : <h2>Chargement...</h2> }
          </div>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    ressources: state.ressources,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchRessources, showRessource }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Ressources);
