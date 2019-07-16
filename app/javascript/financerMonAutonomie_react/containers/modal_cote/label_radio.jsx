import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';

// import { closeModal, fetchPostCompte, fetchRatings } from '../../actions';

const renderRadioButton = (props) => {

  const {caption, radioButtonValue, handleChange, meta: {touched, error}, ...field} = props;
  const _onChange = (event) => {
    field.input.onChange(event);
    if (handleChange) {
      handleChange(event);
    }
  }

    let validationError = false;
    if (error && touched) {
      validationError=true;
    }

    return <label className="black font-14 w-100 custom-radio">
      <input {...field.input}
              type="radio"
              value={props.index + 1}
              onChange={_onChange}
              className={((validationError && "requireViolation ") || "")}
              />
      {props.choice}
      <span className="checkmark"></span>
    </label>
};

class LabelRadio extends Component {
  render(){
    return(
        <Field {...this.props}
          component={renderRadioButton}/>
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
