class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.integer :score
      t.timestamps
    end
  end
end
