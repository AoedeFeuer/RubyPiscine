
class FtQueryController < ApplicationController

  def index
   
  end

  def create_db
    $db = SQLite3::Database.new('ft_sql')
  end

  def create_table
    $db.execute('CREATE TABLE IF NOT EXISTS clock_watch
    (
      ts_id INTEGER PRIMARY KEY AUTOINCREMENT,
      day SMALLINT,
      month TINYINT,
      year SMALLINT,
      hour TINYINT,
      min TINYINT,
      sec TINYINT,
      race SMALLINT,
      name char(50),
      lap SMALLINT
    )'
    )
    $db.execute('CREATE TABLE IF NOT EXISTS race
    (
      r_id INTEGER PRIMARY KEY AUTOINCREMENT,
      start char(50)
    )'
    )
  end

  def drop_table
    $db.execute('DROP TABLE IF EXISTS clock_watch')
    $db.execute('DROP TABLE IF EXISTS race')
    redirect_to :root
  end

  def start_race
   
  end

  def insert_time_stamp
  
  end

  def delete_last

  end

  def destroy_all
   
  end

  def all_by_name
 
  end

  def all_by_race
   
  end

  def update_time_stamp
  
  end

  private


end
