$(document).ready(function(){
	$('input.bagelfilter').keyup(function(){
		rows = $('table.bagelfilter tbody>tr')
		terms = $(this).val()
		console.log([terms])
		console.log(terms=="")
		rows.hide();
		rows.each(function(){
			if(terms!=""){
				if($(this).text().toLowerCase().indexOf(terms)>-1){
					$(this).show();
				}
			}
		});
	});

});