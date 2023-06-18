require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "モデルのバリデーションのテスト" do
    let!(:product) { FactoryBot.create(:product) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "ユーザー登録ができる" do
          expect(product).to be_valid
        end
      end
    end
  end
end
