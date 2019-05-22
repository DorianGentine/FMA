import { CHANGE_BENEFICIAIRE } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case CHANGE_BENEFICIAIRE: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
