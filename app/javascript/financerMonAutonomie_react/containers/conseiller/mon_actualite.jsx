import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

const MonActualite = (props) => {
  const renderActus = () => {
    // return actus.map((actu, index) => {
      return(
        <div className="row scroll" style={{ maxHeight: "calc(100vh - 560px)"}}>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>


          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
          <p className="col-lg-8 font-12 black">Patrick vient de s'inscrire. <span className="gray">1h</span></p>
          <a className="col-lg-4 font-12 text-align-right blue bold">Voir</a>
        </div>
      )
    // })
  }

  return (
    <div className="margin-top-30 flex-grow-1">
      <div className="flex black align-items-center margin-bottom-30">
        <div className="icon-live margin-right-15"></div>
        Mon actualité
      </div>
      {renderActus()}
    </div>
  );
};

function mapStateToProps(state) {
  return {
    api: state.api,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MonActualite);
