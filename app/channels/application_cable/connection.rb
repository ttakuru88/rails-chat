module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      # ActionCable.server.connections.map(&:statistics)
    end
  end
end
