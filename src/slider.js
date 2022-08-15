import 'carbon-web-components/es/components/slider/index.js';
import Shiny from 'shiny';

document.addEventListener("bx-slider-changed", (e) => {Shiny.onInputChange("slider", e.detail.value)});
