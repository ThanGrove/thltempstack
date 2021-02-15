
/* From new me.php */
(function($) {
    console.log("in custom script");
    $(document).ready(function() {
        console.log("adding listener");
        $('#showbtn').click(function() {
            $('#dataspace, .sponsor').toggleClass('hide'); // shows dataspace and hides sponsor
            var butntxt = ($('#dataspace').hasClass('hide')) ? 'Show Me' : 'Get Rid of it!';
            $('#showbtn').val(butntxt);
        });
    });
})(jQuery);