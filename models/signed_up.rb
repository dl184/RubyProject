require_relative("../db/sql_runner")
require_relative("./gymclass.rb")
require_relative("./member.rb")

class Signed_up

  attr_accessor :id, :member_id, :gymclass_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id']
    @gymclass_id = options['gymclass_id']
  end

  def save()
    sql = "INSERT INTO signed_up (member_id, gymclass_id) VALUES ($1, $2) RETURNING id"
    values = [@member_id, @gymclass_id]
    signed_up = SqlRunner.run(sql, values).first
    @id = signed_up['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM signed_up"
    results = SqlRunner(sql)
    return results.map {|signed_up| Signed_up.new(signed_up)}
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def gymclass()
    sql = "SELECT * FROM gymclass WHERE id = $1"
    values = [@gymclass_id]
    results SqlRunner.run(sql, values)
    return Gymclass.new(results.first)
  end

  def delete()
    sql = "DELETE from signed_up WHERE id = $1"
    values = [id]
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM signed_up"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE signed_up SET (member_id, gymclass_id) = ($1, $2) WHERE id = $3"
    values [@member_id, @gymclass_id, @id]
    SqlRunner.run(sql, values)
  end

  def bookings()
    sql = "SELECT signed_up.* FROM signed_up INNER JOIN bookings.signed_up_id
    = signed_up.id INNER JOIN members ON member.id WHERE member.id = $1"
    values =[@id]
    results = SqlRunner(sql, values)
    return results.map{|results| Signed_up.new(results)}
  end

end
