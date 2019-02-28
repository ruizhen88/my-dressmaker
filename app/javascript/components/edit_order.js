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

  $('#save').click(function(){
    $('#save').toggleClass('hidden');
    $('.msg-profile-container textarea').each(function(){
      var content = $(this).val();//.replace(/\n/g,"<br>");
      // console.log(content);
      $(this).parent().html(content);
      // $(this).contents().unwrap();
    });

    $('#edit').show();
  });

  // send ajax request to controller
  // $.ajax({
  //     type: "POST",
  //     dataType: "script",
  //     url: '/resources/35',
  //     contentType: 'application/json',
  //     data: JSON.stringify({ resource:{pos_y:45,pos_x:50}, _method:'put' })
  // }).done(function( msg )
  //         {
  //             alert( "Data Saved" );
  //         });
};

export { editOrder };
