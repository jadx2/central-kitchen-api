require 'rails_helper'

RSpec.describe Workshop, type: :model do
  it { should have_many(:attendances) }
  it { should have_many(:attendees) }
end
