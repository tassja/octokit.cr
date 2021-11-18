module Octokit
  module Models
    class RepoCommit
      include JSON::Serializable
      include JSON::Serializable::Unmapped
      getter sha : String
      getter commit : Commit
      getter node_id : String

      def initialize(@sha, @commit, @node_id)
      end

      def self.path(repo : String, hash : String? = "")
        "repos/#{Repository.slug(repo)}/commits?sha=#{hash}"
      end
    end

    struct Commit
      include JSON::Serializable
      include JSON::Serializable::Unmapped
      getter committer : CommitAuthor
      getter author : CommitAuthor
      getter message : String
      # getter tree : Tree
      # getter parents : Array(Commit)
      # getter stats : CommitStats
      # getter html_url : String
      getter url : String
      getter verification : SignatureVerification

      def initialize(@sha, @author, @committer, @message, @tree, @stats, @html_url, @url, @verification)
      end
    end

    struct SignatureVerification
      include JSON::Serializable
      getter verified : Bool?
      getter reason : String?
      getter signature : String?
      getter payload : String?

      def initialize(@verified, @reason, @signature, @payload)
      end
    end

    struct CommitAuthor
      include JSON::Serializable
      include JSON::Serializable::Unmapped

      getter name : String
      getter email : String
      getter date : String

      def initialize(@name, @email, @date)
      end
    end
  end
end
