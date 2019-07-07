import { MODAL_PDF, CLOSE_MODAL_PDF } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case MODAL_PDF: {
      return action.payload;
    }
    case CLOSE_MODAL_PDF: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
