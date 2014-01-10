<!DOCTYPE html>
{%* 使用html插件替换普通html标签，同时注册JS组件化库 *%}
{%html framework="index:static/mod.js" class="expanded"%}
    {%* 使用head插件替换head标签，主要为控制加载同步静态资源使用 *%}
	{%head%}
	    <meta charset="utf-8"/>
    	<meta content="{%$description%}" name="description">
    	<title>demo</title>
    	{%require name="index:static/mod.js"%}
    	{%require name="index:static/lazyload.js"%}
		{%require name="index:static/BigPipe-websql.js"%}
	{%/head%}
	{%body%}
		{%widget name="index:widget/a/a.tpl"%}
		{%widget name="index:widget/b/b.tpl" mode="quickling" pagelet_id="b_wrapper" group="a"%}
		<div>dddd</div>
		{%widget name="index:widget/c/c.tpl" mode="quickling" pagelet_id="c_wrapper"  group="a"%}
		<div>dddd</div>
		{%widget name="index:widget/d/d.tpl" mode="quickling" pagelet_id="d_wrapper"  group="a"%}
		<div>
			<button type="button" id="asyncLoad">Async Load</button>
		</div>
		{%script%}
            window.onload = function() {
                var elms = document.getElementsByClassName('g_fis_bigrender');
                for (var i = 0, len = elms.length; i < len; i++) {
                    window['eval'] && window['eval'](elms[i].innerHTML);
                }
            };
		{%/script%}
	{%/body%}
{%/html%}