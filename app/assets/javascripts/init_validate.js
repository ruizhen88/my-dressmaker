$(document).on('shown.bs.modal', function() {
  console.log("this getiting before?")
  $('form[data-client-side-validations]').enableClientSideValidations();
  console.log("this getiting after?")
})
