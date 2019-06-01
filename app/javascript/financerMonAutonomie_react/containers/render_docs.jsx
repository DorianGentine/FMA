import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Dropzone from 'react-dropzone'

import { fetchProjet, showDocument } from '../actions';

class RenderDocs extends Component {
  componentWillMount() {
    this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`);
  }

  render(){
    const project = this.props.project

    const handleClick = (doc) => {
      this.props.showDocument(doc)
    }

    const sendImageToController = (formPayLoad, idDoc) => {
      fetch(`/api/v1/documents/${idDoc}`, {
        credentials: 'same-origin',
        headers: {},
        method: 'PATCH',
        body: formPayLoad
      })
      .then(response => response.json())
    }


    const readFile = (files, idDoc, randomId) => {
      if (files && files[0]) {
        document.getElementById(`document_name${randomId}`).innerText = `${files[0].name.substr(0, 15)}...`

        document.getElementById(`btn-doc${randomId}`).innerText = "Chargement..."
        setTimeout( ()=>{document.getElementById(`btn-doc${randomId}`).innerText = "Mettre à jour"}, 1000)

        let formPayLoad = new FormData();
        formPayLoad.append('uploaded_image', files[0]);
        sendImageToController(formPayLoad, idDoc)
      }
    }


    const renderDocs = () => {
      if(this.props.project.documents != undefined){
        const documents = this.props.project.documents
        console.log(documents)
        return documents.map((doc, index) => {
          const idDoc = doc.id
          const randomId = Math.floor((Math.random() * 100) + 1);
          return (
            <div className="doc-to-send" key={index}>
              <div className="icon-eye float-right" onClick={()=>{handleClick(doc)}}></div>
              <h4 className="font-14 no-margin">{doc.title}</h4>
              <p className="black font-12">{doc.description}</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12" id={`document_name${randomId}`}>Aucun document</p>
                <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles, idDoc, randomId)}}>
                  {({getRootProps, getInputProps}) => (
                    <div {...getRootProps()}>
                      <input {...getInputProps()} />
                      <button className="blue-gray-btn" id={`btn-doc${randomId}`}>Soumettre</button>
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
  return bindActionCreators({ fetchProjet, showDocument }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RenderDocs);
