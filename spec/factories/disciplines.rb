FactoryBot.define do
  factory :discipline do
    name { ["português", "direito civil", "legislação federal", 
            "direito constitucional", "literatura", "estatística", 
            "geografia", "inglês", "raciocínio lógico", "matemática"].sample }
  end
end
