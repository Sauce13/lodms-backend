class CreateProgramLevelRubricItems < ActiveRecord::Migration[7.1]
  def change
    create_table :program_level_rubric_items do |t|
      t.string :rubric_item

      t.timestamps
    end
  end
end
