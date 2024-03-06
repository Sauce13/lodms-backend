class AddUserIdToInstructors < ActiveRecord::Migration[7.1]
  def change
    add_reference :instructors, :user, null: true, foreign_key: true
  end
end
