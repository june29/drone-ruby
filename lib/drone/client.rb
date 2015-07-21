require "httpclient"
require "json"
require "time"

module Drone
  class Client
    DEFAULT_HOST = "drone.io"
    USER_AGENT   = "#{self}/#{VERSION}"

    attr_accessor :http

    def initialize(host: nil, access_token: nil)
      @host         = host || DEFAULT_HOST
      @access_token = access_token

      @http = HTTPClient.new
      @http.agent_name = USER_AGENT
    end

    def user
      url = "https://#{@host}/api/user"

      response = get_json(url)
      User.build_with_hash(response)
    end

    def repository(path)
      url = "#{base_url}/repos/#{path}"

      response = get_json(url)
      Repository.build_with_hash(response)
    end

    def commits(repos: nil)
      url = "#{base_url}/repos/#{repos.path}/commits"

      response = get_json(url)
      response.map { |commit| Commit.build_with_hash(commit) }
    end

    def rebuild(repos: nil, branch: nil, commit: nil)
      url = "#{base_url}/repos/#{repos.path}/branches/#{branch}/commits/#{commit.sha}"

      post(url)
    end

    def console(repos: nil, branch: nil, commit: nil)
      url = "#{base_url}/repos/#{repos.path}/branches/#{branch}/commits/#{commit.sha}/console"
      get(url)
    end

    private

    def base_url
      "https://#{@host}/api"
    end

    def get(url)
      @http.get(url, access_token: @access_token).body
    end

    def get_json(url)
      JSON.parse(@http.get(url, access_token: @access_token).body)
    end

    def post(url)
      @http.post(url, access_token: @access_token)
    end
  end
end
