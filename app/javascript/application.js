// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';


document.addEventListener('turbo:load', () => {
 const passwordToggle = document.getElementById('password_toggle');
 const passwordConfirmationToggle = document.getElementById(
   'password_confirmation_toggle'
 );
 const passwordField = document.getElementById('password');
 const passwordConfirmationField = document.getElementById(
   'password_confirmation'
 );

 passwordToggle.addEventListener('click', () => {
   if (passwordField.type === 'password') {
     passwordField.type = 'text';
     passwordToggle.innerText = 'visibility_off';
   } else {
     passwordField.type = 'password';
     passwordToggle.innerText = 'visibility';
   }
 });

 passwordConfirmationToggle.addEventListener('click', () => {
   if (passwordConfirmationField.type === 'password') {
     passwordConfirmationField.type = 'text';
     passwordConfirmationToggle.innerText = 'visibility_off';
   } else {
     passwordConfirmationField.type = 'password';
     passwordConfirmationToggle.innerText = 'visibility';
   }
 });
});

