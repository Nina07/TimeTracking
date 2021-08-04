require "test_helper"

class RoleTest < ActiveSupport::TestCase
  test "save a new role" do
    role = Role.new
    assert role.save
  end
end
