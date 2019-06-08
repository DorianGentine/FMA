import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/material_blue.css");
import { French } from "flatpickr/dist/l10n/fr.js"


const flatpicker = () => {
  flatpickr(".datepicker", {
    "locale": French,
    dateFormat: "d/m/Y",
    // defaultDate: "12/12/1953"
  })
  setFmaColor()
}

const setFmaColor = () => {
  if (document.querySelector(".datepicker")) {
    document.querySelector(".flatpickr-weekdays").style.backgroundColor = "#2675e5"
    document.querySelector(".flatpickr-weekday").style.backgroundColor = "#2675e5"
    document.querySelectorAll(".flatpickr-weekday").forEach((selected)=> selected.style.backgroundColor = "#2675e5")
    document.querySelector(".flatpickr-month").style.backgroundColor = "#2675e5"
    document.querySelector(".flatpickr-monthDropdown-months").style.backgroundColor = "#2675e5"
  }
}

export { flatpicker };
