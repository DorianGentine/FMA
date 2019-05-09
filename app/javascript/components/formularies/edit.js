
import { fetchFormulary } from "../formularies/new";

const formularyForm = document.getElementById('formulary-form')

const successUptade = (input, questions, form, id) => {
  const btn = document.getElementById("send_to_analyze")
  form.remove()
  if (btn) { btn.remove()}
  fetchFormulary(true, id)
}

function updateFormulary(event, questions){
  const discussion = document.getElementById("formulary")
  if(discussion){
    const formulary_id = discussion.dataset.id
    var form, url, type
    if (formulary_id) { form = document.getElementById(`edit_formulary_${formulary_id}`); url = `/api/v1/formularies/${formulary_id}`; type = "PATCH"
    } else { form = document.getElementById('new_formulary'); url = "/api/v1/formularies"; type = "POST" }
    if (form) {
      var input
      if (formularyForm.getElementsByTagName('select')[0]) {
        input = formularyForm.getElementsByTagName('select')[0]
      } else { input = formularyForm.getElementsByTagName('input')[1] }
      const obj = {}
      console.log(input.value)
      obj[input.name.replace("formulary[", "").replace("]","")] = input.value
        console.log("obj",obj)
      var request = $.ajax({
        url: url,
        type: type,
        data: { params_value: obj }
      });
      request.done(function(msg) {
        // console.log("data", msg)
        let id = msg.id
        successUptade(input, questions, form, id)
      });

      request.fail(function(jqXHR, textStatus) {
        console.log( "Request failed: " + textStatus );
      });
    };
  }
};


export { updateFormulary }





