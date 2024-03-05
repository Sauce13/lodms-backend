class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.date :data_taken

      t.timestamps
    end
  end
end
