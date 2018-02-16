require_relative 'database_connection'
require 'uri'

class Link

  def initialize
    store_link(self)
  end

  def store_link(new_link_object)
    @links = []
    @links << new_link_object
  end

  def self.all
    p array = DatabaseConnection.query("SELECT url FROM links")
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
