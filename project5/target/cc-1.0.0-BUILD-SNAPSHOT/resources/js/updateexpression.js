$(document).ready(function () {
    $("#insertmodal").click(function () {
        $('#name').val($('#insertname'));
        $('#genre').val($('#insertgenre'));
        $('#squarespaceModal2').modal('show');
    });
});