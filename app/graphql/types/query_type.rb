module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user_stop_areas, Types::Kv1::UserStopAreaType.connection_type, null: false,
      description: "Transit stop areas" do
        argument :limit, Integer, required: false
    end
    def user_stop_areas
      ::Kv1::UserStopArea.all
    end
  end
end
