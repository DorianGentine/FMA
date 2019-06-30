import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Select from "react-dropdown-select"

import { fetchAPI, fetchPostCompte } from '../actions';

class PanneauPrincipalClients extends Component {
  constructor(props) {
    super(props)
    this.state = {
      messageUnread: this.props.api.new_message.unread,
    };
  }

  componentWillReceiveProps(nextProps){
    if(this.props.api.new_message != nextProps.api.new_message){
      this.setState({ messageUnread: nextProps.api.new_message.unread })
    }
  }

  render(){
    const newMessages = this.props.api.new_message

    return (
      <div>
        <a
          href={newMessages.url}
          target="_blank"
          className="fixed chat-advisor"
          onClick={()=>{this.props.fetchPostCompte(`/api/v1/restart_compteur`,
            null,
            "PATCH",
            ()=>{this.setState({ messageUnread: 0 })},
          )}}
          >
          {this.state.messageUnread != 0 ? <div className="message-unread">{this.state.messageUnread}</div> : null}
          <img src="https://res.cloudinary.com/financermonautonomie/image/upload/v1560225478/Symbole_white_ypjj6m.png" alt=""/>
        </a>
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
  return bindActionCreators({ fetchAPI, fetchPostCompte }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PanneauPrincipalClients);
