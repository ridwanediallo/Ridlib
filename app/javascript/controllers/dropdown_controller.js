import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu', 'dropdown'];

  toggleDropdown() {
    this.dropdownTarget.classList.toggle('hidden');
  }
}
