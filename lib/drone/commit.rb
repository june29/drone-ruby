module Drone
  class Commit
    attr_reader :id, :status, :sha, :started_at, :finished_at, :duration, :branch, :pull_request, :message, :author, :gravatar, :timestamp, :created_at, :updated_at

    def initialize(
        id: nil, status: nil, sha: nil,
        started_at: nil, finished_at: nil, duration: nil,
        branch: nil, pull_request: nil, message: nil,
        author: nil, gravatar: nil,
        timestamp: nil, created_at: nil, updated_at: nil)
      @id           = id
      @status       = status
      @sha          = sha
      @started_at   = started_at
      @finished_at  = finished_at
      @duration     = duration
      @branch       = branch
      @pull_request = pull_request
      @message      = message
      @author       = author
      @gravatar     = gravatar
      @timestamp    = timestamp
      @created_at   = created_at
      @updated_at   = updated_at
    end

    def self.build_with_hash(hash)
      Commit.new(
        id:           hash["id"],
        status:       hash["status"],
        sha:          hash["sha"],
        started_at:   hash["started_at"],
        finished_at:  hash["finished_at"],
        duration:     hash["duration"],
        branch:       hash["branch"],
        pull_request: hash["pull_request"],
        message:      hash["message"],
        author:       hash["author"],
        gravatar:     hash["gravatar"],
        timestamp:    Time.parse(hash["timestamp"]),
        created_at:   hash["created_at"],
        updated_at:   hash["updated_at"]
      )
    end
  end
end
