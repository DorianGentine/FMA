let question_send, answer_send, btn
const form = document.getElementById("formulary")
const insertQuestion = (question) => {
  console.log(question)
  question_send = `<div class="message received">${question.set_up.position} - ${question.set_up.question}</div>`
  form.insertAdjacentHTML("beforeend", question_send);
}

const createEditBtn = (data) => {
  btn = `<button type="button" class="btn btn-light edit" data-position="${data.set_up.position}"><i class="fas fa-pencil-alt"></i></button>`
}

const insertAnswer = (question) => {
  createEditBtn(question)
  answer_send = `<div class="message sent" data-columnName='${question.set_up.column_name}'>${btn} ${question.answer}</div>`
  form.insertAdjacentHTML("beforeend", answer_send);
}
const createLinkAnalyze = () => {
  const link = `<a class="nav-link btn-connexion" title="Voir mon analyse" href="/formularies/${form.dataset.id}" style="width: 100%;">Voir mon analyse</a>`
  form.insertAdjacentHTML("beforeend", link)
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
  submit.id = "envoyer"
  submit.classList = "btn btn-primary"
  submit.name = "commit"
  submit.type = "submit"
  div.appendChild(submit)
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


export {
  insertQuestion,
  insertAnswer,
  createInputAnswer,
  insertSelectAnswer,
  createSubmitBtn,
  createLinkAnalyze,
  setFormForFormulary
}

