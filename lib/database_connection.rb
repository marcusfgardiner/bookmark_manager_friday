require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql)
    result = @connection.exec(sql)
    result.values
  end

  # def self.wrap_database
  #   # result = query('SELECT * FROM links')
  #   # array_of_arrays = result.map { |k| k }
  #   # result.map { |array| Link.new(array) }
  # end
end
