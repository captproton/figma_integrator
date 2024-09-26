# spec/support/jumpstart_test_helper.rb
module JumpstartTestHelper
  def set_tenant(account)
    ActsAsTenant.current_tenant = account
  end

  def with_tenant(account)
    old_tenant = ActsAsTenant.current_tenant
    ActsAsTenant.current_tenant = account
    yield
  ensure
    ActsAsTenant.current_tenant = old_tenant
  end

  def login_as(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  def logout
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
  end
end
