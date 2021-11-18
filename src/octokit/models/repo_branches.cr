module Octokit
  module Models
    class Branch
      include JSON::Serializable
      getter name : String?
      getter commit : BranchCommit?
      getter protected : Bool?

      def initialize(@name, @commit, @protected)
      end
    end

    struct BranchCommit
      include JSON::Serializable
      getter sha : String?
      getter url : String?

      def initialize(@sha, @url)
      end
    end

    # struct BranchProtection
    #   Octokit.rest_model(
    #     enabled: Bool,
    #     required_status_checks: BranchProtectionRequiredStatusChecks
    #   )
    # end

    # struct BranchProtectionRequiredStatusChecks
    #   Octokit.rest_model(
    #     enforcement_level: String,
    #     contexts: Array(String)
    #   )
    # end

    # struct BranchProtectionSummary
    #   # Octokit.rest_model # TODO
    # end
  end
end
