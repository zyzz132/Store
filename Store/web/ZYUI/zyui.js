$(function(){
	
	zyuiSelect();
})
function zyuiSelect(){
	var $select=$("<div class='ui_select_f' ></div>");
	var $value=$("<p class='ui_select_value'>"+$(".ui_select>select option:selected").text()+"</p>")
	var $ul=$("<ul class='ui_select_option'></ul>")
	$(".ui_select").children().children().each(function(){
		var $node=$("<li value='"+$(this).val()+"'>"+$(this).text()+"</li>")
		$ul.append($node);
	})
	$select.append($value).append($ul);
	
	$(".ui_select").hide().after($select);
	$(".ui_select_value").click(function(e){
		$(this).next().show();
		e.stopPropagation();//
	})
	$(".ui_select_option>li").click(function(){
		$(this).parent().prev().text($(this).text());
		$(this).parent().parent().prev().children().val($(this).val());
		$(this).parent().hide();
	});
	$(document).click(function(e){        
		$(".ui_select_option").hide(); 
	});  
}