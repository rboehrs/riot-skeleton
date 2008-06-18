<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton - ${currentPage.title}</title>
	<@c.stylesheets [
		"/style/yui.reset.css",
		"/style/grid.css",
		"/style/main_" + currentSite.theme + ".css"
	] />
	<@inplace.callbacks>
		function onRiotToolbarClick(button) {
			if (button == 'browse') {
				Shadowbox.setup();
			}
			else {
				Shadowbox.clearCache();
				$$('.gallery-image').each(function(el) {delete el.shadowboxCacheKey});
			}
		} 
	</@inplace.callbacks>

	<#--
	  - NOTE: Though the Riot toolbar uses prototype.js and scriptaculous 
	  - internally you don't have to load these libraries manually, unless
	  - you want to use either Txt2Img or Shadowbox. 
	  -->

    <@c.txt2img loadPrototype=true />

	<#-- Shadowbox (see http://mjijackson.com/shadowbox) -->
	<link href="${c.resource('/style/shadowbox/css/shadowbox.css')}" rel="stylesheet" type="text/css" media="screen" />
	<@riot.script src="scriptaculous/effects.js" />
    <script type="text/javascript" src="${c.resource('/style/shadowbox/js/adapter/shadowbox-prototype.js')}"></script>
    <script type="text/javascript" src="${c.resource('/style/shadowbox/js/shadowbox.js')}"></script>
    <script type="text/javascript">
		document.observe('dom:loaded', function() {
			Shadowbox.init({
				assetURL: '${request.contextPath}/style/shadowbox/',
				fadeDuration: 0.15,
				resizeDuration: 0.15
			})
		});
    </script>
</head>
<body class="${bodyClass!"default"}">
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			<@c.block "header">
				<@c.include "/inc/topnav.html" />
			</@c.block>
		</div>
	</div>
	<div id="wrapper" class="wrapper">
		<div id="content" class="content">
			<div class="padding">
				<@c.block "content">
					<@c.include "/inc/content.html" />
				</@c.block>
			</div>
		</div>
	</div>
	<div id="navigation" class="navigation">
		<div class="padding">
			<@c.block "navigation">
				<@c.include "/inc/navigation.html" />
			</@c.block>
		</div>
	</div>
	<#if bodyClass! != "wide">
		<div id="extra" class="extra">
			<div class="padding">
				<@c.block "extra">
					<@c.include "/inc/extra.html" />
				</@c.block>
			</div>
		</div>
	</#if>
	<div id="footer" class="footer">
		<div class="padding">
			<span class="poweredby">Powered by</span><span class="riot">Riot</span>
		</div>
	</div>
</div>

<#if currentSite.googleAnalyticsCode??>
	<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		var pageTracker = _gat._getTracker("${currentSite.googleAnalyticsCode}");
		pageTracker._initData();
		pageTracker._trackPageview();
	</script>
</#if>

<@inplace.toolbar />
</body>
</html>
