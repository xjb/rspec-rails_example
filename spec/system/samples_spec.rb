require 'rails_helper'

RSpec.describe "Samples", type: :system do
  it 'root page has "welcome" text' do
    visit '/'
    expect(page).to have_content 'welcome'
  end

  it 'root page has "welcome" text js', js: true do
    visit '/'
    expect(page).to have_content 'welcome'
  end
end
