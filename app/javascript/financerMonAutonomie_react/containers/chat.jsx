import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchAPI } from '../actions';

class PanneauPrincipalClients extends Component {
  constructor(props) {
    super(props)
    this.state = {
      messageUnread: 0,
    };
  }

  componentDidMount(){
    this.refresher = setInterval(()=>{this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)}, 10000)
  }

  componentWillUnmount(){
    clearInterval(this.refresher);
  }

  componentWillReceiveProps(nextProps){
    if(this.props.api.new_message != nextProps.api.new_message){
      this.setState({ messageUnread: nextProps.api.new_message.unread })
    }
  }

  render(){
    const newMessages = this.props.api.new_message

    return (
      <div className="fixed chat-advisor">
        {this.state.messageUnread != 0 ? <div className="message-unread">{this.state.messageUnread}</div> : null}
        <img src="https://res.cloudinary.com/financermonautonomie/image/upload/v1560225478/Symbole_white_ypjj6m.png" alt=""/>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    api: state.api,
    user_id: state.user_id,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchAPI }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalClients);
