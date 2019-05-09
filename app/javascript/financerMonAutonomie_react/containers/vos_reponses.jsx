import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderInitiale from "../../components/render_initiales"

class VosReponses extends Component {

  render(){
    const beneficiaire = this.props.beneficiaire
    const styleAvatar = {
    height: "35px",
    width: "35px",
    fontSize: "12px",
    lineHeight: "35px",
  }

    const renderBeneficiaires = () => {
      // return beneficiaires.map((beneficiaire, index) => {
        let numBeneficiaire = 0
        if(false){
          numBeneficiaire = index
        }else{
          numBeneficiaire = 1
        };
        return (
          <div className="flex space-between margin-bottom-30" key={beneficiaire.id}>
            <div className="avatar-app margin-right-15" style={styleAvatar}>{renderInitiale(beneficiaire.first_name, beneficiaire.last_name)}</div>
            <div className="flex-grow-1">
              <h4 className="font-12 no-margin">Bénéficiaire {numBeneficiaire}:</h4>
              <p className="font-12">{beneficiaire.first_name} {beneficiaire.last_name}</p>
            </div>
            <button className="blue-gray-btn">Voir les réponses</button>
          </div>
        );
      // });
    };

    return (
      <div className="col-lg-6">
        <div className="white-box flex flex-wrap">
          <h4 className="col-lg-12">Vos réponses</h4>
          <div className="scroll col-lg-12" style={{ height: "145px" }}>
            {renderBeneficiaires()}
          </div>
        </div>
      </div>
    );
  }
};

function mapStateToProps(state) {
  return {
    beneficiaire: state.api.beneficiaire,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(VosReponses);
