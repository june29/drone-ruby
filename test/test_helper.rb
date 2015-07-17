require_relative "../lib/drone"

require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require "webmock"
include WebMock::API

def fixture(filename)
  File.read(File.join(__dir__, "fixtures", filename))
end
