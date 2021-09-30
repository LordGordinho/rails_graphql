module Mutations::Notes
  class RemoveNote < Mutations::BaseMutation
    argument :id, ID, required: true

    field :note, Types::NoteType, null: false

    def resolve(id:)
      note = Note.find_by(id: id)

      begin
        note.destroy!

        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end