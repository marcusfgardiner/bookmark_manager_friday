require_relative 'database_connection'
require 'uri'

class Link

  attr_reader :id, :url, :title

  def initialize(array)
    @id = array[0].to_i
    @url = array[1]
    @title = array[2]
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |array| Link.new(array) }
  end

  def self.add(new_link, new_title)
    error_check(new_link)
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{new_link}', '#{new_title}')")
  end

  def self.error_check(new_link)
    raise "This is not a valid URL" unless valid_url?(new_link)
  end

  def self.valid_url?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
