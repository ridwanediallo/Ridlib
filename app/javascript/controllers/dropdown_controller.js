import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu', 'dropdown'];

  connect() {
    // Add a click event listener to the document body
    document.body.addEventListener('click', this.closeDropdown.bind(this));
  }

  disconnect() {
    // Remove the click event listener when the controller is disconnected
    document.body.removeEventListener('click', this.closeDropdown.bind(this));
  }

  toggleDropdown() {
    this.dropdownTarget.classList.toggle('hidden');
  }

  closeDropdown(event) {
    // Check if the click event target is outside the dropdown menu
    if (!this.menuTarget.contains(event.target)) {
      // Close the dropdown menu
      this.dropdownTarget.classList.add('hidden');
    }
  }
}
