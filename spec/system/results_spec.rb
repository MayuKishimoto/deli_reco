require 'rails_helper'

RSpec.describe "Results", type: :system do
  let!(:client) { FactoryBot.create(:client) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:sales_user) { FactoryBot.create(:sales_user) }
  let!(:developer_user) { FactoryBot.create(:developer_user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:product) { FactoryBot.create(:product, client: client, category: category,user: user) }
  let!(:negotiation) { FactoryBot.create(:negotiation, user: sales_user, product: product) }
  let!(:result) { FactoryBot.create(:result, user: developer_user, negotiation: negotiation) }

  before do
    driven_by(:rack_test)
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
