require_relative 'database_connection'
require 'uri'

class Link

  attr_reader :id, :url

  def initialize(array)
    @id = array[0].to_i
    @url = array[1]
    Link.all << self
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |array| Link.new(array) }
    @links ||= []
  end
  # If links is nil, make it a blank array
  # If not, leave it

  def self.add(new_link)
    error_check(new_link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{new_link}')")
    DatabaseConnection.wrap_database
  end

  def self.error_check(new_link)
    raise "This is not a valid URL" unless valid_url?(new_link)
  end

  def self.valid_url?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
