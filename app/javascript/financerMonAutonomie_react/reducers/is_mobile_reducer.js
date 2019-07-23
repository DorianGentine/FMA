import { IS_MOBILE } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case IS_MOBILE: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
