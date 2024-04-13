document.addEventListener("turbo:load", function() {
  window.previewImage = function() {
    var preview = document.getElementById('photo-preview');
    var file    = document.getElementById('photo-input').files[0];
    var reader  = new FileReader();

    reader.onloadend = function() {
      var img = document.createElement('img');
      img.src = reader.result;
      img.style.maxWidth = '200px'; // Set the width of the preview
      img.style.maxHeight = '200px'; // Set the height of the preview
      preview.innerHTML = ''; // Clear any existing content
      preview.appendChild(img); // Append the new image
    }

    if (file) {
      reader.readAsDataURL(file); // Read the file as a Data URL
    } else {
      preview.innerHTML = '';
    }
  }
});