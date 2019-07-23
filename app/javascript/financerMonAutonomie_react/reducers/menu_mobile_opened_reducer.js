import { MENU_MOBILE_OPENED } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case MENU_MOBILE_OPENED: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
