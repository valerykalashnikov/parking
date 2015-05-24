class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :mark
    end
  end
end
