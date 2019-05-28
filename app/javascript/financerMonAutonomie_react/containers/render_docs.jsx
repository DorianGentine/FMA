import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Dropzone from 'react-dropzone'

import { fetchProjet } from '../actions';

class RenderDocs extends Component {
  componentWillMount() {
    this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`);
  }

  render(){
    const project = this.props.project
    console.log(this.props.user_id)
    console.log(this.props.project_id)

    const sendImageToController = (formPayLoad) => {
      fetch(`/api/v1/users/${this.props.user_id}/projects/${this.props.project_id}/documents`, {
        credentials: 'same-origin',
        headers: {},
        method: 'POST',
        body: formPayLoad
      })

      // might be a good idea to put error handling here

      .then(response => response.json())
      .then(imageFromController => {
        // optionally, you can set the state of the component to contain the image
        // object itself that was returned from the rails controller, completing
        // the post cycle
        this.setState({uploads: this.state.uploads.concat(imageFromController)})
      })
    }

    const readFile = (files) => {
      // logic validation for existence of file(s);
      // we index at 0 here since the JSX could give us multiple files or single
      // file; either way, we get an array and we only need the first element
      // in the case of single file upload

      if (files && files[0]) {
        let formPayLoad = new FormData();
        formPayLoad.append('uploaded_image', files[0]);
        sendImageToController(formPayLoad)
      }
    }

    const renderDocs = () => {
      if(this.props.project.documents != undefined){
        const documents = this.props.project.documents
        return documents.map((doc, index) => {
          return (
            <div className="doc-to-send" key={index}>
              <div className="icon-eye float-right"></div>
              <h4 className="font-14 no-margin">{doc.title}</h4>
              <p className="black font-12">{doc.description}</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12">Aucun document</p>
                <Dropzone onDrop={readFile}>
                  {({getRootProps, getInputProps}) => (
                    <div {...getRootProps()}>
                      <input {...getInputProps()} />
                      <button className="blue-gray-btn">Soumettre</button>
                    </div>
                  )}
                </Dropzone>

              </div>
            </div>
          );
        });
      }
    };

    return(
      <div className="scroll col-lg-12 flex-wrap flex" style={{ height: "155px" }}>
        {renderDocs()}
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    user_id: state.user_id,
    project: state.project,
    project_id: state.project_id,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RenderDocs);
