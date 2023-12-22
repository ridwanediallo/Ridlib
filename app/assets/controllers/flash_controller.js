import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['menu'];

  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 8000);
  }

  dismiss() {
    this.element.remove();
  }

  open() {
    this.menuTarget.classList.remove('hidden');
  }

  close() {
    this.menuTarget.classList.add('hidden');
  }

}
