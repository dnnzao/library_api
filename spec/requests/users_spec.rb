require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST /auth' do
    context 'with valid parameters' do
      it 'creates user with valid params' do
        expect {
          post :create, FactoryBot.build(:user)
        }

        expect(response.status).to eq(200)
      end
    end

    # test not passing
    context 'with invalid parameters' do
      it 'creates user with invalid params' do
        expect {
          post :create, FactoryBot.build(:user, name: '')
        }
        expect(response.status).to eq(400)
      end
    end
  end
end
