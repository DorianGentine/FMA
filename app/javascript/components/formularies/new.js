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


const formulary = document.getElementById("formulary")

const getEditAnswer = (questions) => {
  const btns = document.querySelectorAll('.edit')
  btns.forEach((btn) => {
    btn.addEventListener('click', function(){
      for (var i = 0; i < questions.length; i++) {
        if (questions[i].set_up.position == btn.dataset.position) {
          formulary.innerHTML = ""
          removeFormOrLink()
          editAnswer(questions, questions[i])
        }
      }
    })
  })
}

const removeFormOrLink = () => {
  document.getElementById('formulary-form').lastElementChild.remove()
}

const editAnswer = (questions, question) => {
  setQuestionsAnswer(questions, question)
}

const insertQuestionAnswers = (questions) => {
  setQuestionsAnswer(questions)
  getEditAnswer(questions)
  document.getElementById('formulary-form').addEventListener("submit", function(){
    updateFormulary(questions)
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

const setPackQuestionAnswer = (questions, last_question, question) => {
  insertAnswer(questions[last_question])
  setNextQuestion(questions[question])
  getEditAnswer(questions)
}


const nextStep = (questions) => {
  removeFormOrLink()
  for ( var i = 0; i < questions.length; i ++){
    if (typeof questions[i].answer != 'string' && typeof questions[i].answer != 'number' ) { break; }
  }
  if (i == questions.length) {
    setPackQuestionAnswer(questions, i-2, i-1)
    createLinkNext()
  } else {
    setPackQuestionAnswer(questions, i-1, i)
    setFormForFormulary(questions[i])
  }
  scrollLastMessageIntoView(formulary)
}



function fetchFormulary(updated = null, id = null){
  if (formulary) {
    var visitor_id = formulary.dataset.visitor
    var url = `/api/v1/visitors/${visitor_id}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log('get data', data)
        insertQuestionAnswers(data)
        scrollLastMessageIntoView(formulary)
      });
  }
}


export { fetchFormulary, nextStep }
