import 'bootstrap';
import { enhanceForm } from 'components/newcocktail.js'
import { loadDynamicBannerText } from 'components/banner.js';

const create = document.querySelector("#create");

if (document.querySelector(".cocktail-banner")) {
  loadDynamicBannerText();
}

if (create) {
  create.addEventListener('click', (event) => {
    event.preventDefault();
    enhanceForm(event);
  });
}



// document.addEventListener('DOMContentLoaded', loadDynamicBannerText);
