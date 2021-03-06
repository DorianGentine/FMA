import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Dropzone from 'react-dropzone'

import { fetchProjet, showDocument, validateStep } from '../../actions';



class RenderDocs extends Component {
  constructor(props) {
    super(props)
    this.state = {
      validateStepLaunched: false,
    };
  }

  componentDidMount(){
    const documents = this.props.project.documents
    const project_id = this.props.project_id
    const etape = this.props.etape

    const checkFiles = () => {
      let documentsCompleted = 0
      for (var i = documents.length - 1; i >= 0; i--) {
        if(documents[i].file.url != null){
          documentsCompleted = documentsCompleted + 1
        }
      }
      if (documentsCompleted === documents.length && !this.state.validateStepLaunched) {
        this.setState({ validateStepLaunched: true })
        this.props.validateStep(`/api/v1/projects/${project_id}/next_setp`,
          ()=>{
            this.props.fetchProjet(`/api/v1/projects/${project_id}`)
          }
        )
      }
    }

    if(documents != undefined && etape === "documentation"){
      checkFiles()
    }
  }

  componentWillReceiveProps(nextProps) {
    const documents = this.props.project.documents
    const nextDocuments = nextProps.project.documents
    const project_id = this.props.project_id
    const etape = this.props.etape
    const checkFiles = () => {
      let documentsCompleted = 0
      for (var i = nextDocuments.length - 1; i >= 0; i--) {
        if(nextDocuments[i].file.url != null){
          documentsCompleted = documentsCompleted + 1
        }
      }

      if (documentsCompleted === documents.length) {
        this.setState({ validateStepLaunched: true })
        this.props.validateStep(`/api/v1/projects/${project_id}/next_setp`,
          ()=>{
            this.props.fetchProjet(`/api/v1/projects/${project_id}`)
          }
        )
      }
    }

    if(documents != undefined &&
      documents != nextDocuments  &&
      !this.state.validateStepLaunched  &&
      etape === "documentation"){
      checkFiles()
    }
  }


  render(){
    const project = this.props.project
    const project_id = this.props.project_id
    const documents = project.documents
    const etape = this.props.etape


    const handleClick = (doc) => {
      this.props.showDocument(doc)
    }



    const sendImageToController = async (formPayLoad, idDoc, index) => {
      let response = await fetch(`/api/v1/documents/${idDoc}`, {
        credentials: 'same-origin',
        headers: {},
        method: 'PATCH',
        body: formPayLoad
      })

      if(response.ok){
        response = await response.json();
        this.props.fetchProjet(`/api/v1/projects/${this.props.project_id}`)
        document.getElementById(`btn-doc${index}`).innerText = "Mettre à jour"
      } else {
        console.error('fetchClients passe pas : ', response)
        response = null
        document.getElementById(`document_name${index}`).innerText = "Erreur dans l'envoi du document"
        document.getElementById(`document_name${index}`).classList.add('red')
        document.getElementById(`document_name${index}`).classList.remove('gray-300')
        document.getElementById(`btn-doc${index}`).innerText = "Rééssayer"
        document.getElementById(`btn-doc${index}`).classList.add('red')
      }
    }



    const readFile = (files, idDoc, index) => {
      if (files && files[0]) {

        console.log(files, files[0])
        document.getElementById(`document_name${index}`).classList.add('gray-300')
        document.getElementById(`document_name${index}`).classList.remove('red')
        document.getElementById(`btn-doc${index}`).classList.remove('red')

        let newDocName = ""
        if(files[0].size > 5000000){
          newDocName = "Fichier trop volumineux"
          document.getElementById(`document_name${index}`).classList.add('red')
          document.getElementById(`document_name${index}`).classList.remove('gray-300')
          document.getElementById(`btn-doc${index}`).innerText = "Rééssayer"
          document.getElementById(`btn-doc${index}`).classList.add('red')
        }else if (files[0].name.length < 14){
          newDocName = files[0].name
        }else{
          newDocName = `${files[0].name.substr(0, 14)}...`
        }

        document.getElementById(`document_name${index}`).innerText = newDocName
        if(files[0].size <= 5000000){

          document.getElementById(`btn-doc${index}`).innerText = "Chargement..."

        }
          let formPayLoad = new FormData();
          formPayLoad.append('uploaded_image', files[0]);

          sendImageToController(formPayLoad, idDoc, index)
      }
    }


    const renderDocs = () => {
      if(documents.length != 0){
        return documents.map((doc, index) => {
          const idDoc = doc.id

          let docName = "Aucun document"
          if(doc.file.url != null){
            const positionSlash = doc.file.url.lastIndexOf("/")
            const positionUnderScore = doc.file.url.lastIndexOf("_-")
            const docExtension = doc.file.url.substr(doc.file.url.lastIndexOf("."))
            docName = doc.file.url.substr(positionSlash + 1, positionUnderScore - positionSlash - 1) + docExtension
            if (docName.length > 14){
              docName = `${docName.substr(0, 14)}...`
            }
          }

          return (
            <div className="doc-to-send" key={index}>
              <h4 className="font-14 no-margin">{doc.title}</h4>
              <p className="gray-300 font-12 margin-top-15 margin-bottom-15" id={`document_name${index}`}><i className="far fa-file margin-right-15"></i>{docName}</p>
              <div className="flex space-between align-items-center">
                <div className="flex align-items-center btn-apercu" onClick={()=>{handleClick(doc)}}>
                  <div className="icon-eye margin-right-5"></div>
                  <p className="font-12">Aperçu</p>
                </div>
                <Dropzone onDrop={(acceptedFiles) => {readFile(acceptedFiles, idDoc, index)}}>
                  {({getRootProps, getInputProps}) => (
                    <div {...getRootProps()}>
                      <input {...getInputProps()} />
                      <button
                        className={`blue-gray-btn ${this.props.otherUser ? "not-allowed" : ""}`}
                        id={`btn-doc${index}`}
                        disabled={this.props.otherUser}
                        >
                          {doc.file.url != null ? "Mettre à jour" : "Soumettre"}
                      </button>
                    </div>
                  )}
                </Dropzone>
              </div>
            </div>
          );
        });
      }else if(documents.length === 0){
        return <p className="margin-top-30 margin-auto">Pas de documents nécessaires</p>
      }
    };

    return(
      <div className="scroll flex-wrap flex w-100" style={{ height: "155px" }}>
        {documents != undefined ? renderDocs() : <p className="margin-top-30 margin-auto">Chargement...</p>}
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    etape: state.project.project.etape,
    otherUser: state.otherUser,
    project: state.project,
    project_id: state.project_id,
    user_id: state.user_id,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProjet, showDocument, validateStep }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(RenderDocs);
