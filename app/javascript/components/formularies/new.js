// import { initAutocomplete } from "../../components/init_autocomplete";
import { scrollLastMessageIntoView } from "../../components/scroll";
import {updateFormulary} from "../formularies/edit";
import {
  insertQuestion,
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
          editAnswer(questions, questions[i])
        }
      }
    })
  })
}

const editAnswer = (questions, question) => {
  setQuestionsAnswer(questions, question)
}

const insertQuestionAnswers = (data) => {
  const questions = data.formulary.questions
  setQuestionsAnswer(questions)
  getEditAnswer(data.formulary.questions)
  form.addEventListener("submit", function(event){
    updateFormulary(event, questions)
  });

}
const setNextQuestion = (nex_question) => {
  const lastQuestion = `<div class="message received">${nex_question.set_up.position} - ${nex_question.set_up.question}</div>`
  form.insertAdjacentHTML("beforeend", lastQuestion);
}

const setQuestionsAnswer = (questions, question = null) => {
  for ( var i = 0; i < questions.length; i ++){
    if (question) { if (questions[i] === question) { break; }
    } else { if (typeof questions[i].answer != 'string') { break; } }
    insertQuestion(questions[i])
    insertAnswer(questions[i])
  }
  if (questions[i]) {
    setNextQuestion(questions[i])
    setFormForFormulary(questions[i])
  } else {
    createLinkNext()
  }
}

const nextStep = (data) => {
  const questions = data.formulary.questions
  for ( var i = 0; i < questions.length; i ++){
    if (typeof questions[i].answer != 'string') { break; }
  }
  insertAnswer(questions[i-1])
  if (questions[i]) {
    setNextQuestion(questions[i])
    getEditAnswer(data.formulary.questions)
    setFormForFormulary(questions[i])
  } else {
    createLinkNext()
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
    if (formulary_id) {
      var url = `/api/v1/formularies/${formulary_id}/edit`
    } else {
      var url = "/api/v1/formularies/new"
    }
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log('data', data)
        if (updated) { nextStep(data)}
        else { insertQuestionAnswers(data) }
        scrollLastMessageIntoView()
      });
  }
}


export { fetchFormulary }





