require 'refinerycms-dragonfly-delayed/image_resizer'
require 'refinerycms-dragonfly-delayed/thumb'
require 'dragonfly'
require 'delayed_job_active_record'

::Dragonfly[:refinery_images].configure do |config|
  config.server.before_serve do |job, env|
    already_generated_thumb = Thumb.where(signature: job.serialize, generated: true).first
    location = if already_generated_thumb.present? 
      ::Dragonfly[:refinery_images].datastore.url_for(already_generated_thumb.uid)
    else
      fetch = job.steps.select {|job| job.is_a? Dragonfly::Job::Fetch}.first
      original_image = Refinery::Image.where(image_uid: fetch.uid).first
      throw :halt, [ 404, {}, [] ] if original_image.blank?

      ImageResizer.register_job_to_process job
      original_image.image.remote_url
    end
    throw :halt, [ 302, {'Location' => location}, [] ]
  end
end