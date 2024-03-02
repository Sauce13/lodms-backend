class AddScoreToAssignment < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :score, :integer
  end
end
