module Refinery
  module DragonflyDelayed

    class ImageResizer
      class << self
        def resize_images_in_queue
          dragonfly_app = ::Dragonfly.app(:refinery_images)
          Thumb.where(generated: false).find_each do |thumb|
            job = ::Dragonfly::Job.deserialize thumb.signature, dragonfly_app
            uid = job.store
            thumb.update_attributes uid: uid, generated: true
          end
        end
    
        def register_job_to_process job
          thumb = Thumb.where(signature: job.serialize).first_or_initialize
          if thumb.new_record?
            thumb.save
            thumb.delay.store!
          end
        end
      end
    end

  end
end