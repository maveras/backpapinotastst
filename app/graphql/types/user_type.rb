module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :rut, String, null: true
    field :name, String, null: true
    field :last_name, String, null: true
    field :prescense, String, null: true
    field :n_list, String, null: false
  end
end
