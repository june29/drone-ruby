require_relative "../test_helper"

describe "Drone::Client" do
  before do
    stub_request(:get, %r[https://#{Drone::Client::DEFAULT_HOST}/api/user]).to_return(
      status: 200,
      body: fixture("user_api_response.json")
    )
    stub_request(:get, %r[https://#{Drone::Client::DEFAULT_HOST}/api/repos/.+]).to_return(
      status: 200,
      body: fixture("repository_api_response.json")
    )
    stub_request(:get, %r[https://#{Drone::Client::DEFAULT_HOST}/api/.+/commits]).to_return(
      status: 200,
      body: fixture("commits_api_response.json")
    )
    stub_request(:get, %r[https://#{Drone::Client::DEFAULT_HOST}/api/.+/console]).to_return(
      status: 200,
      body: fixture("console_api_response.txt")
    )

    @client = Drone::Client.new
  end

  it "can get user" do
    @client.user.name.must_equal "Foo Bar"
  end

  it "can get repository" do
    @client.repository("github.com/foo/bar").name.must_equal "bar"
  end

  it "can get commits on target repository" do
    repos = @client.repository("github.com/foo/bar")
    @client.commits(repos: repos).size.must_equal 2
  end

  it "can get console" do
    repos = @client.repository("github.com/foo/bar")
    commits = @client.commits(repos: repos)
    @client.console(repos: repos, branch: "master", commit: commits.first)
      .must_include "$ git clone github.com/drone/drone"
  end
end
