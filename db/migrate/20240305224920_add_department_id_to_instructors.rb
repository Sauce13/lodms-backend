class AddDepartmentIdToInstructors < ActiveRecord::Migration[7.1]
  def change
    add_reference :instructors, :department, foreign_key: true
  end
end
