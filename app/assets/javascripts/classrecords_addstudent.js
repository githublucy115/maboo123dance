$(document).ready(function(){
	rows = $('form>table>tbody>tr');
	rows.hide();
	if(rows.length<=0) return;

	$(document).on('change','input.check_boxes',function(){
		row = $(this).closest('tr');
		if($(this).is(':checked')){
			row.appendTo('table.existing>tbody');
			row.toggleClass('add-to');
		}
		else {
			row.appendTo('form table>tbody');
			row.toggleClass('add-to');
		}
	});
});