require 'rspec'
require 'planner'

RSpec.describe 'Planner' do
  let(:slots_a) { [[10, 50], [60, 120], [140, 210]] }
  let(:slots_b) { [[0, 15], [60, 70]] }
  let(:dur_1) { 8 }
  let(:dur_2) { 12 }

  let(:overlapping_timeslots) { slots_a, slots_b, dur_1 }

  let(:no_overlapping_timeslots) { slots_a, slots_b, dur_2}
  describe 'meeting_planner' do
    context 'overlap' do
      it 'returns a timeslot start and end time' do
        expect(overlapping_timeslots.meeting_planner).to eq([60, 68])
      end
    end

    context 'no overlap' do
      it 'returns null if there no overlap between time slots' do
        expect(no_overlapping_timeslots.meeting_planner).to eq(null)
      end
    end
  end
end
