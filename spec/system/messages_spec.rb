require 'rails_helper'

RSpec.describe "Messages", type: :system do

  before do
    @messageBEF = FactoryBot.build(:message)
    @userBEF = @messageBEF.user
    @userBEF.save
    @productBEF = @messageBEF.product
    @productBEF.save

    @messageAFT = FactoryBot.build(:message)
    @userAFT = @messageAFT.user
    @userAFT.save
    @productAFT = @messageAFT.product
    @productAFT.save

  end

  describe 'コメントの投稿' do
    context '正常時' do
      it '出品したユーザは、自分の商品にコメントできる' do
        sign_in(@userBEF)
        visit item_path(@productBEF.id)
        fill_in 'message[text]', with: @messageBEF.text
        expect{click_on('コメントする')}.to change{Message.count}.by(1)
        expect(current_path).to eq item_path(@productBEF.id)
        expect(page).to have_content(@messageBEF.text)
        expect(page).to have_content(@userBEF.nickname)
      end

      it 'ログインユーザは、別ユーザが出品した商品にコメントできる' do
        sign_in(@userAFT)
        visit item_path(@productBEF.id)
        fill_in 'message[text]', with: @messageAFT.text
        expect{click_on('コメントする')}.to change{Message.count}.by(1)
        expect(current_path).to eq item_path(@productBEF.id)
        expect(page).to have_content(@messageAFT.text)
        expect(page).to have_content(@userAFT.nickname)
      end
    end

    context '異常時' do
      it 'ログインしていないユーザはコメントできず、ログインページに遷移する' do
        visit item_path(@productBEF.id)
        fill_in 'message[text]', with: "No Login Comment"
        expect{click_on('コメントする')}.not_to change{Message.count}
        expect(current_path).to eq new_user_session_path
      end

      it '空のコメントは登録できない' do
        sign_in(@userAFT)
        visit item_path(@productBEF.id)
        fill_in 'message[text]', with: nil
        expect{click_on('コメントする')}.not_to change{Message.count}
        expect(current_path).to eq item_path(@productBEF.id)
        expect(page).not_to have_no_content(@userAFT.nickname)
      end
    end

  end
end
