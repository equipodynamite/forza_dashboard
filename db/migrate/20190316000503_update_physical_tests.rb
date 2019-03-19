class UpdatePhysicalTests < ActiveRecord::Migration[5.2]
  def change
  	add_column :physical_tests, :pull_ups, :integer
  	add_column :physical_tests, :pull_ups_form, :integer
  	add_column :physical_tests, :pull_ups_rom, :integer
  	add_column :physical_tests, :pull_ups_core, :integer
  	add_column :physical_tests, :pull_ups_rhythm, :integer
  	add_column :physical_tests, :pull_ups_notes, :text
  	add_column :physical_tests, :push_ups, :integer
  	add_column :physical_tests, :push_ups_form, :integer
  	add_column :physical_tests, :push_ups_rom, :integer
  	add_column :physical_tests, :push_ups_core, :integer
  	add_column :physical_tests, :push_ups_rhythm, :integer
  	add_column :physical_tests, :push_ups_notes, :text
  	add_column :physical_tests, :squats, :integer
  	add_column :physical_tests, :squats_form, :integer
  	add_column :physical_tests, :squats_rom, :integer
  	add_column :physical_tests, :squats_core, :integer
  	add_column :physical_tests, :squats_rhythm, :integer
  	add_column :physical_tests, :squats_notes, :text
  	add_column :physical_tests, :crunches, :integer
  	add_column :physical_tests, :crunches_form, :integer
  	add_column :physical_tests, :crunches_rom, :integer
  	add_column :physical_tests, :crunches_core, :integer
  	add_column :physical_tests, :crunches_rhythm, :integer
  	add_column :physical_tests, :crunches_notes, :text
    add_column :physical_tests, :general_notes, :text
  end
end
