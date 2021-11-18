module Octokit
  module Models
    struct Tree
      include JSON::Serializable
      getter sha : String
      getter url : Array(TreeEntry)

      def initialize(@sha, @url)
      end
    end

    struct TreeEntry
      include JSON::Serializable
      getter sha : String
      getter path : String
      getter mode : String
      getter type : String
      getter size : Int32
      getter content : String
      getter url : String
    end
  end
end
