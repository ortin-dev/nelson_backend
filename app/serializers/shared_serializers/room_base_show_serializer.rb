module SharedSerializers
  class RoomBaseShowSerializer
    include JSONAPI::Serializer

    attributes :id
  end
end
