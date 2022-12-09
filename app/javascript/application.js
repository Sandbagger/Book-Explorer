// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"



// if you are using turbo, listen on turbo:load instead
// listen on 'turbolinks:load' instead of 'DOMContentLoaded' if using Turbolinks
document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.upload-file').forEach(fileInput => {
    fileUpload(fileInput)
  })
})