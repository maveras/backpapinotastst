class Mutations::CreateUser < Mutations::BaseMutation
  argument :rut, String, required: true
  argument :name, String, required: true
  argument :last_name, String, required: true
  argument :prescense, Boolean, required: true
  argument :n_list, String, required: true


  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(rut:, name:, last_name:, prescense:, n_list:)
    user = User.new(rut: rut,name: name, last_name: last_name, prescense: true, n_list: n_list)
    if user.save
      # Successful creation, return the created object with no errors
      {
        user: user,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end