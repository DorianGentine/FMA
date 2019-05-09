import { initSelect2, initSelectize } from '../../components/init_select2';



let question_send, answer_send, btn
const form = document.getElementById("formulary")


const conditionToAnswer = (question) => {
  const answer = question.answer
  let total_answer
  if (answer == "0- Oui") {
    total_answer = question.set_up.start_answer["oui"]
  } else if (answer == "1- Non") {
    total_answer = question.set_up.start_answer["non"]
  } else if ( question.set_up.column_name != "occupant" && answer == 1 ) {
    total_answer = question.set_up.start_answer["1"] + answer
  } else if (answer == 2 ) {
    total_answer = question.set_up.start_answer["2"] + answer
  }  else if (question.set_up.column_name == "occupant" ) {
    if (answer == 1) {
      total_answer = question.set_up.start_answer["1"]
    } else {
      total_answer = question.set_up.start_answer["2"] + answer + " dans le foyer"
    }
  } else {
    total_answer = `${question.set_up.start_answer} ${answer}`
  }
  return total_answer
}


const insertQuestion = (question) => {
  question_send = `<div class="message received">${question.set_up.position} - ${question.set_up.question}</div>`
  form.insertAdjacentHTML("beforeend", question_send);
}

const createEditBtn = (question) => {
  btn = `<button type="button" class="btn btn-light float-left edit" data-position="${question.set_up.position}"><i class="fas fa-pencil-alt"></i></button>`
}

const insertAnswer = (question) => {
  createEditBtn(question)
  answer_send = `<div class="message sent" data-columnName='${question.set_up.column_name}'>${btn} ${conditionToAnswer(question)}</div>`
  form.insertAdjacentHTML("beforeend", answer_send);
}
const createLinkNext = () => {
  const link = `<a class="nav-link btn-connexion" id="send_to_analyze" title="Voir mon analyse" href="/" style="width: 100%;">Voir mon analyse</a>`
  // const link = `<a class="nav-link btn-connexion" id="send_to_analyze" title="Voir mon analyse" href="/formularies/${form.dataset.id}" style="width: 100%;">Voir mon analyse</a>`
  form.insertAdjacentHTML("afterend", link)
}

const createInput = (question, div) => {
  const input = document.createElement("input")
  input.style.width = "70%"
  input.classList = "form-control select optional"
  input.id = `formulary_${question.set_up.column_name}`
  input.placeholder  = `${question.set_up.placeholder}`
  // if (question.set_up.column_name === "zip_code") {
  //   input.id = `flat_address`
  //   input.id = `flat_address formulary_${question.set_up.column_name}`
  // }
  input.name = `formulary[${question.set_up.column_name}]`
  if (question.set_up.type === "number") {
    input.type = "number"
    input.min = "1"
  } else {
    input.type = "text"
  }
  input.value = question.answer
  input.setAttribute( "data-position", question.set_up.position)
  div.appendChild(input)
}



const createMultiInput = (question, div) => {
  const input = document.createElement("input")
  input.style.width = "70%"
  input.classList = "form-control select optional"
  input.classList.add("multiple_select2")
  input.type = "text"
  input.multiple = "multiple"
  input.name = `formulary[${question.set_up.column_name}]`
  input.setAttribute( "data-position", question.set_up.position)
  div.appendChild(input)
  initSelectize(question)
}


const insertSelectAnswer = (question, div) => {
  const selectList = document.createElement("select")
  selectList.style.width = "70%"
  selectList.classList = "form-control select optional"
  selectList.id = `formulary_${question.set_up.column_name}`
  selectList.name = `formulary[${question.set_up.column_name}]`
  selectList.setAttribute( "data-position", question.set_up.position)
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

const setNextQuestion = (nex_question) => {
  const lastQuestion = `<div class="message received">${nex_question.set_up.position} - ${nex_question.set_up.question}</div>`
  form.insertAdjacentHTML("beforeend", lastQuestion);
}

const setFormForFormulary = (question) => {
  const div = document.createElement('form')
    div.classList = "simple_form edit_visitor margin-top-15"
    div.id = `edit_visitor_${form.dataset.visitor}`

  div.setAttribute('novalidate', "novalidate");
  div.setAttribute("data-remote", true)
  div.acceptCharset = "UTF-8"
  // div.method = "post"
  div.style.display = "flex"
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
  setNextQuestion,
  insertAnswer,
  createLinkNext,
  setFormForFormulary
}

