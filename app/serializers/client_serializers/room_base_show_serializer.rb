module ClientSerializers
  class RoomBaseShowSerializer
    include JSONAPI::Serializer
    attributes :id
  end
end
