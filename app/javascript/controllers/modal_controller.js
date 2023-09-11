import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['modal'];

  connect() {
    console.log('Modal Controller connected');
  }

  open() {
    this.modalTarget.style.display = 'block';
  }

  close() {
    this.modalTarget.style.display = 'none';
  }
}
