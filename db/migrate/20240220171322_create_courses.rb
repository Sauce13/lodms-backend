class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :crn
      t.string :subject_area
      t.string :instructor
      t.string :college

      t.timestamps
    end
  end
end
