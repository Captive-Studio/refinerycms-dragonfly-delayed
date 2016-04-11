require 'spec_helper'

feature 'Resized images' do

  scenario 'resize in a background job' do
    image = create :image
    original_remote_url = image.image.remote_url

    delayed_jobs_count = Delayed::Job.count
    expect {
      visit image.thumbnail(geometry: :small).url
    }.to change{Refinery::DragonflyDelayed::Thumb.count}.from(0).to(1)
    expect(current_path).to eq original_remote_url
    expect(Delayed::Job.count).to eq delayed_jobs_count + 1

    # une deuxième fois pour vérifier que ça crash pas
    delayed_jobs_count = Delayed::Job.count
    expect {
      visit image.thumbnail(geometry: :small).url
    }.to_not change{Refinery::DragonflyDelayed::Thumb.count}
    expect(Delayed::Job.count).to eq delayed_jobs_count
    expect(current_path).to eq original_remote_url

    Refinery::DragonflyDelayed::ImageResizer.resize_images_in_queue
    visit image.thumbnail(geometry: :small).url
    generated_thumb = Refinery::DragonflyDelayed::Thumb.last
    expect(current_path).to eq "/system/refinery/images/#{generated_thumb.uid}"

    visit image.url
    expect(current_path).to eq image.image.remote_url
  end

  scenario 'does not register resizing job and returns status 404 if original image does not exist' do
    expect {
      wrong_url = '/system/images/W1siZiIsIjIwMTUvMDcvMzEvMTAvMjcvNDkvOTQvYmFja2dyb3VuZC5qcGciXV0/background.jpg'
      visit wrong_url
    }.to_not change{Delayed::Job.count}
    expect(page.status_code).to eq 404
  end

end