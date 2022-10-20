# frozen_string_literal: true
ActiveAdmin.register_page "Guide" do
  menu priority: 0, label: "Guide"

  content title: "Guide" do
    panel "INSTRUCTIONS" do
      h2 "!!! service_path for route CAN'T START WITH /admin"
      h2 "!!! Request Setting with key: \"url\" (case sensitive) MUST BE PRESENT"
      h2 "!!! Variables for interpolation for request setting value MUST BE WRAPPED IN {} (ex. https://{host})"
      h2 "!!! Params for routes service_path field MUST START WITH \":\" (ex. seasons/:seasonId/close)"
      h2 "Headers for remote request can be customized editing (or creating) request setting with key - request_header (value - JSON)"
      h2 "Additional request params for remote request can be customized editing (or creating) request setting with key - additional_request_params (value - JSON)"
      h2 "???"
      h2 "Profit"
      h1 "HAVE A GOOD DAY !!!"
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
