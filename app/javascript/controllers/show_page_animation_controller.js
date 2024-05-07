import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photoCard"]

  connect() {
    this.photoCardTarget.classList.add('opacity-0', 'translate-y-4');
    this.animateCard();
  }

  animateCard() {
    setTimeout(() => {
      this.photoCardTarget.classList.remove('opacity-0', 'translate-y-4');
      this.photoCardTarget.classList.add('opacity-100', 'translate-y-0');
    }, 100);
  }
}
