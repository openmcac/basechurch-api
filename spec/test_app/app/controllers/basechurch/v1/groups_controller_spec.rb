require 'rails_helper'

describe Basechurch::V1::GroupsController, type: :controller do
  describe 'GET /groups/:id' do
    let(:group) do
      create(:group, created_at: DateTime.iso8601('2001-02-03T04:05:06+07:00'))
    end

    it 'returns a single group' do
      get :show, id: group.id
      data = JSON.parse(response.body)["data"]
      attributes = data["attributes"]
      expect(data["id"]).to eq group.id.to_s
      expect(data["type"]).to eq "groups"
      expect(attributes["name"]).to eq group.name
      expect(attributes["slug"]).to eq group.slug
      expect(attributes["created-at"]).to eq "2001-02-02T21:05:06+00:00"
    end
  end
end
