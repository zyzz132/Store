$(function () {
    $(".delbtn").click(function () {
        var node=$(this).parent().parent().find(":first").text();

        //询问框
        layer.confirm('您确定要删除该分类？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            var type="delCommClass";
            $.ajax({
                url:'../topic',
                type:'post',
                data:{ClassID:node,prol:type},
                dataType:'text',
                success:function () {
                    layer.msg('已删除', {icon: 1});
                    location.href="commclass.jsp";
                },
                error:function(xhr){alert('php页面有错误！'+xhr.responseText);}

            })

        }, function(){
            // layer.msg('也可以这样', {
            //     time: 20000, //20s后自动关闭
            //     btn: ['明白了', '知道了']
            // });
        });

    })

})