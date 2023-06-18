require 'rails_helper'

RSpec.describe "Negotiations", type: :system do
  let!(:client) { FactoryBot.create(:client) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:sales_user) { FactoryBot.create(:sales_user) }
  let!(:developer_user) { FactoryBot.create(:developer_user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:product) { FactoryBot.create(:product, client: client, category: category,user: user ,application_status: 2) }
  let!(:negotiation) { FactoryBot.create(:negotiation, user: sales_user, product: product) }
  let!(:result) { FactoryBot.create(:result, user: developer_user, negotiation: negotiation) }

  describe "モデルのCRUD機能に対するテスト" do
    before do
      visit new_user_session_path
      fill_in "Eメール", with: "test_admin@example.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      click_link "商品情報一覧"
    end

    describe "#create" do
      context "必要な情報が全て入力された場合" do
        it "商談情報の登録ができる" do
          click_link "詳細", match: :first
          select "2023", from: "negotiation[negotiate_at(1i)]"
          select "7月", from: "negotiation[negotiate_at(2i)]"
          select "1", from: "negotiation[negotiate_at(3i)]"
          fill_in "商品名", with: "テスト"
          fill_in "店頭価格（税抜）", with: "100"
          fill_in "先方卸値（税抜）", with: "100"
          fill_in "商品説明", with: "テスト"
          click_button "登録"
          expect(page).to have_content "テスト"
        end
      end
    end

    describe "#update" do
      context "既存の開発依頼を編集した場合" do
        it "更新した内容の登録ができる" do
          click_link "詳細", match: :first
          click_link "編集"
          fill_in "想定商品名", with: "テスト２"
          fill_in "想定店頭価格（税抜）", with: "200"
          fill_in "想定先方卸値（税抜）", with: "200"
          select "2024", from: "product[start_on(1i)]"
          select "10月", from: "product[start_on(2i)]"
          select "2", from: "product[start_on(3i)]"
          fill_in "導入期間", with: "２ヶ月"
          fill_in "製造予定数", with: "200"
          fill_in "導入目的", with: "テスト２"
          fill_in "コンセプト", with: "テスト２"
          click_button "更新"
          expect(page).to have_content "開発依頼を更新しました"
        end
      end
    end

  #   describe "#destroy" do
  #     context "既存の開発依頼の削除ボタンを押した場合" do
  #       it "開発依頼の削除ができる" do
  #         click_link "詳細", match: :first
  #         click_link "削除"
  #         expect(page.accept_confirm).to eq "本当に削除しますか？"
  #         expect(page).to have_content "開発依頼を削除しました"
  #       end
  #     end
  #   end
  end

  # describe "アクセス制限に関するテスト" do
  # end
end
