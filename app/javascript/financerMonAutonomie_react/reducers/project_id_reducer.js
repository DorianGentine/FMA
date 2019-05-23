import { FETCH_API } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_API: {
      return action.payload.project.id;
    }
    default: {
      return state;
    }
  }
}
