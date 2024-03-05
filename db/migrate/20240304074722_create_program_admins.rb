class CreateProgramAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :program_admins do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
