<%@ page language="java" contentType="text/html;charset=utf-8"  import="java.sql.*" %>
<body>
	<ul class="layui-nav">
		<li class="layui-nav-item layui-this"><a href="javascript:;">产品</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="">选项1</a>
				</dd>
				<dd>
					<a href="">选项2</a>
				</dd>
				<dd>
					<a href="">选项3</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="">最新活动</a></li>
		<li class="layui-nav-item"><a href="">大数据</a></li>
		<li class="layui-nav-item">
		<li class="layui-nav-item"><a href="">社区</a></li>
	</ul>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>

</body>
