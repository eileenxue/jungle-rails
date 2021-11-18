require 'rails_helper'

RSpec.feature "Visitor navigates to product details from the home page", type: :feature, js: true do

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

  scenario "They see the product details" do
    
    # Start from the homepage
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    # Get the product name and click on it
    find('.product header a', match: :first).click
    expect(page).to have_css '.products-show'

    # save_screenshot
    
  end

end