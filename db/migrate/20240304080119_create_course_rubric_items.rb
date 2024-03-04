class CreateCourseRubricItems < ActiveRecord::Migration[7.1]
  def change
    create_table :course_rubric_items do |t|
      t.text :rubric_item

      t.timestamps
    end
  end
end
