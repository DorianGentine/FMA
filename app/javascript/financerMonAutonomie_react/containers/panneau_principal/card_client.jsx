import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderLogo from "../../../components/render_logo"

class CardClient extends Component {
  componentWillMount(){
    console.log(this.props.client)
  }

  render(){
    const client = this.props.client

    const mydate = new Date(client.created_at);
    const month = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][mydate.getMonth()];
    const dateInscription = mydate.getDate() + ' ' + month + ' ' + mydate.getFullYear();

    const calculEtape = () => {
      switch (client.étape) {
        case "validation_data": {
          numEtape = 1
          return numEtape;
        }
        case "documentation": {
          numEtape = 2
          return numEtape;
        }
        case "meeting": {
          numEtape = 3
          return numEtape;
        }
        case "call": {
          numEtape = 4
          return numEtape;
        }
        case "progression": {
          numEtape = 5
          return numEtape;
        }
        case "evalution": {
          numEtape = 6
          return numEtape;
        }
        default: {
          numEtape = 0
          return numEtape;
        }
      }
    }
    let numEtape = calculEtape()
// ${client.nombre_benef > 1 ? `+ ${client.nombre_benef - 1}` : null }
    return(
      <div className="col-lg-3 col-xs-12 col-sm-4">
        <div className="white-box" style={{padding: "20px"}}>
          <div className="row">
            <div className="col-lg-6 font-12 black flex align-items-center margin-bottom-15">
              {renderLogo(client)}
              <span className="bold" style={{marginLeft: "-10px"}}>{`${client.nombre_benef > 1 ? `+${client.nombre_benef - 1}` : null }`}</span>
            </div>
            <div className="col-lg-6 text-align-right">...</div>
            <div className="col-lg-12 font-14 black bold">{`${client.first_name} ${client.last_name}`}</div>
            <div className="col-lg-12 margin-bottom-30 blue font-12">RDV à fixer</div>
            <div className="col-lg-5 font-12 gray-300">Financeurs:</div>
            <div className="col-lg-7 text-align-right font-12 black">{client.financeurs}</div>
            <div className="col-lg-5 font-12 gray-300">Date:</div>
            <div className="col-lg-7 text-align-right font-12 black">{dateInscription}</div>
            <div className="col-lg-5 font-12 gray-300">Étape:</div>
            <div className="col-lg-7 text-align-right font-12 black">{`${numEtape}/5`}</div>
            <div className="col-lg-12 margin-top-30 flex space-between">
              <a href={`tel:${client.phone}`} className="font-12 gray flex align-items-center">
                <i className="fas fa-phone margin-right-5"></i>
                Appeler
              </a>
              <a href={`${client.url}/projet`} className="font-12 gray flex align-items-center">
                <i className="far fa-user margin-right-5"></i>
                Voir profil
              </a>
            </div>
          </div>
        </div>
      </div>
    )
  }
}
                // <img src="https://res.cloudinary.com/financermonautonomie/image/upload/co_rgb:6B778E,e_colorize:100,f_png,h_50,w_50/v1557207527/icons/Te%CC%81l_bjyxz7.svg"
                //   alt="" style={{ height: "12px", width: "12px"}} className="margin-right-5 icon-telephone"/>

// function mapStateToProps(state) {
//   return {
//     api: state.api,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(null, null)(CardClient);
