import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["alert", "photoCard"];

    connect() {
        this.photoCardTarget.classList.add('mt-[size_of_alert]');
        setTimeout(() => {
            this.fadeOut();
        }, 2000);
    }

    fadeOut() {
        if (this.hasAlertTarget) {
            const alertElement = this.alertTarget;
            alertElement.style.transition = 'opacity 1s ease-in-out';
            alertElement.style.opacity = '0';

            setTimeout(() => {
                if (this.hasAlertTarget) {
                    alertElement.remove();

                    // Apply the margin-top transition to the photo card
                    if (this.hasPhotoCardTarget) {
                        this.photoCardTarget.style.transition = 'margin-top 1s ease-in-out';
                        this.photoCardTarget.style.marginTop = '36px';
                    }
                }
            }, 1000);
        }
    }
}