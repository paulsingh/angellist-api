module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/jobs
    module Jobs

      # Returns all jobs that have been posted. Results are paginated and
      # ordered by publish date descending.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page Specifies the page of results to
      #   retrieve.
      # @option options [Integer] :per_page (50) The number of results to return
      #   for a page. Maximum of 50.
      #
      # @note Pagination metadata does not actually appear to be returned
      #   currently, but the page parameter works. Have inquired with AngelList
      #   about this.
      def get_jobs(options={})
        get("1/jobs", options)
      end

      # Shows details for a specific job, including the startup that posted it.
      #
      # @requires_authentication No
      #
      # @param id [Integer] ID of the job to fetch.
      #
      # @example Get information for a job.
      #   AngellistApi.get_job(137)
      def get_job(id)
        get("1/jobs/#{id}")
      end

      # For a given startup id, returns all the jobs that have been posted.
      #
      # @requires_authentication No
      # @paginated No
      #
      # @param id [Integer] ID of the desired startup.
      #
      # @example Get jobs for a given startup by ID.
      #   AngellistApi.get_startup_jobs(1234)
      def get_startup_jobs(id)
        get("1/startups/#{id}/jobs")
      end

      # For a given LocationTag id, returns all jobs posted in that tag.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param id [Integer] ID of the desired tag.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page Specifies the page of results to
      #   retrieve.
      # @option options [Integer] :per_page (50) The number of results to return
      #   for a page. Maximum of 50.
      #
      # @example Get jobs tagged San Francisco.
      #   AngellistApi.get_tag_jobs(1692)
      def get_tag_jobs(id, options={})
        get("1/tags/#{id}/jobs", options)
      end
    end
  end
end

