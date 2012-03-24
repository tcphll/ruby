class Song
  attr_reader :name, :artist, :duration
  @@plays = 0
  def initialize(name, artist, duration)
    @name   = name
    @artist = artist
    @duration = duration
    @plays = 0
  end
  
  def duration_in_minutes
    @duration / 60.0
  end
  
  def duration_in_minutes=(new_duration)
    @duration = (new_duration * 60).to_i
  end
  
  def to_s
    "Song:#{@name}--#{@artist} (#{@duration})"
  end

  def play
    @plays += 1
    @@plays += 1
    "#@name: #{@plays} plays. Total #{@@plays}"
  end
  
  def reset
    @plays = 0
    "#{@name} has been reset to 0 plays."
  end
end

class KaraokeSong < Song
  attr :lyrics, :name

  def initialize(name,artist,duration,lyrics)
    super(name,artist,duration)
    @lyrics = lyrics
  end
  
  def to_s
     super + " Lyrics: #{@lyrics}"
  end
end

class SongList
  MAX_TIME = 300
  attr_reader :songs
  
  def initialize
    @songs = Array.new
  end
  
  def append(song)
    @songs.push(song)
    self
  end
  
  def delete_first
    @songs.shift
  end
  
  def delete_last
    @songs.pop
  end
  
  def SongList.is_too_lona(song)
    return song.duration > MAX_TIME
  end
end

class MyLogger
  private_class_method :new
  @@logger = nil
  
  class <<self
    def create
      @@logger = new unless @@logger
      @@logger
    end
  end 
end

song_list = SongList.new
5.times do |x|
  song = Song.new("Song#{x}","Artist#{x}", 100 + x)
  song_list.append(song)
end

song_list.songs.each do |song|
  puts song.to_s
end

puts 'I am finished!'
