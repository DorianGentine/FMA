import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

const MonActualite = (props) => {
  const actus = props.api.notifications
  const renderActus = () => {
    return actus.slice(0).reverse().map((actu, index) => {
      return <p key={index} className="col-lg-12 font-12 black margin-bottom-15"><span className="bold">{actu.user} </span>{actu.title} <span className="gray">{actu.time}</span></p>
    })
  }

  return (
    <div className="margin-top-30 flex-grow-1">
      <div className="flex black align-items-center margin-bottom-30">
        <div className="icon-live margin-right-15"></div>
        Mon actualité
      </div>
      <div className="row scroll" style={{ maxHeight: "calc(100vh - 560px)", minHeight: "30px" }}>
        {renderActus()}
      </div>
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
