// jQuery: $() equals to document.querySelector
const editOrder = () => {

  $('#edit').click(function(){
    $('#save').toggleClass('hidden');
    $('#edit').hide();
    $('td').each(function(){
      var content = $(this).html();
      $(this).html('<textarea rows="1">' + content + '</textarea>');
    });
    $('.info').fadeIn('fast');
  });

  // actions triggered upon click "save"
  $('#save').click(function(){
    $('#save').toggleClass('hidden');
    $('.msg-profile-container textarea').each(function(){
      var content = $(this).val();//.replace(/\n/g,"<br>");
      // console.log(content);
      $(this).parent().html(content);
      // $(this).contents().unwrap();
    });
    $('#edit').show();

    // gather all the order data into json
    const order = {
      order: {
        completion_date: $('#order-date').text(),
        order_details: $('#order-details').text(),
        dimension_chest: $('#order-chest').text(),
        dimension_waist: $('#order-waist').text(),
        dimension_hips: $('#order-hips').text(),
        dimension_length: $('#order-length').text(),
        price: $('#order-price').text()
      }
    };

    // send ajax request to controller
    const orderId = $(this).data('order-id')
    const patchOrder = (order) => {
      // console.log('order sent')
      // console.log(order)
      const url = `/orders/${orderId}.json`;
      fetch(url, {
        method: 'PATCH',
        headers: {
          "Content-Type": "application/json",
          // authenticity token
          'X-CSRF-Token': Rails.csrfToken()
        },
        body: JSON.stringify(order)
      }).then(response => response.json())
        .then((data) => {
          if(data.status === 'ok') {
            alert('Your change is successfully saved!')
            location.reload();
            // create a fake HTML message box with new change
          }
        });
    };

    patchOrder(order);
  });
  // end of save.click
};

export { editOrder };
