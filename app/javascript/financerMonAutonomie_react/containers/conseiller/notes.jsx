import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { showNotes, fetchProjet } from "../../actions"

class RdvTel extends Component {
  componentDidMount(){
    if(this.props.project === null){
      this.props.fetchProjet(`/api/v1/projects/${this.props.api.project.id}`)
    }
  }

  render(){
    let nbNotes = 0
    let notes
    if(this.props.project != null){
      notes = this.props.project.notes
      nbNotes = notes.length
    }
    return (
      <div className="margin-top-30 blue-gray-box" onClick={()=>{this.props.showNotes(notes)}}>
        <i className="fas fa-pencil-alt blue"></i>
        <p className="black">Voir les notes du projet</p>
        <p className="blue">{String(nbNotes).padStart(2, '0')}</p>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    api: state.api,
    project: state.project,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ showNotes, fetchProjet }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RdvTel);
