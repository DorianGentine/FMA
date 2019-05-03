

// const form = document.getElementById('formulary')


function updateFormulary(form){
  const sumbit = document.getElementById('testBtn')
  sumbit.addEventListener('click', (event) => {
    const inputs = form.querySelectorAll('.collect')
    const result = {id: parseInt(form.dataset.id, 10) };
    Array.from(inputs).forEach((input) => {
      if (parseInt(input.value, 10)) {
        result[input.dataset.columnname] = parseInt(input.value, 10)
      } else { result[input.dataset.columnname] = input.value }
    });
    $.ajax({
      url: `/formularies/${form.dataset.id}/sort`,
      type: 'PATCH',
      data: { params_value: result },
      success: function(){
        document.location.reload(true)
      }
    });
  });
};

export { updateFormulary}

// const getEditAnswer = (questions) => {
//   const btns = document.querySelectorAll('.edit')
//   btns.forEach((btn) => {
//     btn.addEventListener('click', function(){
//       for (var i = 0; i < questions.length; i++) {
//         if (questions[i].set_up.position == btn.dataset.position) {

//           editAnswer(questions[i])
//         }
//       }
//     })
//   })
// }

// const editAnswer = (question) => {
//   const form = document.getElementById("formulary")
//   console.log(form)
//   console.log(question)
// }
