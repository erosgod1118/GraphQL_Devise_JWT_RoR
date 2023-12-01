# frozen_string_literal: true

class GraphqlJwtApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
