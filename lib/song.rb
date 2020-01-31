require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  #   @@all << by
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.create    
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
    string.slice!('.mp3')
    array = string.split(' - ')    
    new_song = self.create_by_name(array[1])
    new_song.artist_name = array[0]
    new_song
  end

  def self.create_from_filename(string)
    string.slice!('.mp3')
    array = string.split(' - ')    
    new_song = self.create_by_name(array[1])
    new_song.artist_name = array[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
