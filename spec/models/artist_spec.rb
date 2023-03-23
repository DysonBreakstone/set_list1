require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      let!(:prince) {Artist.create!(name: "Prince")}
      let!(:purple) {prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)}
      let!(:beret) {prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)}
      let!(:other_song) {prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 99)}

      it 'returns the average song length' do
        expect(prince.average_song_length.round(2)).to eq(503.33)
      end
    end
  end
end