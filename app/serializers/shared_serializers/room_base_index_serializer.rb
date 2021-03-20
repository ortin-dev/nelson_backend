module SharedSerializers
  class RoomBaseIndexSerializer
    include JSONAPI::Serializer

    attributes :id, :created_at
  end
end
