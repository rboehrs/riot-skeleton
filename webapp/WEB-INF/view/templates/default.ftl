<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>
	<link rel="stylesheet" type="text/css" href="${common.resource('/css/' + springMacroRequestContext.theme.name +'.grid.css')}" title="grid01" media="screen" />
	<link rel="stylesheet" type="text/css" href="${common.resource('/css/main.css')}" media="screen" />
	
	<#-- Greybox -->
	<script type="text/javascript">
    	var GB_ROOT_DIR = "${request.contextPath}/greybox/";
	</script>
	<@component.callbacks>
		addRiotEditCallback(function(el) {
    		//alert('ComponentList updated: ' + el.componentList.id);
	   		GB_SETS = {};decoGreyboxLinks();
    	});
	</@component.callbacks>
	<script type="text/javascript" src="${common.resource('/greybox/AJS.js')}"></script>
    <script type="text/javascript" src="${common.resource('/greybox/AJS_fx.js')}"></script>
    <script type="text/javascript" src="${common.resource('/greybox/gb_scripts.js')}"></script>
    <link href="${common.resource('/greybox/gb_styles.css')}" rel="stylesheet" type="text/css" media="screen" />
    
</head>
<body>
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			<h1>Header</h1>
		</div>
	</div>
	<div id="wrapper" class="wrapper">
		<div id="content" class="content">
			<div class="padding">
				<@common.include content />
			</div>
		</div>
	</div>
	<div id="navigation" class="navigation">
		<div class="padding">
			<@common.include navigation />
		</div>
	</div>
	<div id="extra" class="extra">
		<div class="padding">
			<@common.include extra />
		</div>
	</div>
	<div id="footer" class="footer">
		<div class="padding">
			<form id="themeChooser" action="?" method="get">
				<select name="theme" onchange="this.form.submit()">
					<#list 1..40 as themeIndex>
						<#assign theme = themeIndex?string('00') />
						<option value="${theme}"<#if theme == springMacroRequestContext.theme.name> selected="selected"</#if>>${theme}</option>
					</#list>
				</select>
				<a href="?theme=${(springMacroRequestContext.theme.name?number % theme?number + 1)?string('00')}" rel="nofollow">Next Theme</a>
			</form>
		</div>
	</div>
</div>

<@component.toolbar />
</body>
</html>
