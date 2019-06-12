import {
  SHOW_CLIENT,
  SHOW_DOCUMENT,
  SHOW_FINANCER,
  SHOW_REPONSES,
  SHOW_RESSOURCE,
  CLOSE_MODAL,
} from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_CLIENT: {
      return action.payload;
    }
    case SHOW_DOCUMENT: {
      return action.payload;
    }
    case SHOW_FINANCER: {
      return action.payload;
    }
    case SHOW_REPONSES: {
      return action.payload;
    }
    case SHOW_RESSOURCE: {
      return action.payload;
    }
    case CLOSE_MODAL: {
      return null;
    }
    default: {
      return state;
    }
  }
}
