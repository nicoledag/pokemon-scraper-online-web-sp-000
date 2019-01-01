require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
  end


  def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(id: results[0],
                name: results[1],
                type: results[2],
                db: db)
  end

  def alter_hp(update_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", update_hp, self.id)
  end


end
