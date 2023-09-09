import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    this.overlayTarget.addEventListener('click', this.closeModal);
  }

  disconnect() {
    this.overlayTarget.removeEventListener('click', this.closeModal);
  }

  closeModal = () => {
    this.element.classList.add('hidden');
  };

  get overlayTarget() {
    return this.element.querySelector('.bg-opacity-75');
  }
}
