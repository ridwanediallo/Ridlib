import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['dropdown', 'menu'];

  connect() {
    console.log('Dropdown Controller connected');
  }

  toggleDropdown(event) {
    event.stopPropagation();

    this.dropdownTarget.classList.toggle('hidden');
  }

  closeDropdown() {
    this.dropdownTarget.classList.add('hidden');
   }

   openMenu() {
     this.menuTarget.classList.remove('hidden');
   }

   closeMenu() {
     this.menuTarget.classList.add('hidden');
   }
}
