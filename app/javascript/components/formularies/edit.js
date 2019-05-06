
import { fetchFormulary } from "../formularies/new";



const successUptade = (input, questions, form, id) => {
  console.log("coucou jai envoyé les données")
  form.remove()
  fetchFormulary(true, id)
}

function updateFormulary(event, questions){
  const discussion = document.getElementById("formulary")
  console.log(discussion)
  if(discussion){
    const formulary_id = discussion.dataset.id
    var form, url, type
    if (formulary_id) { form = document.getElementById(`edit_formulary_${formulary_id}`); url = `/api/v1/formularies/${formulary_id}`; type = "PATCH"
    } else { form = document.getElementById('new_formulary'); url = "/api/v1/formularies"; type = "POST" }
    if (form) {
      var input
      console.log("input", form.getElementsByTagName('select'))
      if (form.getElementsByTagName('select')[0]) {
        input = form.getElementsByTagName('select')[0]
      } else { input = form.getElementsByTagName('input')[1] }
      const obj = {}
      obj[input.name.replace("formulary[", "").replace("]","")] = input.value
      // console.log("coucou jenvoie les données", obj)
      var request = $.ajax({
        url: url,
        type: type,
        data: { params_value: obj }
      });
      request.done(function(msg) {
        console.log("done", msg );
        // AJOUTER ID POUR NEW AVCE msg.id
        console.log("id", msg.id)
        let id = msg.id
        successUptade(input, questions, form, id)
      });

      request.fail(function(jqXHR, textStatus) {
        console.log( "Request failed: " + textStatus );
      });
    };
  }
};


export { updateFormulary}





