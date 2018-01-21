var edit = function(idNumber) {
       
 $idNumber = idNumber;
 
 $switch0 = '#e' + $idNumber;
 $( $switch0 ).addClass( "hidden" );
 
  $switch1 = '#ee' + $idNumber;
 $( $switch1 ).addClass( "hidden" );
 
 $switch2 = '.edit-btn';
 $( $switch2 ).addClass( "hidden" );
 
 $id = '#' + $idNumber;
 $( $id ).removeClass( "hidden" );
 
  $('.click2edit').summernote({
      focus: true,
      toolbar: [
            ['style', ['style']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['insert', ['elfinder', 'link', 'video', 'hr', 'readmore']],
            ['view', ['fullscreen', 'codeview']],
            ['help', ['help']]
        ]
      
});


};

var cancel = function(idNumber) {
    $idNumber = idNumber;
  $('.click2edit').summernote('code');
  $('.click2edit').summernote('destroy');
  
 
 $switch0 = '#e' + $idNumber;
 $( $switch0 ).removeClass( "hidden" );
 
  $switch1 = '#ee' + $idNumber;
 $( $switch1 ).removeClass( "hidden" );
 
  $switch2 = '.edit-btn';
 $( $switch2 ).removeClass( "hidden" );
 
 $id = '#' + $idNumber;
 $( $id ).addClass( "hidden" );
  
 
  $( "body" ).find( "div.article" ).removeClass( "click2edit" );
  
};
