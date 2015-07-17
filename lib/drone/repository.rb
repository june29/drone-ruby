module Drone
  class Repository
    attr_reader :remote, :host, :owner, :name, :url, :clone_url, :git_url, :ssh_url, :active, :private, :privileged, :post_commits, :pull_requests, :timeout, :created_at, :updated_at

    def initialize(
        remote: nil, host: nil, owner: nil, name: nil,
        url: nil, clone_url: nil, git_url: nil, ssh_url: nil,
        active: nil, private: nil, privileged: nil, post_commits: nil, pull_requests: nil,
        timeout: nil, created_at: nil, updated_at: nil)
      @remote        = remote
      @host          = host
      @owner         = owner
      @name          = name
      @url           = url
      @clone_url     = clone_url
      @git_url       = git_url
      @ssh_url       = ssh_url
      @active        = active
      @private       = private
      @privileged    = privileged
      @post_commits  = post_commits
      @pull_requests = pull_requests
      @timeout       = timeout
      @created_at    = created_at
      @updated_at    = updated_at
    end

    def path
      [@host, @owner, @name].join("/")
    end

    def self.build_with_hash(hash)
      Repository.new(
        remote:         hash["remote"],
        host:           hash["host"],
        owner:          hash["owner"],
        name:           hash["name"],
        url:            hash["url"],
        clone_url:      hash["clone_url"],
        git_url:        hash["git_url"],
        ssh_url:        hash["ssh_url"],
        active:         hash["active"],
        private:        hash["private"],
        privileged:     hash["privileged"],
        post_commits:   hash["post_commits"],
        pull_requests:  hash["pull_requests"],
        timeout:        hash["timeout"],
        created_at:     hash["created_at"],
        updated_at:     hash["updated_at"]
      )
    end
  end
end
