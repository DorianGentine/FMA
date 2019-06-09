import { DISPLAY_CALENDLY } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case DISPLAY_CALENDLY: {
      return action.payload
    }
    // case CLOSE_MODAL: {
    //   return false;
    // }
    default: {
      return state;
    }
  }
}
