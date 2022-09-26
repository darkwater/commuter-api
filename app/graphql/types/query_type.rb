
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user_stop_areas, Types::Kv1::UserStopAreaType.connection_type, null: false,
      description: "Transit stop areas" do
        argument :near, String, required: false
    end
    def user_stop_areas
      ::Kv1::UserStopArea.all
    end

    field :user_stop_points, Types::Kv1::UserStopPointType.connection_type, null: false,
      description: "Transit stop points" do
        argument :near, [Float], required: false
        argument :ids, [String], required: false
    end
    def user_stop_points(near: nil, ids: nil)
      query = ::Kv1::UserStopPoint.
        joins("INNER JOIN stop_locations ON stop_locations.user_stop_code = kv1_user_stop_points.user_stop_code").
        select("*, stop_locations.lat, stop_locations.long")

      if ids
        query = query.where(user_stop_code: ids)
      end

      if near
        lat, long = near.map(&:to_f)

        query = query.
          order(Arel.sql("ST_Distance(stop_locations.coords, ST_SETSRID(ST_Point(#{long}, #{lat}), 4326)) ASC"))
      end

      query.all
    end
  end
end
