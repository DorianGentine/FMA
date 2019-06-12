import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchPostCompte } from '../../actions';

class SwitchKit extends Component {
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
      fetch(`/api/v1/projects/${clientProject}/kits/${kitId}`, { method: "DELETE", })
    }
  }

  render(){
    const client = this.props.modal_selected.client
    const ressource = this.props.ressource
    const kit = this.props.kit
    // console.log(kit)


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

function mapStateToProps(state) {
  return {
    modal_selected: state.modal_selected,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(SwitchKit);
