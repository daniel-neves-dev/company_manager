import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["input", "preview", "image", "placeholder"]

  connect() {
    // Set a unique temporary ID for new employee forms, if not already set.
    if (!this.imageTarget.dataset.employeeId || this.imageTarget.dataset.employeeId.startsWith('new-')) {
      this.imageTarget.dataset.employeeId = `new-${Date.now()}`;
    }
    // Retrieve and display any existing photo preview from session storage or existing photo.
    this.retrieveImagePreview();
  }

  // When the file input changes, handle the image preview
  previewImage() {
    const file = this.inputTarget.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        this.displayPreview(reader.result);
        // Save the image preview in session storage.
        sessionStorage.setItem(this.sessionStorageKey(), reader.result);
      };
      reader.readAsDataURL(file);
    } else {
      this.clearPreview();
    }
  }

  // Show the image preview
  displayPreview(imageSrc) {
    this.imageTarget.src = imageSrc;
    this.imageTarget.classList.remove('hidden');
    this.placeholderTarget.classList.add('hidden');
    this.previewTarget.classList.remove('hidden');
  }

  // Clear the image preview
  clearPreview() {
    this.imageTarget.src = "";
    this.imageTarget.classList.add('hidden');
    this.placeholderTarget.classList.remove('hidden');
    this.previewTarget.classList.add('hidden');
  }

  // Retrieve the image preview from session storage or display existing photo
  retrieveImagePreview() {
    const savedImageSrc = sessionStorage.getItem(this.sessionStorageKey());
    if (savedImageSrc) {
      this.displayPreview(savedImageSrc);
    } else if (this.imageTarget.dataset.existingPhotoUrl && !this.imageTarget.dataset.employeeId.startsWith('new-')) {
      // Display existing photo only if it's not a new employee form.
      this.displayPreview(this.imageTarget.dataset.existingPhotoUrl);
    } else {
      this.clearPreview();
    }
  }

  // Unique session storage key using the employee ID
  sessionStorageKey() {
    const employeeId = this.imageTarget.dataset.employeeId;
    return `photoPreview-${employeeId}`;
  }
}
