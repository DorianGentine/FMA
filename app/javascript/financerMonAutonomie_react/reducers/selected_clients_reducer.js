import { SELECT_CLIENTS } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SELECT_CLIENTS: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
