require 'rails_helper'

RSpec.describe "Results", type: :system do
  let!(:client) { FactoryBot.create(:client) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:sales_user) { FactoryBot.create(:sales_user) }
  let!(:developer_user) { FactoryBot.create(:developer_user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:product) { FactoryBot.create(:product, client: client, category: category, user: user, application_status: 2) }
  let!(:negotiation) { FactoryBot.create(:negotiation, user: sales_user, product: product) }
  let!(:negotiation2) { FactoryBot.create(:negotiation, user: sales_user, product: product) }
  let!(:result) { FactoryBot.create(:result, user: developer_user, negotiation: negotiation) }

  describe "モデルのCRUD機能に対するテスト" do
    before do
      visit new_user_session_path
      fill_in "Eメール", with: "test_admin@example.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      click_link "商品情報一覧"
      click_link "詳細", match: :first
    end

    describe "#create" do
      context "必要な情報が全て入力された場合" do
        it "商談結果の登録ができる" do
          fill_in "商談結果", with: "テスト"
          page.all("input[type=submit]")[2].click
          expect(page).to have_content "テスト"
        end
      end
    end

    describe "#update" do
    let!(:result) { FactoryBot.create(:result, user: developer_user, negotiation: negotiation) }
      context "既存の商談結果を編集した場合" do
        it "更新した内容の登録ができる" do
          
          click_link "result_edit", match: :first
          fill_in "商談結果", with: "テスト２"
          page.all("input[type=submit]")[3].click
          expect(page).to have_content "テスト２"
        end
      end
    end
  end

  describe "アクセス制限に関するテスト" do
    describe "営業のアクセス制限の確認" do
      before do
        visit new_user_session_path
        fill_in "Eメール", with: "test_sales@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        click_link "商品情報一覧"
        click_link "詳細", match: :first
      end

      context "営業が商談結果の詳細ページに飛んだ場合" do
        it "商談結果の登録フォームが表示される" do
          expect(page).to have_css "#result_content"
        end

        it "商談結果の編集ボタンが表示される" do
          expect(page).to have_link("result_edit")
        end
      end
    end

    describe "開発のアクセス制限の確認" do
      before do
        visit new_user_session_path
        fill_in "Eメール", with: "test_developer@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        click_link "商品情報一覧"
        click_link "詳細", match: :first
      end

      context "開発が商談結果の詳細ページに飛んだ場合" do
        it "商談結果の登録フォームが表示されない" do
          expect(page).not_to have_css "#result_content"
        end

        it "商談結果の編集ボタンが表示されない" do
          expect(page).not_to have_link("result_edit")
        end
      end
    end
  end
end
