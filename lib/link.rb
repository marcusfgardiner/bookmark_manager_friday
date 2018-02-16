require_relative 'database_connection'
require 'uri'

class Link

  def initialize(array)
    p @id = array[0]
    p @url = array[1]
      Link.all_two << self
  end

  def self.all_two
    @links
  end

  def self.create_links
    @links = []
  end

  # def self.store_link(new_link_object)
  #   @links << new_link_object
  # end

  def self.all
    array = DatabaseConnection.query("SELECT url FROM links")
    # array.each {|url|

    # }
  end

  def self.add(new_link)
    error_check(new_link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{new_link}')")
  end

  def self.error_check(new_link)
    raise "This is not a valid URL" unless valid_url?(new_link)
  end

  def self.valid_url?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
