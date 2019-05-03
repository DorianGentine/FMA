import { scrollLastMessageIntoView } from "../../components/scroll";
import {updateFormulary} from "../formularies/edit";
const form = document.getElementById("formulary")
let question_send, answer_send, btn

const insertQuestion = (question) => {
  question_send = `<div class="message received">${question.set_up.position} - ${question.set_up.question}</div>`
}

const createEditBtn = (data) => {
  btn = `<button type="button" class="btn btn-light edit float-left" data-position="${data.set_up.position}"><i class="fas fa-pencil-alt"></i></button>`
}

const insertAnswer = (question) => {
  createEditBtn(question)
  answer_send = `<div class="message sent" data-columnName='${question.set_up.column_name}'>${btn} ${question.answer}</div>`
}

const createInputAnswer = (question, div) => {
  const input = document.createElement("input")
  input.style.width = "70%"
  input.classList = "form-control select optional"
  input.id = `formulary_${question.set_up.column_name}`
  input.name = `formulary[${question.set_up.column_name}]`
  input.type = "text"
  div.appendChild(input)
}

const insertSelectAnswer = (question, div) => {
  const selectList = document.createElement("select")
  selectList.style.width = "70%"
  selectList.classList = "form-control select optional"
  selectList.id = `formulary_${question.set_up.column_name}`
  selectList.name = `formulary[${question.set_up.column_name}]`
  div.appendChild(selectList)
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
}


const createSubmitBtn = (div) => {
  const submit = document.createElement("input")
  submit.style.width = "30%"
  submit.classList = "btn btn-primary"
  submit.name = "commit"
  submit.type = "submit"
  div.appendChild(submit)
}


const createLinkAnalyze = () => {
  const link = `<a class="nav-link btn-connexion" title="Voir mon analyse" href="/formularies/${form.dataset.id}" style="width: 100%;">Voir mon analyse</a>`
  form.insertAdjacentHTML("beforeend", link)
}

const setFormForFormulary = (question) => {
  const div = document.createElement('form')
  if (form.dataset.id) {
    div.classList = "simple_form edit_formulary"
    div.id = `edit_formulary_${form.dataset.id}`
    div.action = `/formularies/${form.dataset.id}`
  } else {
    div.classList = "simple_form new_formulary"
    div.id = `new_formulary`
    div.action = `/formularies`
  }

  div.noValidate = "novalidate"
  // div.setAttribute("data-remote", false)
  div.acceptCharset = "UTF-8"
  div.method = "post"
  div.style.display = "flex"
  form.appendChild(div)

  const input = document.createElement("input")
  input.name = "_method"
  if (form.dataset.id) {input.value = "patch"} else {input.value = "post"}
  input.type = "hidden"
  div.appendChild(input)
  if (question.set_up.type === "select") {
    insertSelectAnswer(question, div)

  } else if (question.set_up.type === "input"){
    createInputAnswer(question, div)
  }
  createSubmitBtn(div)
}


const insertQuestionAnswers = (data) => {
  const datas = data.formulary.questions
  for ( var i = 0; i < datas.length; i ++){
    if (typeof datas[i].answer != 'string') { break; }
    insertQuestion(datas[i])
    // createEditBtn(datas[i])
    insertAnswer(datas[i])
    var to_send = question_send + answer_send
    form.insertAdjacentHTML("beforeend", to_send);
  }
  if (data.formulary.questions[i]) {
    const lastQuestion = `<div class="message received">${data.formulary.questions[i].set_up.position} - ${data.formulary.questions[i].set_up.question}</div>`
    form.insertAdjacentHTML("beforeend", lastQuestion);
    // insertSelectAnswer(data.formulary.questions[i])
     setFormForFormulary(data.formulary.questions[i])
  } else {
    createLinkAnalyze()
  }
  scrollLastMessageIntoView()
  updateFormulary(data.formulary)
}



function fetchFormulary(){
  const formulary_id = form.dataset.id
  if (formulary_id) {
    var url = "http://localhost:3000/api/v1/formularies/"+ formulary_id +"/edit"
  } else {
    var url = "http://localhost:3000/api/v1/formularies/new"
  }
  fetch(url)
    .then(response => response.json())
    .then(insertQuestionAnswers);
}


export { fetchFormulary }

















