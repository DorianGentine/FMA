import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import renderLogo from "../../../components/render_logo"

const MonActualite = (props) => {
  const conseillers = props.api.advisors

  const getConseiller = async function(id) {
    const response = await fetch(`/api/v1/users/${id}`)
    const promise = await response.json()
    console.log(promise.user)
    return <p className="col-lg-12 font-12 black margin-bottom-15">{`${promise.user.first_name} ${"Charret"}`}</p>
  }

  const renderConseillers = () => {
    return conseillers.map((conseiller, index) => {
      const advisor = getConseiller(conseiller.id)
      // console.log(advisor)

      return (
        <div className="flex" key={index}>
          {renderLogo("Marine Charret")}
          <p className="col-lg-12 font-12 black margin-bottom-15">{`${"Marine"} ${"Charret"}`}</p>
        </div>
      )
    })
  }

  return (
    <div className="margin-top-30 flex-grow-1">
      <div className="flex black align-items-center margin-bottom-30">
        <div className="icon-live margin-right-15"></div>
        Mon équipe de conseillers
      </div>
      <div className="row scroll" style={{ maxHeight: "calc(100vh - 560px)", minHeight: "30px" }}>
        { conseillers != undefined ? renderConseillers() : <p>Chargement...</p>}
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
