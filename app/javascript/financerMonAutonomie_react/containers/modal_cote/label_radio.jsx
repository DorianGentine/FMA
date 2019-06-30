import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

// import { closeModal, fetchPostCompte, fetchRatings } from '../../actions';

class LabelRadio extends Component {
  constructor(props) {
    super(props)
    this.state = {
      isChecked: false,
    };
  }

  render(){
    return(
      <label className="black font-14 w-100 custom-radio">
        <Field
          onClick={() => {
            this.setState((prevState) => { return { isChecked: !prevState.isChecked}; });
          }}
          name={this.props.nameLabel}
          component="input"
          type="radio"
          value={this.props.index + 1}
          checked={this.state.isChecked}/>
        {this.props.choice}
        <span className="checkmark"></span>
      </label>
    )
  }
}

// function mapStateToProps(state) {
//   return {
//     modal_selected: state.modal_selected,
//     ratings: state.ratings,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ closeModal, fetchPostCompte, fetchRatings }, dispatch);
// }

// export default connect(null, null)(LabelRadio);
export default reduxForm({ form: 'evaluation', })(
connect(null, null)(LabelRadio)
);
