import {
  SHOW_CLIENT,
  SHOW_CLIENT_CONSEILLER,
  SHOW_DEMANDE,
  SHOW_DOCUMENT,
  SHOW_FINANCER,
  SHOW_NOTES,
  SHOW_REPONSES,
  SHOW_RESSOURCE,
  CLOSE_MODAL,
} from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_CLIENT: {
      return true;
    }
    case SHOW_CLIENT_CONSEILLER: {
      return true;
    }
    case SHOW_DEMANDE: {
      return true;
    }
    case SHOW_DOCUMENT: {
      return true;
    }
    case SHOW_FINANCER: {
      return true;
    }
    case SHOW_NOTES: {
      return true;
    }
    case SHOW_REPONSES: {
      return true;
    }
    case SHOW_RESSOURCE: {
      return true;
    }
    case CLOSE_MODAL: {
      return false;
    }
    default: {
      return state;
    }
  }
}
