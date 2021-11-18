module Octokit
  # Allows warnings to be suppressed via environment variable.
  module Warnable
    # Wrapper around Log.warn to print warnings unless
    # OCTOKIT_SILENT is set to true.
    # NOTE: This is redundant after the introduction of `Log`
    def octokit_warn(message)
      unless ENV["OCTOKIT_SILENT"]?.presence
        Log.warn { message }
      end
    end
  end
end
