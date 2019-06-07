import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Dropzone from 'react-dropzone'

import { fetchProjet, showDocument, validateStep, fetchAPI } from '../../actions';

class RenderDocs extends Component {
  componentWillMount() {
    this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`);
  }

  render(){
    const project = this.props.project
    const project_id = this.props.project_id
    const documents = project.documents
    const etape = this.props.etape

    const fetchAPI = () => {
      this.props.fetchAPI(this.props.urlAPI)
    }

    const validateStep = (url, callback) => {
      this.props.validateStep(url, callback)
    }

    const handleClick = (doc) => {
      this.props.showDocument(doc)
    }

    let documentsCompleted = 0
    if(documents){
      for (var i = documents.length - 1; i >= 0; i--) {
        if(documents[i].file.url != null){
          documentsCompleted = documentsCompleted + 1
        }
      }
    }

    const checkFiles = () => {

      if (documentsCompleted === documents.length && etape === "documentation") {
        console.log("fetchAPI", fetchAPI)
        validateStep(`/api/v1/projects/${project_id}/next_setp`, fetchAPI() )
      }
    }

    const sendImageToController = (formPayLoad, idDoc) => {
      fetch(`/api/v1/documents/${idDoc}`, {
        credentials: 'same-origin',
        headers: {},
        method: 'PATCH',
        body: formPayLoad
      })
      .then(response => response.json())
      .then(() => {
        this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
      }).then(()=> {
        checkFiles()
      })
    }



    const readFile = (files, idDoc, randomId) => {
      if (files && files[0]) {
        // compte le nombre de docs complété après envoi
        // MAIS PAS BON car si user rajoute le même qu'avant, renvoie
        // un mauvais chiffre
        documentsCompleted = documentsCompleted + 1

        let newDocName = ""
        if (files[0].name.length < 14){
          newDocName = files[0].name
        }else{
          newDocName = `${files[0].name.substr(0, 14)}...`
        }
        document.getElementById(`document_name${randomId}`).innerText = newDocName

        document.getElementById(`btn-doc${randomId}`).innerText = "Chargement..."
        setTimeout( ()=>{document.getElementById(`btn-doc${randomId}`).innerText = "Mettre à jour"}, 1000)

        let formPayLoad = new FormData();
        formPayLoad.append('uploaded_image', files[0]);
        sendImageToController(formPayLoad, idDoc)
      }
    }


    const renderDocs = () => {
      if(documents != undefined){
        return documents.map((doc, index) => {
          const idDoc = doc.id

          const randomId = Math.floor((Math.random() * 100) + 1);
          let docName = "Aucun document"
          if(doc.file.url != null){
            docName = doc.file.url.substr(doc.file.url.lastIndexOf("/") + 1)
            if (docName.length > 14){
              docName = `${docName.substr(0, 14)}...`
            }
          }

          return (
            <div className="doc-to-send" key={index}>
              <div className="icon-eye float-right" onClick={()=>{handleClick(doc)}}></div>
              <h4 className="font-14 no-margin" onClick={()=>{console.log("documents_post", documents[0].file)}}>{doc.title}</h4>
              <p className="black font-12">{doc.description}</p>
              <div className="flex space-between align-items-center">
                <p className="gray-300 font-12" id={`document_name${randomId}`}>{docName}</p>
                <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles, idDoc, randomId)}}>
                  {({getRootProps, getInputProps}) => (
                    <div {...getRootProps()}>
                      <input {...getInputProps()} />
                      <button className="blue-gray-btn" id={`btn-doc${randomId}`}>{doc.file.url != null ? "Mettre à jour" : "Soumettre"}</button>
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
    etape: state.api.project.etape,
    project_id: state.project_id,
    urlAPI: state.urlAPI,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet, showDocument, validateStep, fetchAPI }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RenderDocs);