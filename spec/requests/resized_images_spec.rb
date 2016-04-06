require 'spec_helper'

describe 'Resized Images' do
  context 'get Geometries#show' do
    it 'returns resized geometry' do
      image = create :image
      thumbnail_job = image.thumbnail(geometry: :small).serialize
      get refinery.dragonfly_delayed_thumbnail_geometry_path(thumbnail_job)
      json = JSON.parse response.body
      expect(json['width']).to eq 110
      expect(json['height']).to eq 83
    end
  end
end