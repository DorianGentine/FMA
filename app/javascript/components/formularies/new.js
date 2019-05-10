// import { initAutocomplete } from "../../components/init_autocomplete";
import { scrollLastMessageIntoView } from "../../components/scroll";
import {updateFormulary} from "../formularies/edit";
import {
  insertQuestion,
  setNextQuestion,
  insertAnswer,
  createLinkNext,
  setFormForFormulary
} from "./components";


const form = document.getElementById("formulary")

const getEditAnswer = (questions) => {
  const btns = document.querySelectorAll('.edit')
  btns.forEach((btn) => {
    btn.addEventListener('click', function(){
      for (var i = 0; i < questions.length; i++) {
        if (questions[i].set_up.position == btn.dataset.position) {
          form.innerHTML = ""
          const btn = document.getElementById("send_to_analyze")
          if (btn) { btn.remove()}
          document.getElementById('formulary-form').lastChild.remove()
          editAnswer(questions, questions[i])
        }
      }
    })
  })
}



const editAnswer = (questions, question) => {
  setQuestionsAnswer(questions, question)
}

const insertQuestionAnswers = (questions) => {
  setQuestionsAnswer(questions)
  getEditAnswer(questions)
  document.getElementById('formulary-form').addEventListener("submit", function(event){
    updateFormulary(event, questions)
  });

}


const setQuestionsAnswer = (questions, question = null) => {
  for ( var i = 0; i < questions.length; i ++){
    if (question) {
      if (questions[i] === question) { break; }
    } else {
      if (typeof questions[i].answer != 'string' && typeof questions[i].answer != 'number') { break; } }
    insertQuestion(questions[i])
    if (questions[i].set_up.need_answer) {
      insertAnswer(questions[i])
    }
  }
  if (i != questions.length) {
    setNextQuestion(questions[i])
    setFormForFormulary(questions[i])
  } else {
    createLinkNext()
  }
}

const nextStep = (questions) => {
  for ( var i = 0; i < questions.length; i ++){
    if (typeof questions[i].answer != 'string' && typeof questions[i].answer != 'number' ) { break; }
  }
  if (i == questions.length) {
    insertAnswer(questions[i-2])
    setNextQuestion(questions[i-1])
    createLinkNext()
  } else {
    insertAnswer(questions[i-1])
    setNextQuestion(questions[i])
    getEditAnswer(questions)
    setFormForFormulary(questions[i])
  }
}

function fetchFormulary(updated = null, id = null){
  if (form) {
    let formulary_id
    if (id) {
      if (form.dataset.id === "") {
        formulary_id = id; form.setAttribute('data-id', id)
      } else { formulary_id = form.dataset.id }}
    else { formulary_id = form.dataset.id }
    // if (formulary_id) {
    //   var url = `/api/v1/formularies/${formulary_id}/edit`
    // } else {
    //   var url = "/api/v1/formularies/new"
    // }
    var visitor_id = form.dataset.visitor
    var url = `/api/v1/visitors/${visitor_id}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log('data', data)
        if (updated) { nextStep(data)}
        else { insertQuestionAnswers(data) }
        scrollLastMessageIntoView(form)
      });
  }
}


export { fetchFormulary }
