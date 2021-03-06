module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:admin) # Using factory girl as an example
      admin.confirmed_at = Time.zone.now
      admin.save
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirmed_at = Time.zone.now
      user.save
      sign_in user
    end
  end
end
