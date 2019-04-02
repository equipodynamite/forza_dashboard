FactoryBot.define do
  factory :physical_test do
    date              { FFaker::Time.datetime }
    user_id           { 12 }
    suggested_program { rand(11) }
    squats            { rand(100) }
    pull_ups          { rand(100) }
    push_ups          { rand(100) }
    crunches          { rand(100) }
    squats_rom        { rand(1) }
    pull_ups_rom      { rand(1) }
    push_ups_rom      { rand(1) }
    crunches_rom      { rand(1) }
    squats_form       { rand(1) }
    pull_ups_form     { rand(1) }
    push_ups_form     { rand(1) }
    crunches_form     { rand(1) }
    squats_core       { rand(1) }
    pull_ups_core     { rand(1) }
    push_ups_core     { rand(1) }
    crunches_core     { rand(1) }
    squats_rhythm     { rand(2) }
    pull_ups_rhythm   { rand(2) }
    push_ups_rhythm   { rand(2) }
    crunches_rhythm   { rand(2) }
  end
end
