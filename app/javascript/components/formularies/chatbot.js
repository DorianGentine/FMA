import { scrollLastMessageIntoView } from "../../components/scroll";
import {
  insertQuestion,
  setNextQuestion,
  insertAnswer,
  createLinkNext
} from "./components";

const formulary = document.getElementById("formulary")
if (formulary) {
  const visitor_id = formulary.dataset.visitor
}
const input = document.getElementById('formulary-form')

const getEditAnswer = (questions) => {
  const btns = document.querySelectorAll('.edit')
  btns.forEach((btn) => {
    btn.addEventListener('click', function(){
      for (var i = 0; i < questions.length; i++) {
        if (questions[i].set_up.id == parseInt(btn.dataset.question, 10)) {
          formulary.innerHTML = ""
          input.lastElementChild.remove()
          nextStep(questions, false, questions[i])
        }
      }
    })
  })
}

const setQuestionAnswer = (question) => {
  insertQuestion(question)
  if (question.set_up.need_answer) {
    insertAnswer(question)
  }
}


const nextStep = (questions, updated = null, question = null) => {
  const asked = document.querySelector(".received:last-child")
  for ( var i = 0; i < questions.length; i ++){
    if (question) {
      if (questions[i] === question) { break; }
    } else {
    if (typeof questions[i].answer != 'string' && typeof questions[i].answer != 'number') { break; } }
    if (updated && asked != undefined && questions[i].set_up.id === parseInt(asked.dataset.question, 10)){
      input.lastElementChild.remove()
      insertAnswer(questions[i])
    } else if (asked == undefined ) {
      setQuestionAnswer(questions[i])
    }
  }
  if (i == questions.length) {
    createLinkNext(questions[0].formulary_id)
  } else {
    insertQuestion(questions[i], true)
  }
  scrollLastMessageIntoView(formulary)
  getEditAnswer(questions)
}



const updateFormulary = (event) => {
  const obj = {
    name: event.srcElement[1].name,
    value: event.srcElement[1].value,
  }
  fetch(`/api/v1/visitors/${visitor_id}/update_formulary`, {
    headers: {"Content-Type": "application/json; charset=utf-8"},
    method: "PATCH",
    body: JSON.stringify(obj)
  }).then(response => response.json()).then((data) => {
    console.log('updated data', data)
    nextStep(data, true)
  })
}

if (input) {
  input.addEventListener("submit", updateFormulary);
}


function fetchFormulary(){
  if (formulary) {
    fetch(`/api/v1/visitors/${visitor_id}`)
      .then(response => response.json())
      .then((data) => {
        console.log('get data', data)
        nextStep(data)
      });
  }
}

export { fetchFormulary }
