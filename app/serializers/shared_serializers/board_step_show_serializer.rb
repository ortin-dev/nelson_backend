module SharedSerializers
  class BoardStepShowSerializer
    include JSONAPI::Serializer

    attributes :title, :position
  end
end
