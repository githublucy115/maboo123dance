$(document).ready(function(){
	$('input.bagelfilter').keyup(function(){
		rows = $('table.bagelfilter tbody>tr')
		terms = $(this).val()
		if(terms == "") {
			rows.show();
			return;
		}
		rows.each(function(){
			if($(this).text().toLowerCase().indexOf(terms)>-1){
				$(this).show();
			}
			else {
				$(this).hide();
			}
		});
	});

});