module StreamAPI
  class Embed

    def self.to_html(private_host_id, public_host_id, site_id, theme)
      embed_code = <<-EOF
      <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
      codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" 
      width="#{theme['width']}" height="#{theme['height']}" id="liveStream" align="">
      <PARAM name="movie" value="http://static.streamapi.com/flash/loader.swf?app=custom.swf&1247246891974">
      <PARAM name="FlashVars" value="siteID=#{site_id}&publicHostID=#{public_host_id}
      &layoutPath=#{theme['layout_path']}
      &skinPath=#{theme['skin_path']}
      &privateHostID=#{theme['private_host_id']}&userType=host&">
      <PARAM name="allowScriptAccess" value="always">
      <PARAM name="allowFullScreen" value="true">
      <PARAM name="quality" value="high">
      <PARAM name="bgcolor" value="#000000">
      <PARAM name="scale" value="noscale">
      <PARAM name="wmode" value="transparent">
      <embed src="http://static.streamapi.com/flash/loader.swf?app=custom.swf&1247246891974" 
      FlashVars="siteID=#{site_id}&publicHostID=#{public_host_id}
      &layoutPath=#{theme['layout_path']}
      &skinPath=#{theme['skin_path']}
      &privateHostID=#{theme['private_host_id']}&userType=host&" 
      allowScriptAccess="always" allowFullScreen="true" width="#{theme['width']}" height="#{theme['height']}" scale="noscale" 
      wmode="transparent" quality="high" bgcolor="#000000" type="application/x-shockwave-flash" >
      </embed>
      </OBJECT>
          <div id="player_container"></div>

          <script type="text/javascript" 
          	src="http://ajax.googleapis.com/ajax/libs/swfobject/2.1/swfobject.js"></script>

          <script type="text/javascript">
             swfobject.embedSWF("http://static.streamapi.com/flash/loader.swf", "player_container", 
             						"#{theme['width']}", "#{theme['height']}", "9", "", {
                  'app' : 'custom.swf',
                  'siteID' : '#{site_id}',
                  'publicHostID' : '#{public_host_id}',
                  'layoutPath' : '#{theme['layout_path']}',
                  'skinPath' : '#{theme['skin_path']}',
                  'privateHostID' : '#{theme['private_host_id']}',
                  'userType' : 'host'
              }, {
                  allowfullscreen: "true",
                  allowscriptaccess: "true"
              });
          </script type="text/javascript">
      EOF
      
      embed_code
    end

  end
end
