$(document).ready(function(){
	rows = $('form>table>tbody>tr');
	rows.hide();
	if(rows.length<=0) return;

	$(document).on('change','input.check_boxes',function(){
		row = $(this).closest('tr');
		row.toggleClass('add-to');
		if($('table.existing').size()>0){
			if($(this).is(':checked')){
				row.appendTo('table.existing>tbody');
			}
			else {
				row.appendTo('form table>tbody');
			}
		}
	});
});