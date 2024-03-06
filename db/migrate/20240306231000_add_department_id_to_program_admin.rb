class AddDepartmentIdToProgramAdmin < ActiveRecord::Migration[7.1]
  def change
    add_reference :program_admins, :department, foreign_key: true
  end
end
