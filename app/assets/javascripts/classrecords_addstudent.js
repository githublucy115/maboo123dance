$(document).ready(function(){
	rows = $('table.existing');
	if(rows.length<=0) return;
	$('input.check_boxes').attr('checked',false);

	$(document).on('change','input.check_boxes',function(){
		row = $(this).closest('tr');
		row.toggleClass('add-to');
		if($('table.existing').size()>0){
			if($(this).is(':checked')){
				row.appendTo('table.existing>tbody');
			}
			else {
				row.appendTo('table.bagelfilter>tbody');
				
			}
		}
	});
});
