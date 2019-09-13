class Mutations::UpdateUser < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :rut, String, required: false
  argument :n_list, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(id:, **args)
    user = User.find(id)
    if user.update(args)
      # Successful update, return the created object with no errors
      {
        user: user,
        errors: [],
      }
    else
      # Failed update, return the errors to the client
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end