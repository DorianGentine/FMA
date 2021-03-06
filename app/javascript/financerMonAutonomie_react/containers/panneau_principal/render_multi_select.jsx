import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import Multiselect from 'react-widgets/lib/Multiselect'

class RenderMultiSelect extends Component {
  constructor(props){
    super(props)
    this.state = {
      value: this.props.valueInitial,
    }
  }

  render(){

    const renderMultiSelect = ({ input, data, valueField, textField }) => {
      let datas = []
      for ( let i in data) {
        datas.push(data[i].props.value);
      }

      let splitValue = []
      if(this.state.value == ""){
        splitValue = splitValue
      }else if(typeof this.state.value == "string"){
        splitValue = this.state.value.split(', ')
      }else{
        splitValue = this.state.value
      }

      return(
        <Multiselect {...input}
        data={datas}
        busy={this.props.submitting}
        disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
        value={splitValue} // requires value to be an array
        onChange={value => {
          this.setState({ value })
          this.props.clickButton(this.props.name, value)
        }}
        />
      )
    }

    return(
      <div className="form-group">
        <label className="font-14 black">{this.props.label}</label>
        <Field
          className="margin-bottom-15 no-padding form-control"
          name={this.props.name}
          component={renderMultiSelect}
          data={this.props.data}
        />
      </div>
    )
  }
}

// function mapStateToProps(state) {
//   return {
//     urlAPI: state.urlAPI,
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ changeBeneficiaireForm }, dispatch);
// }

export default RenderMultiSelect
