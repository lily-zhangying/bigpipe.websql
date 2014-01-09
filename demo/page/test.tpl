<!DOCTYPE html>
{%* 使用html插件替换普通html标签，同时注册JS组件化库 *%}
{%html framework="index:static/mod.js" class="expanded"%}
    {%* 使用head插件替换head标签，主要为控制加载同步静态资源使用 *%}
	{%head%}
	    <meta charset="utf-8"/>
    	<meta content="{%$description%}" name="description">
    	<title>demo</title>
    	{%require name="index:static/mod.js"%}
    	
		{%require name="index:static/jquery.js"%}
		{%require name="index:static/test.js"%}
	{%/head%}
	{%body%}	
		{%widget name="index:widget/a/a.tpl"%}
		{%widget name="index:widget/b/b.tpl"%}
		{%widget name="index:widget/c/c.tpl"%}
		{%widget name="index:widget/d/d.tpl"%}
		<div>
			<button type="button" id="asyncLoad">Async Load</button>
		</div>
		{%script%}
			$("#asyncLoad").click(function(e){
				var elms = document.getElementsByClassName('g_fis_bigrender');

				Websql.getItem("hash2", function(err, r){
					if(err){
						console.log('get succ');
						console.log(err);
					}else{
						console.log('get');
						console.log(r);
					}
				});

			
				e.preventDefault();
			});
		{%/script%}
	{%/body%}
{%/html%}