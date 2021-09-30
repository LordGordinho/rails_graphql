module Types
  class QueryType < Types::BaseObject
    field :fetch_notes, resolver: Queries::FetchNotes
    field :fetch_note, resolver: Queries::FetchNote
  end
end
