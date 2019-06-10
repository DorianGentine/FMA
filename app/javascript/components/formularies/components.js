import { initSelect2, initSelectize } from '../../components/init_select2';
import { flatpicker } from '../../components/flatpicker';

import { currencyFormatDE } from "../../components/currency";
import { onClickHint } from "./chatbot";

import initSelectFma from "../select_fma";


let question_send, answer_send, btn, hint
const form = document.getElementById("formulary")


const conditionToAnswer = (question) => {
  const answer = question.answer
  let total_answer
  if (answer == "0- Oui") {
    total_answer = question.set_up.start_answer["oui"]
  }
  else if (answer == "1- Non") {
    total_answer = question.set_up.start_answer["non"]
  }
  else if ( question.set_up.column_name != "occupant" && answer == 1 ) {
    total_answer = question.set_up.start_answer["1"] + answer
  }
  else if (answer == 2 ) {
    total_answer = question.set_up.start_answer["2"] + answer
  }
  else if (question.set_up.column_name == "occupant" ) {
    if (answer == 1) {
      total_answer = question.set_up.start_answer["1"]
    } else {
      total_answer = question.set_up.start_answer["2"] + answer + " dans le logement"
    }
  }
  else if (question.set_up.currency ){
    total_answer = question.set_up.start_answer + currencyFormatDE(answer)
  }
  else if (question.set_up.column_name == "supplementary") {
    if (answer.split(", ").length > 1) {
      total_answer = question.set_up.start_answer["more"] + answer
    } else {total_answer = question.set_up.start_answer["one"] + answer}
  }
  else if (question.set_up.start_answer == null) {
    total_answer = ` ${answer}`
  }
  else if (question.set_up.column_name == "loss_of_autonomy") {
    if (answer == "0- Supérieur à 4" || answer == "1- Inférieur ou égale à 4") {
      total_answer = `${question.set_up.start_answer} ${answer}`
    } else {
      total_answer = `${answer}`
    }
  }
  else if (question.set_up.column_name == "assistant") {
    if (answer == "5- Non") {
      total_answer = `${question.set_up.start_answer["none"]} ${answer}`
    }
    else if (answer.split(", ").length > 1) {
      let answers = ""
      answer.split(", ").forEach((a) => {
        answers = answers + "<li>"+ a +"</li>"
      })
      total_answer = `${question.set_up.start_answer["more"]} <ul> ${answers} </ul>`
    } else {
      total_answer = `${question.set_up.start_answer["one"]} ${answer}`
    }
  }

  else {
    total_answer = `${question.set_up.start_answer} ${answer}`
  }
  return total_answer
}

const questionMark = () => {
  return '<i class="far fa-question-circle hintClick"></i>'
}





const insertHint = (question) => {
  hint = `<div class="message hint-message" style="display:none"><em>${question.set_up.hint}</em></>`
}

const insertQuestion = (question, last = null) => {
  if (question.set_up.hint) {
    insertHint(question)
    question_send = `
      <div class="message received" data-question="${question.set_up.id}" id="hint_${question.set_up.id}">
        ${question.set_up.question} ${questionMark()}
        ${hint}
      </div>
      `
  } else {
    question_send = `
    <div class="message received" data-question="${question.set_up.id}">
      ${question.set_up.question}
    </div>`
  }

  form.insertAdjacentHTML("beforeend", question_send);
  if (question.set_up.hint) {
    document.getElementById(`hint_${question.set_up.id}`).onclick = onClickHint;
  }
}



const createEditBtn = (question) => {
  btn = `<div class=" absolute btn btn-light edit" data-question="${question.set_up.id}"></div>`
}

const insertAnswer = (question) => {
  createEditBtn(question)
  answer_send = `<div class="message sent relative">${btn} ${conditionToAnswer(question)}</div>`
  form.insertAdjacentHTML("beforeend", answer_send);
}
const createLinkNext = (id) => {
  // const link = `<a class="nav-link btn-connexion" id="send_to_analyze" title="Voir mon analyse" href="/" style="width: 100%;">Voir mon analyse</a>`
  const link = `<div class="btn-blue"><a class="nav-link btn-connexion white" id="send_to_analyze" title="Voir mon analyse" href="/formularies/${id}" style="width: 100%;">Voir mon analyse</a><div>`
  form.insertAdjacentHTML("afterend", link)
}

