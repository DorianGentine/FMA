import React, {Component} from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class MonActualite extends Component {
  constructor(props) {
    super(props)
    this.state = {
      actus: this.props.api.notifications,
    };
  }

  // componentDidMount(){
  //   this.refresher = setInterval(()=>{this.props.fetchAPI(`/api/v1/users/${this.props.user_id}`)}, 10000)
  // }

  // componentWillUnmount(){
  //   clearInterval(this.refresher);
  // }

  componentWillReceiveProps(nextProps){
    if(this.props.api.notifications != nextProps.api.notifications){
      this.setState({ actus: nextProps.api.notifications })
    }
  }

  render(){
    const actus = this.state.actus
    const renderActus = () => {
      return actus.slice(0).reverse().map((actu, index) => {
        return <p key={index} className="col-lg-12 font-12 black margin-bottom-15"><span className="bold">{actu.user} </span>{actu.title} <span className="gray">{actu.time}</span></p>
      })
    }

    let style
    if(this.props.api.statut === "conseiller"){
      style = { maxHeight: "calc(100vh - 560px)", minHeight: "30px" }
    }else{
      style = { height: "136px", minHeight: "30px" }
    }

    return (
      <div className={`margin-top-30 ${this.props.api.statut === "conseiller" ? "flex-grow-1" : "" }`}>
        <div className="flex black align-items-center margin-bottom-30">
          <div className="icon-live margin-right-15"></div>
          Mon actualité
        </div>
        <div className="row scroll" style={style}>
          {actus ? renderActus() : <p>Chargement...</p>}
        </div>
      </div>
    );
  };
}

function mapStateToProps(state) {
  return {
    api: state.api,
    user_id: state.user_id,
  };
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchAPI }, dispatch);
// }

export default connect(mapStateToProps, null)(MonActualite);
