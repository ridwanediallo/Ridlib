// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

const btn_one = document.getElementById('visibility_btn_one');
const btn_two = document.getElementById('visibility_btn_two');

btn_one.addEventListener('click', () => {
  const password = document.getElementById('password');
  const icon_one = document.getElementById('icon_one');

  if (password.type === 'password') {
    password.type = 'text';
    icon_one.innerText = 'visibility';
  } else {
    password.type = 'password';
    icon_one.innerText = 'visibility_off';
  }
});

btn_two.addEventListener('click', () => {
  const confirmPassword = document.getElementById('confirm_password');
  const icon_two = document.getElementById('icon_two');

  if (confirmPassword.type === 'password') {
    confirmPassword.type = 'text';
    icon_two.innerText = 'visibility';
  } else {
    confirmPassword.type = 'password';
    icon_two.innerText = 'visibility_off';
  }
});
