require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "モデルのバリデーションのテスト" do
    let!(:product) { FactoryBot.create(:product) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "商品の登録ができる" do
          expect(product).to be_valid
        end
      end
    end
    
    describe "assumed_nameカラムの確認" do
      context "想定商品名が登録されなかった場合" do
        it "商品の登録ができない" do
          product.assumed_name = ""
          expect(product).not_to be_valid
        end
      end
      context "想定商品名の文字数が255以上だった場合" do
        it "商品の登録ができない" do
          product.assumed_name = "a" * 256
          expect(product).not_to be_valid
        end
      end
    end

    describe "assumed_selling_priceカラムの確認" do
      context "想定店頭価格が登録されなかった場合" do
        it "商品の登録ができない" do
          product.assumed_selling_price = ""
          expect(product).not_to be_valid
        end
      end
    end

    describe "assumed_wholesale_priceカラムの確認" do
      context "想定先方卸値が登録されなかった場合" do
        it "商品の登録ができない" do
          product.assumed_wholesale_price = ""
          expect(product).not_to be_valid
        end
      end
    end
    
    describe "start_onカラムの確認" do
      context "製造開始日が登録されなかった場合" do
        it "商品の登録ができない" do
          product.start_on = ""
          expect(product).not_to be_valid
        end
      end
    end

    describe "volumeカラムの確認" do
      context "製造予定数が登録されなかった場合" do
        it "商品の登録ができない" do
          product.volume = ""
          expect(product).not_to be_valid
        end
      end
    end

    describe "purposeカラムの確認" do
      context "導入目的が登録されなかった場合" do
        it "商品の登録ができない" do
          product.purpose = ""
          expect(product).not_to be_valid
        end
      end
      context "導入目的の文字数が5000以上だった場合" do
        it "商品の登録ができない" do
          product.purpose = "a" * 5001
          expect(product).not_to be_valid
        end
      end
    end

    describe "conceptカラムの確認" do
      context "コンセプトが登録されなかった場合" do
        it "商品の登録ができない" do
          product.concept = ""
          expect(product).not_to be_valid
        end
      end
      context "コンセプトの文字数が5000以上だった場合" do
        it "商品の登録ができない" do
          product.concept = "a" * 5001
          expect(product).not_to be_valid
        end
      end
    end
  end
end
