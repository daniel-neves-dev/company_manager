import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["delete"]; // Define a target for the delete

  connect() {
    // Set a timeout to fade out the delete
    setTimeout(() => {
      this.fadeOut();
    }, 2000); // Delay before starting fade out, adjust as necessary
  }

  fadeOut() {
    const deleteElement = this.deleteTarget;
    if (deleteElement) {
      deleteElement.style.transition = 'opacity 1s ease-in-out';
      deleteElement.style.opacity = '0';

      // Remove the element from the DOM after the transition
      setTimeout(() => {
        deleteElement.remove();
      }, 1000); // Duration of the fade out, must match the CSS transition
    }
  }
}
