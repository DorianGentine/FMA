
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
    const visitor_id = discussion.dataset.visitor
    var form, url, type
    form = document.getElementById(`edit_visitor_${visitor_id}`);
    if (form) {
      var input
      if (formularyForm.getElementsByTagName('select')[0]) {
        input = formularyForm.getElementsByTagName('select')[0]
      } else { input = formularyForm.getElementsByTagName('input')[1] }
      const obj = {}
      obj[input.name.replace("formulary[", "").replace("]","")] = input.value
        console.log("obj",obj)
      var request = $.ajax({
        url: `/api/v1/visitors/${visitor_id}/update_formulary`,
        type: "PATCH",
        data: { params_value: obj }
      });
      request.done(function(msg) {
        console.log("data", msg)
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





