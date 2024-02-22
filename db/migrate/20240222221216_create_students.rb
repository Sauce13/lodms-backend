class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
