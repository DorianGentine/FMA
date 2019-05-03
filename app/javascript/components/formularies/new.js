import { scrollLastMessageIntoView } from "../../components/scroll";
import {updateFormulary} from "../formularies/edit";
import {
  insertQuestion,
  insertAnswer,
  createInputAnswer,
  insertSelectAnswer,
  createSubmitBtn,
  createEditBtn,
  createLinkAnalyze,
  setFormForFormulary
} from "./composents";

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
  scrollLastMessageIntoView()
  getEditAnswer(data.formulary.questions)
}

const setQuestionsAnswer = (questions, question = null) => {
  for ( var i = 0; i < questions.length; i ++){
    if (question) { if (questions[i] === question) { break; }
    } else { if (typeof questions[i].answer != 'string') { break; } }
    insertQuestion(questions[i])
    createEditBtn(questions[i])
    insertAnswer(questions[i])
  }
  if (questions[i]) {
    const lastQuestion = `<div class="message received">${questions[i].set_up.position} - ${questions[i].set_up.question}</div>`
    form.insertAdjacentHTML("beforeend", lastQuestion);
     setFormForFormulary(questions[i])
  } else {
    createLinkAnalyze()
  }
}

function fetchFormulary(){
  const formulary_id = form.dataset.id
  if (formulary_id) {
    var url = "/api/v1/formularies/"+ formulary_id +"/edit"
  } else {
    var url = "/api/v1/formularies/new"
  }
  fetch(url)
    .then(response => response.json())
    .then(insertQuestionAnswers);
}


export { fetchFormulary }

















