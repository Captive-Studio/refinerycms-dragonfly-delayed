require 'spec_helper'

RSpec.describe Thumb do
  it { should validate_uniqueness_of(:uid).allow_nil }
end
