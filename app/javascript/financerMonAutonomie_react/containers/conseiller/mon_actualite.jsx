import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

const MonActualite = (props) => {
  const actus = props.api.notifications
  const renderActus = () => {
    return actus.slice(0).reverse().map((actu, index) => {
      const randomId = Math.floor((Math.random() * 100) + 1);
      return(
        <div className="row scroll" style={{ maxHeight: "calc(100vh - 560px)"}} key={randomId}>
          <p className="col-lg-11 font-12 black"><span className="bold">{actu.user} </span>{actu.title} <span className="gray">{actu.time}</span></p>
          <a className="col-lg-1 font-12 text-align-right blue bold">Voir</a>
        </div>
      )
    })
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
