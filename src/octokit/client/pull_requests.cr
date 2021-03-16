module Octokit
    class Client
        
        module PullRequests

            alias PullRequest = Models::PullRequest
            
            # def pull_requests
            #     response = paginate "pull_requests"
            #     PullRequest.from_json(response)
            # end
            def repository(path)
                response = get PullRequest.path(path)
                PullRequest.from_json(response)
            end
            
        end
    end
end