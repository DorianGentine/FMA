import { scrollLastMessageIntoView } from "../../components/scroll";
import {updateFormulary} from "../formularies/edit";
const form = document.getElementById("formulary")
let question_send
let answer_send

const insertQuestion = (question) => {
  question_send = `<div class="message received">${question.set_up.question}</div>`
}

const insertStringAnswer = (question) => {
  answer_send = `<div class="message sent">
  <input class='collect' type='${question.set_up.type}' value='${question.answer}' data-columnName='${question.set_up.column_name}'>
  </div>`
}

const insertSelectAnswer = (question, index) => {
  var selectList = document.createElement("select")
  selectList.setAttribute('data-columnName', question.set_up.column_name )
  selectList.classList = "message sent collect"
  console.log(selectList)
  form.appendChild(selectList);
  var option = document.createElement("option")
  option.text = question.set_up.placeholder
  selectList.add(option)
  for (var i=0; i < Object.keys(question.set_up.data).length; i++){
    var option = document.createElement("option")
    if (question.set_up.data.toString.call([])) {
      option.value = i;
    } else {option.value = question.set_up.data[i] }
    option.text = question.set_up.data[i];
    if (option.text == question.answer){
      option.selected = "selected"
    } else { }
    selectList.add(option)
  }
  answer_send = null
}

const insertQuestionAnswers = (data) => {
  data.formulary.questions.forEach((question, index) => {
    insertQuestion(question)
    if (question.set_up.type === "text") {
      insertStringAnswer(question)
    }
    if (answer_send) { var to_send = question_send + answer_send }
    else { var to_send = question_send };
    form.insertAdjacentHTML("beforeend", to_send);

    if (question.set_up.type === "select") {
      insertSelectAnswer(question, index)
    };
  })
  scrollLastMessageIntoView()
}

function fetchFormulary(){
  const formulary_id = form.dataset.id
  if (formulary_id) {
    var url = "http://localhost:3000/api/v1/formularies/"+ formulary_id +"/edit"
  }
  fetch(url)
    .then(response => response.json())
    .then(insertQuestionAnswers);
    updateFormulary(form)
}

export { fetchFormulary }
