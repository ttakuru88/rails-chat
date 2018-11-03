require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  it 'トップページからのルーム新規作成' do
    get '/'
    expect(response).to have_http_status(200)

    expect(Room.count).to eq 0
    post '/rooms', params: {room: {name: 'new room'}}
    expect(response).to redirect_to room_path(id: 'new room')
    follow_redirect!

    expect(response).to have_http_status(200)
    expect(Room.count).to eq 1
  end
end
