module Octokit
  module Models
    struct Tag
      rest_model(
        tag: String,
        sha: String,
        url: String,
        message: String,
        tagger: CommitAuthor,
        object: GitObject,
        verification: SignatureVerification,
        node_id: String
      )
    end

    struct CreateTagRequest
      rest_model(
        tag: String,
        message: String,
        object: String,
        type: String,
        tagger: CommitAuthor
      )
    end
  end
end
