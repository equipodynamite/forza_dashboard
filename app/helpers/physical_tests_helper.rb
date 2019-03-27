module PhysicalTestsHelper

  def options_for_select_of attribute
    options = []
    keys = keys_of attribute
    keys.each do |pt|
      options << [t("enums.physical_test.#{attribute}.#{pt}"), pt]
    end
    options
  end

  private

  def keys_of attribute
    case attribute
    when 'suggested_program'
      PhysicalTest.suggested_programs.keys
    when 'pull_ups_form'
      PhysicalTest.pull_ups_forms.keys
    when 'pull_ups_rom'
      PhysicalTest.pull_ups_roms.keys
    when 'pull_ups_core'
      PhysicalTest.pull_ups_cores.keys
    when 'pull_ups_rhythm'
      PhysicalTest.pull_ups_rhythms.keys
    when 'push_ups_form'
      PhysicalTest.push_ups_forms.keys
    when 'push_ups_rom'
      PhysicalTest.push_ups_roms.keys
    when 'push_ups_core'
      PhysicalTest.push_ups_cores.keys
    when 'push_ups_rhythm'
      PhysicalTest.push_ups_rhythms.keys
    when 'squats_form'
      PhysicalTest.squats_forms.keys
    when 'squats_rom'
      PhysicalTest.squats_roms.keys
    when 'squats_core'
      PhysicalTest.squats_cores.keys
    when 'squats_rhythm'
      PhysicalTest.squats_rhythms.keys
    when 'crunches_form'
      PhysicalTest.crunches_forms.keys
    when 'crunches_rom'
      PhysicalTest.crunches_roms.keys
    when 'crunches_core'
      PhysicalTest.crunches_cores.keys
    when 'crunches_rhythm'
      PhysicalTest.crunches_rhythms.keys
    end
  end
end
