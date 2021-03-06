import {
  SHOW_CLIENT,
  SHOW_CLIENT_CONSEILLER,
  SHOW_CREATE_RESSOURCE,
  SHOW_DEMANDE,
  SHOW_DEMANDE_ANSWER,
  SHOW_DOCUMENT,
  SHOW_EVALUATION,
  SHOW_FINANCER,
  SHOW_NOTES,
  SHOW_REPONSES,
  SHOW_RESSOURCE,
  CLOSE_MODAL,
} from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_CLIENT: {
      return action.payload;
    }
    case SHOW_CLIENT_CONSEILLER: {
      return action.payload;
    }
    case SHOW_CREATE_RESSOURCE: {
      return action.payload;
    }
    case SHOW_DEMANDE: {
      return action.payload;
    }
    case SHOW_DEMANDE_ANSWER: {
      return action.payload;
    }
    case SHOW_DOCUMENT: {
      return action.payload;
    }
    case SHOW_EVALUATION: {
      return action.payload;
    }
    case SHOW_FINANCER: {
      return action.payload;
    }
    case SHOW_NOTES: {
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
