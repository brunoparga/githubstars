const focusInHandler = (event) => {
  event.currentTarget.classList.remove('tag-input-gray');
  window.localStorage.setItem('suggestion', event.currentTarget.value);
  event.currentTarget.value = '';
};

const focusOutHandler = (event) => {
  event.currentTarget.classList.add('tag-input-gray');
  // This is currently not working as intended: when the user submits the form,
  // the 'focusout' event triggers. If the following line is uncommented, it
  // activates before the submission, setting the form contents to the initial
  // suggestion. So the user cannot really add tags that aren't that one.

  // event.currentTarget.value = window.localStorage.getItem('suggestion');
  window.localStorage.removeItem('suggestion');
};

const addFocusHandlers = (input) => {
  input.addEventListener('focusin', focusInHandler);
  input.addEventListener('focusout', focusOutHandler);
};

const activateInputs = (inputs) => {
  inputs.forEach(input => addFocusHandlers(input));
};

const inputTags = document.querySelectorAll('.tag-input');
activateInputs(inputTags);
