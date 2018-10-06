class PaginationService

  def self.build_meta(result, total, per_page, request)
    @per_page = per_page
    @request = request
    @meta = {
      pagination: {
        per_page: result.limit_value,
        total_pages: result.total_pages,
        total_objects: total.count
      },
      links: {
        self:  build_page(result.current_page),
        first: build_page(1),
        prev:  build_page(result.prev_page),
        next:  build_page(result.next_page),
        last:  build_page(result.total_pages)
      },

    }
  end

  def self.build_page(result)
    clean_url = @request.original_url.sub(/\?.*$/, '')
    parameters_page = @request.query_parameters.merge(page: result, per_page: @per_page).to_param
    url = clean_url + '?' + parameters_page
  end

end
