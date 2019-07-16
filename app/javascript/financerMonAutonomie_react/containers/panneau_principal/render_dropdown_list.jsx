import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { reduxForm, Field, initialize, change as changeFieldValue } from 'redux-form';
import DropdownList from 'react-widgets/lib/DropdownList'

class RenderDropdownList extends Component {
  constructor(props){
    super(props)
    this.state = {
      value: this.props.valueInitial,
    }
  }

  render(){

    const renderDropdownList = ({ input, data, valueField, textField }) => {
      let datas = []
      for ( let i in data) {
        datas.push(data[i]);
      }

      return(
        <DropdownList {...input}
          data={datas}
          busy={this.props.submitting}
          disabled={this.props.otherUser} // désactive les input text quand conseiller connecté
          value={this.state.value}
          valueField={valueField}
          textField={textField}
          onChange={value => {
            this.setState({ value })
            console.log(value)
            let answer
            if (this.props.name === "lessor") {
              answer = value.text
            } else {
              answer = parseInt(value.value, 10)
            }
            this.props.clickButton(this.props.name, answer)
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
          component={renderDropdownList}
          data={this.props.data}
          valueField="value"
          textField="text"
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

export default RenderDropdownList
