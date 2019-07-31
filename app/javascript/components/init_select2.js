import $ from 'jquery';
import 'select2';
import 'selectize';
// import 'select2/dist/css/select2.css';
// import 'selectize/dist/css/selectize.css';

const setOptions = (question) => {
  if (question) {
    let options = question.set_up.data
    let answer = question.answer
    if (answer && answer.split(", ").length > 1) {
      answer = answer.split(", ")
    }
    const array = new Array
    if (options instanceof Array) {
      options.forEach((option) => {
        let isSelected
        if (answer && answer.includes(option)) { isSelected = true } else {isSelected = false}
        array.push({text: option, value: option, selected:  isSelected })
      })
    } else {
      Object.entries(options).forEach((value, key) => {
        array.push({text: value, value: key })
      })
    }
    return array
  }
}


const initSelect2 = () => {
  $(".select2").select2({
    placeholder: 'Choisissez ou ajoutez',
    width: '100%',
    templateSelection: function (data) {
      multiSelectionOnChange(data)
    // Add custom attributes to the <option> tag for the selected option
    // $(data.element).attr('data-custom-attribute', data.customValue);
    return data.text;
  }
  });
};

const initSelectize = (question) => {
  let select = $(".multiple_select2").selectize({
    plugins: ['remove_button'],
    placeholder: 'Choisissez ou ajoutez',
    delimiter: ', ',
    persist: false,
    options: setOptions(question),
    // selectedField: "selected",
    create: function(input) {
      return {
        value: input,
        text: input
      }
    }
  });
}


















export { initSelect2, initSelectize };
