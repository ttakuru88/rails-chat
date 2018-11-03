require 'rails_helper'

RSpec.describe RoomsController do
  describe 'GET /rooms/:id' do
    subject { get :show, params: {id: room_name} }

    context '指定のルームが存在しない' do
      let(:room_name) { 'my room' }

      it '200 OKが返る' do
        subject
        expect(response).to have_http_status 200
      end

      it '新規ルームが作成される' do
        expect { subject }.to change { Room.count }.by(1)
      end
    end

    context '指定のルームが存在する' do
      let!(:room) { create :room }
      let(:room_name) { room.name }

      it '200 OKが返る' do
        subject
        expect(response).to have_http_status 200
      end

      it '新規ルームが作成されない' do
        expect { subject }.to_not change { Room.count }
      end
    end
  end
end
