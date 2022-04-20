console.log()
function handleFileSelect(event) {
    var input = this;
    console.log(input.files)
    if (input.files && input.files.length) {
        var reader = new FileReader();
        this.enabled = false
        reader.onload = (function (e) {
        console.log(e)
            $("#preview").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''));
            $("#preview").css('display','block');
            $(".file-edit-icon").css('display','block');
        });
        reader.readAsDataURL(input.files[0]);
    }
}
$('#file').change(handleFileSelect);
$('.file-edit-icon').on('click', '.preview-de', function () {
    $("#preview").css('display','none');
    $(".file-edit-icon").css('display','none');
    $("#preview").empty()
    $("#file").val("");
});
$('.preview-edit').click( function() {
  $("#file").click();
} );