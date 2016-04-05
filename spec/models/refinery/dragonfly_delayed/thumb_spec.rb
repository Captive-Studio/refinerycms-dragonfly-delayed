require 'spec_helper'

module Refinery
  module DragonflyDelayed

    describe Thumb do
      it { should validate_uniqueness_of(:uid).allow_nil }
    end

  end
end