const createInput = (question, div) => {
  const input = document.createElement("input")
  input.style.width = "calc(100% - 40px)"
  input.classList = "form-control select optional border-0"
  if (question.set_up.column_name === "age") {
    input.classList.add("datepicker")
  }
  input.id = `formulary_${question.set_up.column_name}`
  input.placeholder  = `${question.set_up.placeholder}`
  input.name = `${question.set_up.column_name}`
  if (question.set_up.type === "number") {
    input.type = "number"
    input.min = "1"
  } else {
    input.type = "text"
  }
  if (question.answer ) {
    if (question.set_up.column_name === "zip_code") {
      input.value = question.answer.split(', ')[1]
    } else {
      input.value = question.answer
    }
  }
  input.setAttribute( "data-position", question.set_up.position)
  div.appendChild(input)
  if (question.set_up.column_name != "age") {
    setTimeout(() => {input.focus()}, 100)
  }
  flatpicker()
}



const createMultiInput = (question, div) => {
  const input = document.createElement("input")
  input.style.width = "calc(100% - 40px)"
  input.classList = "flex"
  input.classList.add("multiple_select2")
  input.type = "text"
  input.multiple = "multiple"
  input.name = `${question.set_up.column_name}`
  input.setAttribute( "data-position", question.set_up.position)
  div.appendChild(input)
  initSelectize(question)
}


const insertSelectAnswer = (question, div) => {
  const selectFma = document.createElement("div")
  selectFma.classList = "select-fma"
  div.appendChild(selectFma)
  const selectList = document.createElement("select")
  selectList.classList = "form-control select optional border-0"
  selectList.id = `formulary_${question.set_up.column_name}`
  selectList.name = `${question.set_up.column_name}`
  selectList.setAttribute( "data-position", question.set_up.position)
  selectFma.appendChild(selectList)
  var option = document.createElement("option")
  option.text = question.set_up.placeholder
  selectList.add(option)
  for (var i=0; i < Object.keys(question.set_up.data).length; i++){
    let option = document.createElement("option")
    if (question.set_up.data.toString.call([])) {
      option.value = i;
    } else {option.value = question.set_up.data[i] }
    option.text = question.set_up.data[i];
    if (option.text == question.answer){
      option.selected = "selected"
    } else { }
    selectList.add(option)
  }

  initSelectFma()
  setTimeout(() => {selectFma.focus()}, 100)
}

const createSubmitBtn = (div) => {
  const submit = document.createElement("button")
  submit.id = "envoyer"
  submit.classList = "btn btn-primary btn-submit-form absolute"
  submit.name = "commit"
  submit.type = "submit"
  div.appendChild(submit)
}

const setFormForFormulary = (question) => {
  const div = document.createElement('form')
  div.classList = "simple_form edit_visitor margin-top-15 relative white-box"
  div.id = `edit_visitor_${form.dataset.visitor}`
  div.setAttribute('novalidate', "novalidate");
  div.setAttribute("data-remote", true)
  div.acceptCharset = "UTF-8"
  // div.method = "post"
  // div.style.display = "flex"
  document.getElementById('formulary-form').appendChild(div)

  const input = document.createElement("input")
  input.name = "_method"
  // if (form.dataset.id) {input.value = "patch"} else {input.value = "post"}
  input.type = "hidden"
  div.appendChild(input)
  if (question.set_up.type === "select") {
    if (question.set_up.multiple_answers) {
      createMultiInput(question, div)
    } else { insertSelectAnswer(question, div) }

  } else {
    createInput(question, div)
  }
  createSubmitBtn(div)
}


export {
  insertQuestion,
  insertAnswer,
  createLinkNext,
  setFormForFormulary
}

