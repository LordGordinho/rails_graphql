module Mutations::Notes
  class UpdateNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteInputType, required: true
    argument :id, ID, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:, id:)
      note = Note.find_by(id: id)

      begin
        note.update!(params.to_h)

        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end