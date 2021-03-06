# require 'refinerycms-dragonfly-delayed/image_resizer'
# require 'refinerycms-dragonfly-delayed/thumb'
require 'dragonfly'
#

require 'delayed_job_active_record'
require 'refinerycms-core'

module Refinery

  module DragonflyDelayed
    require 'refinery/dragonfly_delayed/engine'
    images_app = ::Dragonfly.app(:refinery_images)

    images_app.configure do
      before_serve do |job, env|
        if images_app.datastore.is_a? ::Dragonfly::FileDataStore
          images_app.datastore.server_root = 'public'
        end

        already_generated_thumb = Thumb.where(signature: job.serialize, generated: true).first
        location = if already_generated_thumb.present?
          images_app.datastore.url_for(already_generated_thumb.uid)
        else
          fetch = job.steps.select {|j| j.is_a? ::Dragonfly::Job::Fetch}.first
          original_image = Refinery::Image.where(image_uid: fetch.uid).first
          throw :halt, [ 404, {}, [] ] if original_image.blank?

          ImageResizer.register_job_to_process job
          original_image.image.remote_url
        end
        throw :halt, [ 302, {'Location' => location}, [] ]
      end
    end
    
  end
end
