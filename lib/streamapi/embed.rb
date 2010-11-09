module StreamAPI
  class Embed

    def self.to_html(private_host_id, public_host_id, site_id, theme)
      embed_code = <<-EOF
        <embed 
      		height="#{theme['height'] }" 
      		width="#{theme['width'] }" 
      		wmode="" 
      		type="application/x-shockwave-flash" 
      		bgcolor="#000000" 
      		quality="high" 
      		scale="noscale" 
      		allowfullscreen="true" 
      		allowscriptaccess="always" 
      		flashvars=
      		"authField2Label=Display Name:
      		&authField1Label=UserName:
      		&siteID=#{site_id}
      		&layoutPath=#{theme['layout_path']}
      		&skinPath=#{theme['skin_path']}
      		&publicHostID=#{public_host_id}
      		&privateHostID=#{private_host_id}
      		&authType=key
      		&userType=204&" 
      		src="http://static.streamapi.com/flash/loader.swf?app=custom.swf" />
      EOF
      
      embed_code
    end

  end
end
