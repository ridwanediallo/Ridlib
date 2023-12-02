import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['dropdown'];

  toggleDropdown(event) {
    event.stopPropagation();

    this.dropdownTarget.classList.toggle('hidden');
  }

  closeDropdown() {
    this.dropdownTarget.classList.add('hidden');
   }
}
