import 'jquery';

const initValidate = () => {
  $(document).on('shown.bs.modal', function() {
    console.log('shown')
    $('form[data-client-side-validations]').enableClientSideValidations();
  })
}

export { initValidate }
