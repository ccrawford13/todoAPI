require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to :user }
  it { should have_many :items }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(5) }
end
