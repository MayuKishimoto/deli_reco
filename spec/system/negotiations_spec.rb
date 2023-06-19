require "rails_helper"

RSpec.describe "Negotiations", type: :system do
  let!(:client) { FactoryBot.create(:client) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:sales_user) { FactoryBot.create(:sales_user) }
  let!(:developer_user) { FactoryBot.create(:developer_user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:product) { FactoryBot.create(:product, client: client, category: category, user: user ,application_status: 2) }
  let!(:negotiation) { FactoryBot.create(:negotiation, user: sales_user, product: product) }
  let!(:negotiation2) { FactoryBot.create(:negotiation, user: sales_user, product: product, name: "テスト") }

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
        it "商談情報の登録ができる" do
          select "2023", from: "negotiation[negotiate_at(1i)]"
          select "7月", from: "negotiation[negotiate_at(2i)]"
          select "1", from: "negotiation[negotiate_at(3i)]"
          fill_in "商品名", with: "テスト"
          fill_in "店頭価格（税抜）", with: "100"
          fill_in "先方卸値（税抜）", with: "100"
          fill_in "商品説明", with: "テスト"
          page.all("input[type=submit]")[1].click
          expect(page).to have_content "テスト"
        end
      end
    end

    describe "#update" do
      context "既存の商談情報を編集した場合" do
        it "更新した内容の登録ができる" do
          click_link "negotiation_edit", match: :first
          sleep 0.5
          page.all("#negotiation_name")[1].set("テスト２")
          page.all("#negotiation_selling_price")[1].set(200)
          page.all("#negotiation_wholesale_price")[1].set(200)
          page.all("#negotiation_explanation")[1].set("テスト２")
          page.all("input[type=submit]")[2].click
          expect(page).to have_content "テスト２"
        end
      end
    end

    describe "#destroy" do
      context "既存の商談情報の削除ボタンを押した場合" do
        it "商談情報の削除ができる" do
          click_link "negotiation_delete", match: :first
          expect(page.accept_confirm).to eq "本当に削除しますか？"
          expect(page).not_to have_content "test_negotiation"
        end
      end
    end
  end

  describe "アクセス制限に関するテスト" do
    describe "開発のアクセス制限の確認" do
      before do
        visit new_user_session_path
        fill_in "Eメール", with: "test_developer@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        click_link "商品情報一覧"
        click_link "詳細", match: :first
      end

      context "開発が商談情報の詳細ページに飛んだ場合" do
        it "商談情報の登録フォームが表示される" do
          sleep 0.5
          expect(page).to have_content "商談情報登録"
        end

        it "商談情報の編集ボタンが表示される" do
          sleep 0.5
          expect(page).to have_link("negotiation_edit")
        end

        it "商談情報の削除ボタンが表示される" do
          sleep 0.5
          expect(page).to have_link("negotiation_delete")
        end
      end
    end

    describe "営業のアクセス制限の確認" do
      before do
        visit new_user_session_path
        fill_in "Eメール", with: "test_sales@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        click_link "商品情報一覧"
        click_link "詳細", match: :first
      end

      context "営業が商談情報の詳細ページに飛んだ場合" do
        it "商談情報の登録フォームが表示されない" do
          sleep 0.5
          expect(page).not_to have_content "商談情報登録"
        end

        it "商談情報の編集ボタンが表示されない" do
          sleep 0.5
          expect(page).not_to have_link("negotiation_edit")
        end

        it "商談情報の削除ボタンが表示されない" do
          sleep 0.5
          expect(page).not_to have_link("negotiation_delete")
        end
      end
    end
  end
end
