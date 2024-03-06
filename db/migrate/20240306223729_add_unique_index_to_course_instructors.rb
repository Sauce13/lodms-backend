class AddUniqueIndexToCourseInstructors < ActiveRecord::Migration[7.1]
  def change
    add_index :course_instructors, [:instructor_id, :course_id], unique: true

  end
end
