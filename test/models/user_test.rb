require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test 'should be vaild' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end
  end

  test "email addreeses should be unique" do
    # 同じメールアドレスのユーザーは作成させない
    duplicate_user =  @user.dup
    # emailの大文字小文字を区別しないため、upcaseにする
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAmple.Com"
    @user.email =  mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
