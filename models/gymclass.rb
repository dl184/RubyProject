require_relative('../db/sql_runner')
require_relative("./signed_up.rb")
require_relative("./member.rb")

class Gymclass

  attr_accessor( :id, :title, :time)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @time = options['time']
  end

  #returns members in gymclass via join table
  def member()
    sql = "SELECT .* gymclass INNER JOIN signed_up ON member_id WHERE gymclass_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member)}
  end

  #save gymclass
  def save()
    sql = "INSERT INTO gymclass
    (title,time)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@title, @time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #shows all gymclasses
  def self.all()
    sql = "SELECT * FROM gymclass"
    results = SqlRunner(sql)
    return results.map { |gymclass| Gymclass.new(gymclass) }
  end

  #deletes from gymclass
  def delete()
    sql = "DELETE from gymclass WHERE id = $1"
    values = [id]
    SqlRunner.run(sql)
  end

  #deletes all from gymclass
  def self.delete_all()
    sql = "DELETE FROM gymclass"
    SqlRunner.run(sql)
  end

  #updates gym class
  def update()
    sql = "UPDATE gymclass SET(title, time) = ($1, $2) WHERE id = $3;"
    values = [@title, @time]
    SqlRunner.run(sql, values)
  end


end
