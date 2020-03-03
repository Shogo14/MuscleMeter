FactoryBot.define do
    factory :work_out do
        training_date {'2020-02-22'}
        rep {5}
        set {5}
        weight {90}
        user
        training_menu
    end
end