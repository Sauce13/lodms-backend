class AddCourseIdToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :course, null: false, foreign_key: true
  end
end
