class AddUserIdToProgramAdmins < ActiveRecord::Migration[7.1]
  def change
    add_reference :program_admins, :user, null: false, foreign_key: true
  end
end
