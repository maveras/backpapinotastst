class Mutations::ChangePrescence < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  # argument :name, String, required: true
  # argument :last_name, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    user = User.find(id)
    if user.update(prescense: !user.prescense?)
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
