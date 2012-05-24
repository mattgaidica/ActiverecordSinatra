class CreateCoursesAndTeachers < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title
      t.integer :teacher_id
    end
    create_table :teachers do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :courses
    drop_table :teachers
  end
end