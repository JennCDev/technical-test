import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="listing-form"
export default class extends Controller {

  static targets = ["form"];

  connect() {
  }

  submit(event) {
    event.preventDefault();

    // Obtenez les données du formulaire
    const formData = new FormData(this.formTarget);

    // Effectuez une requête AJAX avec Fetch
    fetch('/listings', {
      method: 'POST',
      body: formData
    })
    .then(response => {
      if (response.ok) {
        // Redirection côté client
        console.log(response);
        // window.location.href = `/listings`;
      } else {
        // Gestion des erreurs
        console.error('Erreur lors de la soumission du formulaire:', response.statusText);
      }
    })
    .catch(error => {
      // Gestion des erreurs réseau
      console.error('Erreur réseau lors de la soumission du formulaire.', error);
    });
  }
}
