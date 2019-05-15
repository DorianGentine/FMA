import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Dropzone from 'react-dropzone'

class RenderDocs extends Component {
  render(){
    const beneficiaire = this.props.beneficiaire
    const project = this.props.project

    const sendImageToController = (formPayLoad) => {

      console.log("couocu")

      fetch(`/api/v1/users/${beneficiaire.id}/projects/${project.id}/documents`, {
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
      // return this.props.messages.map((message, index) => {
        return (
          <div className="doc-to-send">
            <div className="icon-eye float-right"></div>
            <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
            <p className="black font-12">4 financeurs trouvés</p>
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
      // });
    };

    return(
      <div className="scroll col-lg-12 flex-wrap flex" style={{ height: "155px" }}>
        {renderDocs()}
        <div className="doc-to-send">
          <div className="icon-eye float-right"></div>
          <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
          <p className="black font-12">4 financeurs trouvés</p>
          <div className="flex space-between align-items-center">
            <p className="gray-300 font-12">Aucun document</p>
            <button className="blue-gray-btn">Soumettre</button>
          </div>
        </div>
        <div className="doc-to-send">
          <div className="icon-eye float-right"></div>
          <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
          <p className="black font-12">4 financeurs trouvés</p>
          <div className="flex space-between align-items-center">
            <p className="gray-300 font-12">Aucun document</p>
            <button className="blue-gray-btn">Soumettre</button>
          </div>
        </div>
        <div className="doc-to-send">
          <div className="icon-eye float-right"></div>
          <h4 className="font-14 no-margin">Fiche de paie 2019</h4>
          <p className="black font-12">4 financeurs trouvés</p>
          <div className="flex space-between align-items-center">
            <p className="gray-300 font-12">Aucun document</p>
            <button className="blue-gray-btn">Soumettre</button>
          </div>
        </div>
      </div>
    )
  }
}


function mapStateToProps(state) {
  return {
    beneficiaire: state.api.beneficiaire,
    project: state.api.project,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(RenderDocs);
