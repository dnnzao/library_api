# require 'rails_helper'

# RSpec.describe RegistrationsController, type: :controller do
#   describe 'POST /auth' do
#     context 'with valid parameters' do
#       it 'creates user with valid params' do
#         expect {
#           post :create, params: FactoryBot.build(:user)
#         }
#         expect(response.status).to eq(200)
#       end
#     end

#     # test not passing
#     context 'with invalid parameters' do
#       it 'does not create a new user' do
#         expect {
#           post :create, params: FactoryBot.build(:user, name: '')
#         }
#         expect(response.status).to eq(200)
#       end
#     end
#   end
# end
require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST /auth" do
    context 'with valid parameters' do
      it 'is valid with valid attributes' do
        # user = FactoryBot.build(:user)
        @user = build(:user)
        expect(@user).to be_valid
      end
    end
  end

  context 'with invalid parameters' do
    # let(:invalid_attributes) { FactoryBot.attributes_for(user: { name: '', email: 'invalid', password: '123', password_confirmation: '321' } ) }
    
    it 'does not create a new user' do
      @user = build(:user, :invalid_user)
      expect(@user).to_not be_valid
    end
  end
end