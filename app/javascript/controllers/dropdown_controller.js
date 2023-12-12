import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu', 'dropdown'];

  connect() {
    document.body.addEventListener('click', this.closeDropdown.bind(this));
  }

  disconnect() {
    document.body.removeEventListener('click', this.closeDropdown.bind(this));
  }

  toggleDropdown() {
    this.dropdownTarget.classList.toggle('hidden');
  }

  closeDropdown(event) {
    if (!this.menuTarget.contains(event.target)) {
      this.dropdownTarget.classList.add('hidden');
    }
  }
}
