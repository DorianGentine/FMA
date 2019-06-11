import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchRessources } from '../../actions'

class Ressources extends Component {
  componentWillMount(){
    this.props.fetchRessources("/api/v1/ressources")
  }

  render(){
    const ressources = this.props.ressources

    const renderRessources = () => {
      return ressources.map((ressource, index) => {
        return (
          <div className="flex space-between align-items-center margin-bottom-15" key={ressource.id}>
            <div className="icon-doc margin-right-15"></div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">{"La caisse de retraite"}</h4>
              <p className="font-12">{"Description de la ressource"}</p>
            </div>
            <button className="blue-gray-btn">Accéder</button>
          </div>
        );
      });
    };

    return (
      <div>
        {ressources != null ? renderRessources() : null }
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
  return bindActionCreators({ fetchRessources }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Ressources);
