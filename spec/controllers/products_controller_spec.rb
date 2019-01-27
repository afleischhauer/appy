require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do
    it 'renders products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders products page' do
      get :show, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    before do
      sign_in@user
    end
    it 'redirects to new product page' do
      get :new, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe 'GET #edit' do
    before do
      sign_in@user
    end
    it 'redirects to edit product page' do
      get :edit, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe 'POST #create' do
    before do
      sign_in@user
    end
    it 'creates a new product' do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    it 'cannot create new product' do
      expect(Product.new).not_to be_valid
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in@user
      @product = FactoryBot.create(:product)
    end
    it 'updates product' do
      article_params = FactoryBot.attributes_for(:product)
      expect{ patch :update, params: {id: @product.id, product: article_params }
      }.to change(Product,:count).by(0)
      expect(flash[:notice]).to eq 'Product was successfully updated.'
    end
  end

  describe 'DElETE #destroy' do
    before do
      sign_in@user
      @product = FactoryBot.create(:product)
    end
    it 'deletes product' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_url
    end
  end


  end
