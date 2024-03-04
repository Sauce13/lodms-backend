class CreatePerformanceIndicators < ActiveRecord::Migration[7.1]
  def change
    create_table :performance_indicators do |t|
      t.text :indicator_description

      t.timestamps
    end
  end
end
