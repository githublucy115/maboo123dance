$(window).load(function(){
	canvas = $('canvas')
	original = canvas.clone(true)
	signaturePad = new SignaturePad(canvas[0]);
	canvas[0].width = $('canvas').parent().width();
});

$(document).on("click","button",function(event){
	$('#signature').val(signaturePad.toDataURL());
});