
class FtQueryController < ApplicationController

  def index
    $time_stamps = $db.execute('SELECT * FROM clock_watch') if $db
    $time_stamps = ['Database is empty or an other error occured'] if $time_stamps.nil?
    $all = ['Not so fast, young padawan']
  end

  def create_db
    $db = SQLite3::Database.new('ft_sql')
  end

  def create_table
    $db = SQLite3::Database.open('ft_sql')
    $db.execute('CREATE TABLE IF NOT EXISTS clock_watch
    (
      ts_id INTEGER PRIMARY KEY,
      day SMALLINT,
      month TINYINT,
      year SMALLINT,
      hour TINYINT,
      min TINYINT,
      sec TINYINT,
      race INTEGER,
      name char(50),
      lap INTEGER
    )'
    )
    $db.execute('CREATE TABLE IF NOT EXISTS race
    (
      r_id INTEGER PRIMARY KEY,
      start char(50)
    )'
    )
  end

  def drop_table
    $db = SQLite3::Database.open('ft_sql')
    $db.execute('DROP TABLE IF EXISTS clock_watch')
    $db.execute('DROP TABLE IF EXISTS race')
    redirect_to :root
  end

  def start_race
    $db = SQLite3::Database.open('ft_sql')
    $runner_1 = params[:name_1].empty? ? 'anonymous' : params[:name_1]
    $runner_2 = params[:name_2].empty? ? 'anonymous' : params[:name_2]
    $runner_3 = params[:name_3].empty? ? 'anonymous' : params[:name_3]
    $runner_4 = params[:name_4].empty? ? 'anonymous' : params[:name_4]

=begin
   temps = Time.now.getlocal
    day = temps.day
    month = temps.month
    year = temps.year
    hour = temps.hour
    min = temps.min
    sec = temps.sec
    lap = 1
    sql = 'INSERT INTO race (start) VALUES (?);'
    tmp = $db.prepare(sql)
    tmp.execute temps.to_s
    r_id = $db.execute("SELECT r_id FROM race WHERE start IS '{temps}'")
    sql = ' INSERT INTO clock_watch (name, day, month, year, hour, min, sec, lap, race)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);'
    tmp = $db.prepare(sql)
    [$runner_1, $runner_2, $runner_3, $runner_4].each do |runner|
      tmp.execute(runner, day, month, year, hour, min, sec, lap, r_id)
    end
=end

    time = Time.now
    day = time.day
    mon = time.month
    year = time.year
    hour = time.hour
    min = time.min
    sec = time.sec
    lap = 1

    $db.query("INSERT INTO race (start) VALUES ('#{time.to_s}')")
    race = $db.execute("SELECT r_id FROM race WHERE start IS '#{time}'")

    query = $db.prepare('INSERT INTO clock_watch (name, day, month, year, hour, min, sec, lap, race) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);')

    [$runner_1, $runner_2, $runner_3, $runner_4].each do |r|
      query.execute(r, day, mon, year, hour, min, sec, lap, race)
    end

    redirect_to :root
/    $db = SQLite3::Database.open('ft_sql')
    $runner_1 = params[:name_1].empty? ? 'anonymous' : params[:name_1]
    $runner_2 = params[:name_2].empty? ? 'anonymous' : params[:name_2]
    $runner_3 = params[:name_3].empty? ? 'anonymous' : params[:name_3]
    $runner_4 = params[:name_4].empty? ? 'anonymous' : params[:name_4]
    time = Time.now
    day = time.day
    mon = time.month
    year = time.year
    hour = time.hour
    min = time.min
    sec = time.sec
    $db.query("INSERT INTO race (start) VALUES ('{time.to_s}')")
    r = $db.execute("SELECT r_id FROM race WHERE start IS '{time}'")
    race = r[0][0]
    $db.query("INSERT INTO clock_watch(name, year, month, day, hour, min, sec, race, lap) VALUES('{$runner_1}', '{year}', '{mon}', '{day}', '{hour}', '{min}', '{sec}', '{race}', 1)")
    $db.query("INSERT INTO clock_watch(name, year, month, day, hour, min, sec, race, lap) VALUES('{$runner_2}', '{year}', '{mon}', '{day}', '{hour}', '{min}', '{sec}', '{race}', 1)")
    $db.query("INSERT INTO clock_watch(name, year, month, day, hour, min, sec, race, lap) VALUES('{$runner_3}', '{year}', '{mon}', '{day}', '{hour}', '{min}', '{sec}', {race}', 1)")
    $db.query("INSERT INTO clock_watch(name, year, month, day, hour, min, sec, race, lap) VALUES('{$runner_4}', '{year}', '{mon}', '{day}', '{hour}', '{min}', '{sec}', '{race}', 1)")

    redirect_to :root/
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
