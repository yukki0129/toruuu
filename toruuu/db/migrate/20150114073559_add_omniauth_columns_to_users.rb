class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid,      :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :name, :string
    add_column :users, :phonetic, :string
    add_column :users, :age, :integer
    add_column :users, :university_name, :string
    add_column :users, :study_subject, :string
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :employment_hope_year, :string
    add_column :users, :graduation_year, :string
    add_column :users, :overseas_experience, :string
    add_column :users, :toeic, :integer
    add_column :users, :toeful, :integer

    add_index :users, [:uid, :provider], unique: true
  end
end
