require 'rails_helper'

RSpec.describe Result, type: :model do
  describe "モデルのバリデーションのテスト" do
    let!(:result) { FactoryBot.create(:result) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "商談結果の登録ができる" do
          expect(result).to be_valid
        end
      end
    end

    describe "contentカラムの確認" do
      context "内容が登録されなかった場合" do
        it "商談結果登録ができない" do
          result.content = ""
          expect(result).not_to be_valid
        end
      end
      context "内容の文字数が5000以上だった場合" do
        it "商談結果登録ができない" do
          result.content = "a" * 5001
          expect(result).not_to be_valid
        end
      end
    end
  end
end
