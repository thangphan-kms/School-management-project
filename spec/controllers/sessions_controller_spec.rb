require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns a success response" do
      puts "response :>> #{response}"
      expect(response).to be_successful
    end
  end
end
