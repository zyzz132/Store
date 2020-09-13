$(function () {
    $("#commclassA").change(function () {
        var st=$(this).val();
        alert(st);
    })
});
function selectCH(val) {
    // $("select[name='nodeClass']").children().gt(1).remove();
    if(val>0){
        $.ajax({
            url:'../req/reqCommClass.jsp',
            type:'post',
            data:{id:val,prol:'chx'},
            dataType:'text',
            success:function (rst) {
                $(".selectB").html(rst);
                alert(rst);
            },
            error:function(xhr){alert('php页面有错误！'+xhr.responseText);}
        })
    }
}