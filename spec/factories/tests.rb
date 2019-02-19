FactoryBot.define do
  factory :test do
    name { "MyString" }
    reps { 1.5 }
    form { 1 }
    rom { 1 }
    core { 1 }
    rythm { 1 }
    notes { "MyText" }
    belongs_to { "" }
  end
end
