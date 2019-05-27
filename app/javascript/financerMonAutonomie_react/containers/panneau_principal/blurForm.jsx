// import React, { Component } from 'react';
// import { bindActionCreators } from 'redux';
// import { connect } from 'react-redux';


// const asyncValidate = (props) => {
//   console.log("COUCOU")
//   if(this.props.formulary_id === "add"){
//     this.props.fetchPostForm(`/api/v1/projects/${this.props.project_id}/formularies`, values, "POST")
//     .then(()=>{
//         this.props.fetchFORM(`/api/v1/projects/${this.props.project_id}/formularies/new`)
//         .then( setTimeout( () => {this.handleInitialize()}, 500) )
//     })
//   }else{
//     this.props.fetchPostForm(`/api/v1/formularies/${this.props.formulary_id}`, values, "PATCH")
//     .then(()=>{
//       this.props.fetchFORM(`/api/v1/formularies/${this.props.formulary_id}/edit`)
//       .then( setTimeout( () => {this.handleInitialize()}, 500) )
//     })
//   }
// }

// function mapStateToProps(state) {
//   return {
//     formulary_id: state.formulary_id,
//     project_id: state.project_id
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchFORM, fetchPostForm }, dispatch);
// }

// export default connect(mapStateToProps, mapDispatchToProps)(asyncValidate);


