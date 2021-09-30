module Types
  class QueryType < Types::BaseObject
    field :fetch_notes, resolver: Queries::Notes::FetchNotes
    field :fetch_note, resolver: Queries::Notes::FetchNote
  end
end
