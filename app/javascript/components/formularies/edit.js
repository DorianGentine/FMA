
import { nextStep } from "../formularies/new";

const formularyForm = document.getElementById('formulary-form')

function updateFormulary(questions){
  const discussion = document.getElementById("formulary")
  if(discussion){
    const visitor_id = discussion.dataset.visitor
    const form = document.getElementById(`edit_visitor_${visitor_id}`);
    let input
    if (formularyForm.getElementsByTagName('select')[0]) {
      input = formularyForm.getElementsByTagName('select')[0]
    } else { input = formularyForm.getElementsByTagName('input')[1] }

    const obj = {}
    obj[input.name] = input.value
    fetch(`/api/v1/visitors/${visitor_id}/update_formulary`, {
      headers: {"Content-Type": "application/json; charset=utf-8"},
      method: "PATCH",
      body: JSON.stringify({ params_value: obj })
    })
    .then(response => response.json()).then((data) => {
        console.log('updated data', data)
        nextStep(data)
      })
  }
};


export { updateFormulary }





