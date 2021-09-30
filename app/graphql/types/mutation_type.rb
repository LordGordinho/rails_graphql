module Types
  class MutationType < Types::BaseObject
    field :add_note, mutation: Mutations::Notes::AddNote
    field :remove_note, mutation: Mutations::Notes::RemoveNote
    field :update_note, mutation: Mutations::Notes::UpdateNote
  end
end