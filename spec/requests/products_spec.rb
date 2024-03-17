require 'rails_helper'
require 'support/auth_helpers'

RSpec.describe "Products", type: :request do
  let(:user) { create(:user) }

  before do
    auth_with_user(user)
  end

  describe "GET /products" do
    let!(:products) { create_list(:product, 10) }

    it "returns all products" do
      get products_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end

  describe "GET /products/:id" do
    let!(:product) { create(:product) }

    it "returns the requested product" do
      get product_path(product)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq(product.id)
    end
  end

  describe "POST /products" do
    let!(:product_params) { { product: { name: "New Product", description: "New description", price: 20.22 } } }

    it "creates a new product" do
      expect {
        post products_path, params: product_params
      }.to change(Product, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH/PUT /products/:id" do
    let!(:product) { create(:product) }
    let!(:updated_params) { { product: { name: "Updated Name" } } }

    it "updates the product" do
      put product_path(product), params: updated_params
      product.reload
      expect(product.name).to eq("Updated Name")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /products/:id" do
    let!(:product) { create(:product) }

    it "deletes the product" do
      expect {
        delete product_path(product)
      }.to change(Product, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end
end