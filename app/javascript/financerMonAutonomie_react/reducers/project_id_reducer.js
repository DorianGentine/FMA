import { FETCH_API } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_API: {
      if(action.payload.project){
        return action.payload.project.id;
      }else{
        return state
      }
    }
    default: {
      return state;
    }
  }
}
