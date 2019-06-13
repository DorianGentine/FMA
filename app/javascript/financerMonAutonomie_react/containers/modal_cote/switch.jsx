import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchPostCompte, validateStep, fetchClients } from '../../actions';

class Switch extends Component {
  constructor(props) {
    super(props)
    this.state = { checked: this.props.checked };
  }

  handleSubmit = (event, ressourceId, clientProject, kitId, checked) => {
    event.preventDefault();
    if(!checked){
      const body = { ressource_id: ressourceId, project_id: clientProject }
      this.props.fetchPostCompte(`/api/v1/projects/${clientProject}/kits`, body, "POST" )
    }else if(checked){
      console.log("DELETE")
      fetch(`/api/v1/projects/${clientProject}/kits/${kitId}`, { method: "DELETE", })
    }
  }

  render(){
    if(this.props.kind === "switchAppel"){
      const handleChange = (checked) => {
        this.setState({ checked: event.target.checked })
        if(!checked){
          this.props.validateStep(
            `/api/v1/projects/${this.props.clientId}/next_setp`,
            setTimeout(()=>{this.props.fetchClients("/api/v1/users")}, 500))
        }
      }

      return (
        <form onSubmit={this.handleSubmit} >
          <label className="switch">
            <input
              type="checkbox"
              checked={this.state.checked}
              onChange={() => {handleChange(this.state.checked)}}
            />
            <span className="slider round"></span>
          </label>
          <button className="d-none" type="submit"></button>
        </form>
      );


    }else if(this.props.kind === "switchKit"){
      const client = this.props.modal_selected.client
      const ressource = this.props.ressource
      const kit = this.props.kit

      const handleChange = (ressourceId) => {
        this.setState({ checked: event.target.checked })
        document.getElementById(`form${ressourceId}`).click()
      }

      let kitId
      if(kit != undefined){
        kitId = kit.id
      }else{
        kitId = null
      }

      return (
        <form onSubmit={(event) => {this.handleSubmit(event, ressource.id, client.project, kitId, this.state.checked)}} >
          <label className="switch">
            <input
              type="checkbox"
              checked={this.state.checked}
              onChange={() => {handleChange(ressource.id)}}
            />
            <span className="slider round"></span>
          </label>
          <button className="d-none" id={`form${ressource.id}`} type="submit"></button>
        </form>
      );
    }
  }
}

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchPostCompte, validateStep, fetchClients }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Switch);
