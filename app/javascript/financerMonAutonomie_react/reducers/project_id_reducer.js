import { FETCH_API } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_API: {
      console.log(action.payload)
      return action.payload.project.id;
    }
    default: {
      return state;
    }
  }
}
