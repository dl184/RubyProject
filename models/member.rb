require_relative('../db/sql_runner')
require_relative("./gymclass.rb")
require_relative("./signed_up.rb")

class Member

  attr_reader( :id )
  attr_accessor( :first_name, :second_name, :member_info )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @member_info = options['member_info']
  end

  def gymclass()
    sql = "SELECT .* members INNER JOIN signed_up ON gymclass_id WHERE member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map  { |gymclass| Gymclass.new(gymclass)}
  end

  def save() #create new member
    sql = "INSERT INTO members
    (first_name,second_name, member_info)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @second_name, @member_info]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all() #returns all members
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map {|members| Member.new(members)}
  end

  def self.delete(id) #deletes members
    sql = "DELETE from members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all() #deletes all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE members SET(first_name, second_name, member_info) = ($1, $2, $3) WHERE id = $4;"
    values = [@first_name, @second_name, @member_info, @id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def full_name()
    values = [@first_name, @second_name].join
    SqlRunner.run(sql, values)
    return results
  end


end
