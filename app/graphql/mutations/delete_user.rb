class Mutations::DeleteUser < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    user = User.find(id)
    user.destroy

    {
      author: user,
      errors: []
    }
  end
end