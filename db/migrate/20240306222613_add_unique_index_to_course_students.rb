class AddUniqueIndexToCourseStudents < ActiveRecord::Migration[7.1]
  def change
    add_index :course_students, [:student_id, :course_id], unique: true
  end
end
