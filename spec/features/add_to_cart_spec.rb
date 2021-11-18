require 'rails_helper'

RSpec.feature "Visitor navigates adds product to cart from home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart changes to 1" do
    
    # Start from the homepage
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    expect(page).to have_content('My Cart (0)')

    # Add the first product to cart
    click_on 'Add', match: :first

    # Expect cart to change
    expect(page).to have_content('My Cart (1)')

    # save_screenshot
    
  end

end