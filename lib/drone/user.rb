module Drone
  class User
    attr_reader :remote, :login, :name, :email, :gravatar, :admin, :active, :created_at, :updated_at, :synced_at

    def initialize(
        remote: nil, login: nil, name: nil, email: nil, gravatar: nil, admin: nil, active: nil, created_at: nil, updated_at: nil, synced_at: nil)
      @remote     = remote
      @login      = login
      @name       = name
      @email      = email
      @gravatar   = gravatar
      @admin      = admin
      @active     = active
      @created_at = created_at
      @updated_at = updated_at
      @synced_at  = synced_at
    end

    def self.build_with_hash(hash)
      User.new(
        remote:     hash["remote"],
        login:      hash["login"],
        name:       hash["name"],
        email:      hash["email"],
        gravatar:   hash["gravatar"],
        admin:      hash["admin"],
        active:     hash["active"],
        created_at: hash["created_at"],
        updated_at: hash["updated_at"],
        synced_at:  hash["synced_at"]
      )
    end
  end
end
