module Refinery
  module DragonflyDelayed
    class ThumbnailGeometriesController < ::ApplicationController
      def show
        app = ::Dragonfly.app(:refinery_images)
        job = ::Dragonfly::Job.deserialize params[:id], app
        fetch = job.steps.select {|j| j.is_a? ::Dragonfly::Job::Fetch}.first
        thumb = job.steps.select {|j| j.is_a? ::Dragonfly::Job::Process and j.name == :thumb}.first
        original_image = Refinery::Image.where(image_uid: fetch.uid).first
    
        geometry = thumb.arguments.first
        thumbnail_dimensions =  original_image.thumbnail_dimensions geometry
        render json: {width: thumbnail_dimensions[:width], height: thumbnail_dimensions[:height]}
      end
    end
  end
end
