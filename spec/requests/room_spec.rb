require 'rails_helper'

describe 'Room Api', type: :request do
  it "create a new room" do

    post "http://127.0.0.1:3000/api/v1/rooms", :params => {"username" => "testuser", "name" => "Chill Lobby", "desc" => "No Toxic"}

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).keys).to match_array(["desc", "id", "key", "name", "owner"])
  end

  it "get all rooms" do
    post "http://127.0.0.1:3000/api/v1/rooms", :params => {"username" => "testuser", "name" => "Chill Lobby", "desc" => "No Toxic"}
    post "http://127.0.0.1:3000/api/v1/rooms", :params => {"username" => "testuser", "name" => "Chill Lobby", "desc" => "No Toxic"}
    get "http://127.0.0.1:3000/api/v1/rooms"


    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
    expect(JSON.parse(response.body)[0].keys).to match_array(["desc", "id", "key", "name", "owner"])
  end
end