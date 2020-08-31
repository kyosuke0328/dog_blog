$(function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#member_img_prev').attr('src', e.target.result);
      }
      //console.log(input.files[0])
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#member_image").change(function(){
    readURL(this);
  });
});