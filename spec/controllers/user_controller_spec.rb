require 'rails_helper'

describe UsersController, type: :controller do

let(:user) { User.create!(email:"peter@gmail.com", password:"password") }
let(:user2) { User.create!(email:"emailuser2@email.com", password:"newpassword2") }

describe 'GET #show' do
     context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

      context 'when a user is not logged in' do
        it 'redirects to login' do
          get :show, params: { id: user.id }
          expect(response).to redirect_to("http://test.host/")
        end
      end

      context 'when a second user tries to log in on another users page' do
        before do
          sign_in user2
        end

        it 'redirects to root_path' do
          get :show, params: { id: user.id }
          expect(response).to redirect_to(root_path)
        end
      end

  end
end
