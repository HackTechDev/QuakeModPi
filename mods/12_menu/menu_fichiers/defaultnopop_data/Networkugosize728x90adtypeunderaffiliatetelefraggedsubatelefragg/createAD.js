var obId="ad_" + crtWidth + 'x' + crtHeight;

var flashinstalled = 0;
var flashversion = 0;
MSDetect = "false";
if (navigator.plugins && navigator.plugins.length)
{
	x = navigator.plugins["Shockwave Flash"];
	if (x)
	{
		flashinstalled = 2;
		if (x.description)
		{
			y = x.description;
			flashversion = y.charAt(y.indexOf('.')-1);
		}
	}
	else
		flashinstalled = 1;
	if (navigator.plugins["Shockwave Flash 2.0"])
	{
		flashinstalled = 2;
		flashversion = 2;
	}
}
else if (navigator.mimeTypes && navigator.mimeTypes.length)
{
	x = navigator.mimeTypes['application/x-shockwave-flash'];
	if (x && x.enabledPlugin)
		flashinstalled = 2;
	else
		flashinstalled = 1;
}
else
	MSDetect = "true";




	document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');

		document.write('on error resume next \n');


		document.write('If MSDetect = "true" Then \n');
			document.write('For i = 2 to 9 \n');
			
				document.write('If Not(IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & i))) Then \n');

				document.write('Else \n');
					document.write('flashinstalled = 2 \n');
					document.write('flashversion = i \n');
				document.write('End If \n');
			document.write('Next \n');
			document.write('If flashinstalled = 0 Then \n');
				document.write('flashinstalled = 1 \n');
			document.write('End If \n');
		document.write('End If \n');

	document.write('</SCR' + 'IPT\> \n');








if (flashinstalled == 2)
	{
		if (flashversion)
			{

				//document.write("You have Flash version " + flashversion + " installed.");

			
				document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"  id='+ obId +' width='+ crtWidth + ' height='+ crtHeight + '>');
				document.write('<param name="movie" value="' + swfSrc +'?clickTag=' + tracker + '' + clickThru + '"><param name="quality" value="high"><param name="wmode" value="transparent">');
				document.write('<embed src="' + swfSrc + '?clickTag=' + tracker + '' + clickThru + '" quality="high" wmode="transparent" swLiveConnect=false width='+ crtWidth + '  height='+ crtHeight + ' type="application/x-shockwave-flash" pluginspace="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">');
				document.write('</embed>');
				document.write('</object>');

		}

		else
		{

			//document.write("You have Flash installed, but I can't detect the version.");
			document.write('<a href="http://mediamgr.ugo.com/event.ng/Type%3dclick%26FlightID%3d$FlightID$%26AdID%3d$AdID$%26TargetID%3d$TargetID$%26Segments%3d%26Targets%3d%26Values%3d$Values$%26RawValues%3d$RawValues$%26Redirect%3d'+ clickThru +'" target="_new" ><img src="' + defSrc + '" width='+ crtWidth + 'height='+ crtHeight +' border="0"></a>');
		}			
	}
	
	else
		if (flashinstalled == 1)
		{
			//document.write("You don't have Flash installed.");
			document.write('<a href="http://mediamgr.ugo.com/event.ng/Type%3dclick%26FlightID%3d$FlightID$%26AdID%3d$AdID$%26TargetID%3d$TargetID$%26Segments%3d%26Targets%3d%26Values%3d$Values$%26RawValues%3d$RawValues$%26Redirect%3d'+ clickThru +'" target="_new" ><img src="' + defSrc + '" width='+ crtWidth + 'height='+ crtHeight +' border="0"></a>');
		}
		else
		{
			//document.write("I can't find out if you have Flash installed.");
			document.write('<a href="http://mediamgr.ugo.com/event.ng/Type%3dclick%26FlightID%3d$FlightID$%26AdID%3d$AdID$%26TargetID%3d$TargetID$%26Segments%3d%26Targets%3d%26Values%3d$Values$%26RawValues%3d$RawValues$%26Redirect%3d'+ clickThru +'" target="_new" ><img src="' + defSrc + '" width='+ crtWidth + 'height='+ crtHeight +' border="0"></a>');
		}
