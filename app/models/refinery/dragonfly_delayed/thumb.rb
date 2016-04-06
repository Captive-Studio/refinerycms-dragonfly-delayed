module Refinery
  module DragonflyDelayed

    class Thumb < ActiveRecord::Base
      self.table_name = 'thumbs'
      
      attr_accessible :generated, :signature, :uid
  
      validates :signature, presence: true, uniqueness: true
      validates :uid, uniqueness: {allow_nil: true}
  
      def store!
        dragonfly_app = ::Dragonfly[:refinery_images]
        job = Dragonfly::Job.deserialize signature, dragonfly_app
        uid = job.store
        update_attributes uid: uid, generated: true
        p "[#{Time.now}] Resized #{uid}"
      end
    end

  end
end