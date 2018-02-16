require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    result = @connection.exec(sql)
    # p result.values
    # # p result.keys
    array_of_hashes = result.map {|k,v|
      p k
    }
    p array_of_hashes
  end
end
