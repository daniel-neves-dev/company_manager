// dark_button_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["themeToggleDarkIcon", "themeToggleLightIcon"];

  connect() {
    this.applyThemePreference();
  }

  toggleTheme() {
    // Toggle icons inside the button
    this.themeToggleDarkIconTarget.classList.toggle('hidden');
    this.themeToggleLightIconTarget.classList.toggle('hidden');

    // If set via local storage previously
    if (localStorage.getItem('color-theme')) {
      if (localStorage.getItem('color-theme') === 'light') {
        document.documentElement.classList.add('dark');
        localStorage.setItem('color-theme', 'dark');
      } else {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('color-theme', 'light');
      }
    } else {
      // If NOT set via local storage previously
      if (document.documentElement.classList.contains('dark')) {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('color-theme', 'light');
      } else {
        document.documentElement.classList.add('dark');
        localStorage.setItem('color-theme', 'dark');
      }
    }
  }

  applyThemePreference() {
    // Initial application of theme based on local storage or system preference
    if (localStorage.getItem('color-theme') === 'dark' ||
        (!localStorage.getItem('color-theme') && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark');
      this.themeToggleLightIconTarget.classList.remove('hidden');
      this.themeToggleDarkIconTarget.classList.add('hidden');
    } else {
      document.documentElement.classList.remove('dark');
      this.themeToggleDarkIconTarget.classList.remove('hidden');
      this.themeToggleLightIconTarget.classList.add('hidden');
    }
  }
}
