import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class PanneauPrincipalClients extends Component {

  render(){
    const clients = this.props.api.clients

    const renderClients = () => {
      return clients.map((client, index) => {
        return(
          <div className="col-lg-3 col-xs-12 col-sm-4">
            <div className="white-box">
              <div className="row">
                <div className="col-lg-6">avatar</div>
                <div className="col-lg-6">...</div>
                <div className="col-lg-12">Erwan Guillou</div>
                <div className="col-lg-12 margin-bottom-30">RDV à fixer</div>
                <div className="col-lg-6">Financeurs:</div>
                <div className="col-lg-6 text-align-right">{4}</div>
                <div className="col-lg-6">Date:</div>
                <div className="col-lg-6 text-align-right">{client.inscription}</div>
                <div className="col-lg-6">Étape:</div>
                <div className="col-lg-6 text-align-right">{`${1}/5`}</div>
              </div>
            </div>
          </div>
        )
      })
    }

    return (
      <div className="margin-top-15">
        <div className="row">
          <div className="input-wth-icon search-app col-lg-4">
            <i className="fas fa-search"></i>
            <input type="text" placeholder="Nom ou prénom du client" style={{width: "100%"}} />
          </div>
          <div className="col-lg-4 offset-lg-4"><div>Classer par Étape</div></div>
        </div>
        <div className="margin-top-30 margin-bottom-30 flex align-items-center">
          <hr className="ligne-horizontal"/>
          <div className="font-14 black blue-gray-background flex-grow-1 text-align-center" style={{ width: "100%" }}>Etape 1 : Confirmation des réponses</div>
          <hr className="ligne-horizontal"/>
        </div>
        <div className="row">
          {renderClients()}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(mapStateToProps, null)(PanneauPrincipalClients);
