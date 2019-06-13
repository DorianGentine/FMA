import { FETCH_MODAL_REPONSES, } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_MODAL_REPONSES: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
