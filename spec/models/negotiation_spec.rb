require 'rails_helper'

RSpec.describe Negotiation, type: :model do
  describe "モデルのバリデーションのテスト" do
    let!(:negotiation) { FactoryBot.create(:negotiation) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "商談情報の登録ができる" do
          expect(negotiation).to be_valid
        end
      end
    end

    describe "nameカラムの確認" do
      context "商品名が登録されなかった場合" do
        it "商談情報登録ができない" do
          negotiation.name = ""
          expect(negotiation).not_to be_valid
        end
      end
      context "商談情報名の文字数が255以上だった場合" do
        it "商談情報登録ができない" do
          negotiation.name = "a" * 256
          expect(negotiation).not_to be_valid
        end
      end
    end

    describe "selling_priceカラムの確認" do
      context "店頭価格が登録されなかった場合" do
        it "商談情報の登録ができない" do
          negotiation.selling_price = ""
          expect(negotiation).not_to be_valid
        end
      end
    end

    describe "wholesale_priceカラムの確認" do
      context "先方卸値が登録されなかった場合" do
        it "商談情報の登録ができない" do
          negotiation.wholesale_price = ""
          expect(negotiation).not_to be_valid
        end
      end
    end

    describe "explanationカラムの確認" do
      context "商品説明が登録されなかった場合" do
        it "商談情報登録ができない" do
          negotiation.explanation = ""
          expect(negotiation).not_to be_valid
        end
      end
      context "商品説明の文字数が5000以上だった場合" do
        it "商談情報登録ができない" do
          negotiation.explanation = "a" * 5001
          expect(negotiation).not_to be_valid
        end
      end
    end
  end
end
