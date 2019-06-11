import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class CardClient extends Component {
  componentWillMount(){
    console.log(this.props.client)
  }

  render(){
    const client = this.props.client
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
  }

}

// function mapStateToProps(state) {
//   return {
//     api: state.api,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM }, dispatch);
// }

export default connect(null, null)(CardClient);
