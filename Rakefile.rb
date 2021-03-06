require 'pg'
require_relative 'lib/database_connection'

task :setup do
  p 'Databases being created...'
  connection = PG.connect
  %w[bookmark_manager bookmark_manager_test].each do |database|
    connection.exec("CREATE DATABASE #{database}")
    DatabaseConnection.setup(database.to_s)
    DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
  end
  p 'Complete'
end

task :setup_test_database do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE links;
  INSERT INTO links (url, title) VALUES('http://www.makersacademy.com','Makers Academy');
  INSERT INTO links (url, title) VALUES('http://www.google.com','Google');
  INSERT INTO links (url, title) VALUES('http://www.facebook.com','Facebook');")
end

task :drop_databases do
  p 'Databases being deleted...'
  connection = PG.connect
  %w[bookmark_manager bookmark_manager_test].each do |database|
    connection.exec("DROP DATABASE #{database}")
  end
  p 'Deleted'
end
