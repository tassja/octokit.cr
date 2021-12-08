module Octokit
  module Models
    struct RepositoryRelease
      include JSON::Serializable
      getter tag_name : String
      getter name : String
      getter body : String
      getter draft : Bool
      getter prerelease : Bool

      getter id : Int64?
      getter created_at : Time?
      getter published_at : String
      getter url : String?
      # getter html_url : String?,
      getter assets_url : String?
      getter assets : Array(ReleaseAsset)?

      # getter upload_url : String,
      # getter zipball_url : String?,
      # getter tarball_url : String?,
      # getter author : User?,
      # getter node_id : String?

      def initialize(@tag_name, @name, @body, @id, @draft, @prerelease, @created_at, @published_at, @url, @assets_url, @assets)
      end
    end

    struct ReleaseAsset
      include JSON::Serializable
      getter id : Int32
      getter url : String
      getter name : String
      getter label : String?
      getter state : String
      getter content_type : String
      getter size : Int32
      getter download_count : Int32
      getter created_at : Time
      getter updated_at : Time

      def initialize(@id, @url, @name, @label, @state, @content_type, @size, @download_count, @created_at, @updated_at)
      end
    end

    struct RepositoryReleaseRequest
      Octokit.rest_model(
        tag_name: String,
        target_commit_hash: String,
        name: String,
        body: String,
        draft: Bool,
        prerelease: Bool
      )
    end
  end
end
