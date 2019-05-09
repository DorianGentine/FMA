import $ from 'jquery';
import 'select2';
import 'selectize';

const initSelect2 = () => {
  $(".select2").select2({
    placeholder: 'Choissiez ou ajoutez',
    width: '100%',
    templateSelection: function (data) {
      multiSelectionOnChange(data)
    // Add custom attributes to the <option> tag for the selected option
    // $(data.element).attr('data-custom-attribute', data.customValue);
    return data.text;
  }
  });
};


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
        // let isSelected
        // if (answer.includes(option)) { isSelected = true } else {isSelected = false}
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

const initSelectize = (question) => {
  let select = $(".multiple_select2").selectize({
    plugins: ['remove_button'],
    placeholder: 'Choissiez ou ajoutez',
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
















import 'select2/dist/css/select2.css';
import 'selectize/dist/css/selectize.css';


export { initSelect2, initSelectize };
