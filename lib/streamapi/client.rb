# Ruby wrapper to access StreamAPI definitions API. Has dependency on HTTParty gem.
# No exception handling or other niceties. Intended as an API demo, not meant for production use
# Based on Wordnik Ruby api client
module StreamAPI
  class ApiNotFoundError < StandardError
  end

  class ApiServerError < StandardError
  end

  class InvalidApiKeyError < StandardError
  end

  class InvalidAuthTokenError < StandardError
  end
  

	URL = 'http://api.streamapi.com/service'
	TIMEOUT = 30
	DEBUG = false
	
  class Client
    include HTTParty
    base_uri URL

    attr_accessor :api_key, :secret_key, :site_id, :site_user_id, :username, :timeout, :debug

    def initialize(options={}) 
      raise(InvalidApiKeyError, "Missing api_key!") if options[:api_key].nil?
      raise(InvalidSecretKeyError, "Missing secret_key!") if options[:secret_key].nil?
      raise(InvalidSiteIdError, "Missing site_id!") if options[:site_id].nil?

      @api_key = options[:api_key]
      @@api_key = @api_key
      @secret_key = options[:secret_key]
      @site_id = options[:site_id]
      @username = options[:username] if options.has_key?('username')

      return self
    end

    def get_public_host_id(private_host_id = nil, site_user_id = nil)
      response = self.class.get("/host/id/public", :query => 
          preprocess_options({:private_host_id=>private_host_id,:site_user_id=>site_user_id}))
    end

    def get_private_host_id(public_host_id = nil)
      response = self.class.get("/host/id/private", :query => preprocess_options({:public_host_id=>public_host_id}))
    end

    def create_session(username = nil, fme_key = nil, is_video_private = nil, public_host_id = nil, site_user_id = nil)
      response = self.class.post("/session/create", :query=>preprocess_options({:username=>username,
         :is_video_private=>is_video_private, :public_host_id=>public_host_id, :site_user_id=>site_user_id}))
    end

    def create_user(username)
      response = self.class.post("/session/create", :query => preprocess_options({:username => username}))
    end

    def get_live_session_status(public_host_id)
      response = self.class.post("/session/live", :query => preprocess_options({:public_host_id => public_host_id}))
    end

    def list_recorded_videos()
      recorded_videos = []
      response = self.class.get("/video/list", :query => preprocess_options)
      # iterate videos
    end

    def list_themes()
      themes = []
      response = self.class.get("/theme/list", :query => preprocess_options)
    end

    def list_live_sessions()
      live_sessions = []
      response = self.class.get("/session/live/list", :query => preprocess_options)
    end  

    def preprocess_options(options=nil)
     options = {} if options = {} || options.nil?
     options['key'] = self.api_key
     rid = (Time.now.to_f * 1000).ceil
     options['site_user_id'] = self.site_user_id if self.site_user_id
     options['username'] = self.username if self.username
     options['sig'] = Client.sign(options,self.secret_key, rid)
     options['rid'] = rid
     options
    end

    def self.sign(options,secret,rid)
      options.delete_if{ options.has_key?('sig') }
      Digest::MD5.hexdigest(options.sort().collect{|v| v[1]}.join+secret+rid.to_s)
    end
  end
end