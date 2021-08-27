require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it { should belong_to(:attendee) }
  it { should belong_to(:attended_workshop) }
  it { should validate_presence_of(:attendee_id) }
  it { should validate_presence_of(:attended_workshop_id) }
  it { should validate_presence_of(:date) }
end
