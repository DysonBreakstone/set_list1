require 'rails_helper'

RSpec.describe "the songs show page" do

  it 'displays song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like you", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like you", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
    save_and_open_page
    
  end

end