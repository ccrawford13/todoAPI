require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :list }
  it { should validate_presence_of :list }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(5) }

  describe '#toggle_completed' do

    let(:item) { create(:item) }

    context 'when item is incomplete' do

      it 'marks item as completed' do
        item.toggle_completed
        expect(item.completed).to eq true
      end
    end

    context 'when item is completed' do

      before do
        item.update_attributes(completed: true)
      end

      it 'marks item as incomplete' do
        item.toggle_completed
        expect(item.completed).to eq false
      end
    end
  end
end
