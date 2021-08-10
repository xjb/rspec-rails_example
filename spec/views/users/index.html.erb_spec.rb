require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      create(:user),
      create(:user, email: "Email2")
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: /Email/, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
