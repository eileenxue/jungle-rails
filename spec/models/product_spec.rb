require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # Initial example to ensure that a product with all four fields set will indeed save successfully
    it 'should create a new product when all four fields are included' do
      @category = Category.new(name: 'testagory')
      @product = Product.new(
        name: 'Test product',
        price: 45.99,
        quantity: 4,
        category: @category
      )
      # puts @product.inspect
      expect(@product).to be_valid
    end

    # 1. Validates that the product contains a name
    it 'should not be valid without a name' do
      @category = Category.new(name: 'testagory')
      @product = Product.new(
        name: nil,
        price: 45.99,
        quantity: 4,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

    #2. Validates that the product contains a price
    it 'should not be valid without a price' do
      @category = Category.new(name: 'testagory')
      @product = Product.new(
        name: 'Test product',
        price: nil,
        quantity: 4,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

    #3. Validates that the product contains a quantity number
    it 'should not be valid without quantity' do
      @category = Category.new(name: 'testagory')
      @product = Product.new(
        name: 'Test product',
        price: 45.99,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    #4 Validates that the product contains a category
    it 'should not be valid without a category' do
      @category = Category.new(name: 'testagory')
      @product = Product.new(
        name: 'Test product',
        price: 45.99,
        quantity: 4,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
  end
end
