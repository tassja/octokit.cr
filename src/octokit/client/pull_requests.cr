module Octokit
  class Client
    module PullRequests
      alias PullRequest = Models::PullRequest
      alias Repository = Models::Repository

      #   alias Organization = Models::Organization
      #   alias User = Models::User

      # GET /repos/{owner}/{repo}/pulls
      def pull_requests
        response = paginate "pull_requests"
        PullRequest.from_json(response)
      end

      # @url="https://api.github.com/repos/Ashlie-G/crystal-todo/issues/1"
      def pull_request(repo, pull_number : Int32)
        res = get "#{Repository.path(repo)}/pulls/#{pull_number}"
        PullRequest.from_json(res)
      end

      # def pull_request(pull_request)
      # response = get PullRequest.path(pull_request)
      # PullRequest.from_json(response)
      # end

      # def pull_requests(repo = nil)
      #     path = repo ? "#{Repository.path(repo)}/pulls" : "pulls"
      #     paginate PullRequest, path
      # end
    end
  end
end
