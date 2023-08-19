module ControllerMacros
  def login_user
    before(:each) do
      # Init roles
      admin = FactoryBot.create(:role, :admin)
      teacher = FactoryBot.create(:role, :teacher)
      student = FactoryBot.create(:role, :student)

      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
