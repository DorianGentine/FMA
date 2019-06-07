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
}



export { flatpicker };
