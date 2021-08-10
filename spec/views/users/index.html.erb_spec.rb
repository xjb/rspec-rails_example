require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, 2.times.map { create(:user) })
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: /@/, count: 2
    assert_select "tr>td", text: /\S+\s\S+/, count: 2
  end
end
