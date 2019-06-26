import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderLogo from "../../../components/render_logo"

class CardClient extends Component {
  // componentWillMount(){
  //   console.log(this.props.client)
  // }

  render(){
    const client = this.props.client

    const mydate = new Date(client.created_at);
    const month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][mydate.getMonth()];
    const dateInscription = mydate.getDate() + ' ' + month + ' ' + mydate.getFullYear();

    return(
      <div className="col-lg-4 col-xs-12 col-sm-6">
        <div className="white-box" style={{padding: "20px"}}>
          <div className="row">
            <div className="col-lg-8 flex align-items-center margin-bottom-15">
              {renderLogo(client)}
              <div>
                <p className="font-12 black bold" style={{marginLeft: "-10px"}}>{`${client.first_name} ${client.last_name}`}</p>
                <p className="font-12" style={{marginLeft: "-10px"}}>{`il y a ${30} minutes`}</p>
              </div>
            </div>
            <div className="col-lg-4 text-align-right">...</div>
            <div className="col-lg-12 font-12 margin-bottom-30">Bonjour je viens de formuler une demande spécifique concernant le dossier.</div>
            <div className="col-lg-12 font-12">Catégorie:</div>
            <div className="col-lg-12 font-12 black margin-bottom-15">{"Catégorie, a renseigner"}</div>
            <div className="col-lg-12 font-12">Bénéficiaire:</div>
            <div className="col-lg-12 font-12 black margin-bottom-30">{"Nom du Bénéficiaire"}</div>
            <div className="col-lg-12"><button className="w-100 blue-gray-btn">Voir la demande</button></div>
          </div>
        </div>
      </div>
    )
  }
}

// function mapStateToProps(state) {
//   return {
//     selectedClients: state.selectedClients,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(null, null)(CardClient);
