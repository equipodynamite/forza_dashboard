module PhysicalTestsHelper

	def suggested_program_options_for_select
		options_for_select = []
		PhysicalTest.suggested_programs.keys.each do |pt|
			options_for_select << [t("enums.physical_test.suggested_program.#{pt}"), pt]
		end
		options_for_select
	end

	def pull_ups_form_options_for_select
		options_for_select = []
		PhysicalTest.pull_ups_forms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.pull_ups_form.#{pt}"), pt]
		end
		options_for_select
	end

	def pull_ups_rom_options_for_select
		options_for_select = []
		PhysicalTest.pull_ups_roms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.pull_ups_rom.#{pt}"), pt]
		end
		options_for_select
	end

	def pull_ups_core_options_for_select
		options_for_select = []
		PhysicalTest.pull_ups_cores.keys.each do |pt|
			options_for_select << [t("enums.physical_test.pull_ups_core.#{pt}"), pt]
		end
		options_for_select
	end

	def pull_ups_rhythm_options_for_select
		options_for_select = []
		PhysicalTest.pull_ups_rhythms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.pull_ups_rhythm.#{pt}"), pt]
		end
		options_for_select
	end

	def push_ups_form_options_for_select
		options_for_select = []
		PhysicalTest.push_ups_forms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.push_ups_form.#{pt}"), pt]
		end
		options_for_select
	end

	def push_ups_rom_options_for_select
		options_for_select = []
		PhysicalTest.push_ups_roms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.push_ups_rom.#{pt}"), pt]
		end
		options_for_select
	end

	def push_ups_core_options_for_select
		options_for_select = []
		PhysicalTest.push_ups_cores.keys.each do |pt|
			options_for_select << [t("enums.physical_test.push_ups_core.#{pt}"), pt]
		end
		options_for_select
	end

	def push_ups_rhythm_options_for_select
		options_for_select = []
		PhysicalTest.push_ups_rhythms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.push_ups_rhythm.#{pt}"), pt]
		end
		options_for_select
	end

	def squats_form_options_for_select
		options_for_select = []
		PhysicalTest.squats_forms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.squats_form.#{pt}"), pt]
		end
		options_for_select
	end

	def squats_rom_options_for_select
		options_for_select = []
		PhysicalTest.squats_roms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.squats_rom.#{pt}"), pt]
		end
		options_for_select
	end

	def squats_core_options_for_select
		options_for_select = []
		PhysicalTest.squats_cores.keys.each do |pt|
			options_for_select << [t("enums.physical_test.squats_core.#{pt}"), pt]
		end
		options_for_select
	end

	def squats_rhythm_options_for_select
		options_for_select = []
		PhysicalTest.squats_rhythms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.squats_rhythm.#{pt}"), pt]
		end
		options_for_select
	end

	def crunches_form_options_for_select
		options_for_select = []
		PhysicalTest.crunches_forms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.crunches_form.#{pt}"), pt]
		end
		options_for_select
	end

	def crunches_rom_options_for_select
		options_for_select = []
		PhysicalTest.crunches_roms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.crunches_rom.#{pt}"), pt]
		end
		options_for_select
	end

	def crunches_core_options_for_select
		options_for_select = []
		PhysicalTest.crunches_cores.keys.each do |pt|
			options_for_select << [t("enums.physical_test.crunches_core.#{pt}"), pt]
		end
		options_for_select
	end

	def crunches_rhythm_options_for_select
		options_for_select = []
		PhysicalTest.crunches_rhythms.keys.each do |pt|
			options_for_select << [t("enums.physical_test.crunches_rhythm.#{pt}"), pt]
		end
		options_for_select
	end

end
