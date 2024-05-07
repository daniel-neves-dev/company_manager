import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["employeeCard"]

  connect() {
    this.employeeCardTargets.forEach((card, index) => {
      setTimeout(() => {
        card.classList.add('fade-in-end');
      }, 250 * index);
    });
  }
}
