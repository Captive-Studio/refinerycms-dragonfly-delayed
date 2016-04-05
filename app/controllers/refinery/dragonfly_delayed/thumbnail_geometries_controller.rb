module Refinery
  module DragonflyDelayed
    class ThumbnailGeometriesController < ::ApplicationController
      def show
        app = ::Dragonfly[:refinery_images]
        job = Dragonfly::Job.deserialize params[:id], app
        fetch = job.steps.select {|job| job.is_a? Dragonfly::Job::Fetch}.first
        thumb = job.steps.select {|job| job.is_a? Dragonfly::Job::Process and job.name == :thumb}.first
        original_image = Refinery::Image.where(image_uid: fetch.uid).first
    
        geometry = thumb.arguments.first
        thumbnail_dimensions =  original_image.thumbnail_dimensions geometry
        render json: {width: thumbnail_dimensions[:width], height: thumbnail_dimensions[:height]}
      end
    end
  end
end
