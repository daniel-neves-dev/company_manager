import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["alert"]; // Define a target for the alert

  connect() {
    // Set a timeout to fade out the alert
    setTimeout(() => {
      this.fadeOut();
    }, 1000); // Delay before starting fade out, adjust as necessary
  }

  fadeOut() {
    const alertElement = this.alertTarget;
    if (alertElement) {
      alertElement.style.transition = 'opacity 1s ease-in-out';
      alertElement.style.opacity = '0';

      // Remove the element from the DOM after the transition
      setTimeout(() => {
        alertElement.remove();
      }, 1000); // Duration of the fade out, must match the CSS transition
    }
  }
}
