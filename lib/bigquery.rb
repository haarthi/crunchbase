#!/usr/bin/env ruby

require "google/cloud/bigquery"


class BigQuery
    # @bigquery

    # constructor
    def initialize
      @bigquery = Google::Cloud::Bigquery.new(
        project: "lookerdata",
        keyfile: "../publickey.json"
        )
    end


    def create_table 
      dataset = @bigquery.dataset "finance"

      table = dataset.create_table "user_data" do |schema|
        schema.string "uuid", mode: :required
        schema.string "first_name", mode: :nullable
        schema.string "last_name", mode: :nullable
        schema.string "gender", mode: :nullable
        schema.string "title", mode: :nullable
        schema.string "permalink", mode: :nullable
        schema.string "organization_permalink", mode: :nullable
        schema.string "organization_name", mode: :nullable
        # schema.string "properties", mode: :nullable
        # schema.record "cities_lived", mode: :repeated do |nested_schema|
        #   nested_schema.string "place", mode: :required
        #   nested_schema.integer "number_of_years", mode: :required
        # end
      end
    end


    def update_table
      return getTrends()
    end

    def get_query(sql)
      job = @bigquery.query_job sql

      job.wait_until_done!

      if job.failed?
        puts job.error
      else
        puts job.query_results.first
      end

    end


      # def put_query_results_for_person
      #   my_field = [{"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}},{"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}}]

      #   puts "Running query"
      #   query_job = bigquery.query_job query_string

      #   puts "Waiting for query to complete"
      #   query_job.wait_until_done!

      #   puts "Query results:"
      #   query_job.query_results.each do |row|
      #     puts row.inspect
      #   end
      # end

      def post_query
        dataset = @bigquery.dataset "finance"
        my_field = 
        # {
        #   "metadata": {
        #     "version": 3,
        #     "www_path_prefix": "https://www.crunchbase.com",
        #     "api_path_prefix": "https://api.crunchbase.com",
        #     "image_path_prefix": "http://public.crunchbase.com/t_api_images/"
        #     },
        #     "data": {
        #       "paging": {
        #         "total_items": 634740,
        #         "number_of_pages": 6348,
        #         "current_page": 1,
        #         "sort_order": "created_at DESC",
        #         "items_per_page": 100,
        #         "next_page_url": "https://api.crunchbase.com/v/3/people?page=2",
        #         },
        #         "items": 
        [
          {"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}},{"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}}]
                  # }}


                  table    = dataset.table "user_data"



      row = my_field.each do |row|
            # row.each      do |column_name, value|

            field = {
              "uuid" => row[:uuid].to_s,
              "properties" => "my_props"
            }

            puts row["uuid"]

            # puts "#{column_name} = #{value}"
            response = table.insert field

            if response.success?
              puts "Inserted rows successfully"
            else
              puts "Failed to insert #{response.error_rows.count} rows"
              puts response.inspect
            end

          end
        # end
      end




      def create_table_from_query
                dataset = @bigquery.dataset "finance"

                # dataset.table "test_table"
                table = dataset.table "test_table"


        # table = dataset.create_table "test_table" 
        # do |schema|
        #   schema.string "first_name", mode: :required
        #   schema.record "cities_lived", mode: :repeated do |nested_schema|
        #     nested_schema.string "place", mode: :required
        #     nested_schema.integer "number_of_years", mode: :required
        #   end
        # end

        row = {
          "first_name" => "New User",
          "cities_lived" => [
            {
              "place" => "Seattle",
              "number_of_years" => 5
              },
              {
                "place" => "Stockholm",
                "number_of_years" => 6
              }
            ]
          }
table.insert row
end


  # end

  bq = BigQuery.new

  # bq.create_table()
  # bq.create_table_from_query()
  bq.post_query


end



      # bq = BigQuery.new
      # bq.get_query("SELECT COUNT(*) as count FROM " \
      #                    "lookerdata.finance.test_table")






# bq = BigQuery.new
# bq.post_query()

# datasets = bigquery.datasets
# bigquery.datasets.all do |dataset|
#   puts dataset.dataset_id
# end


# dataset = bigquery.dataset "finance"





# table = dataset.create_table "test_table" do |schema|
#   schema.string "first_name", mode: :required
#   schema.record "cities_lived", mode: :repeated do |nested_schema|
#     nested_schema.string "place", mode: :required
#     nested_schema.integer "number_of_years", mode: :required
#   end
# end

# row = {
#   "first_name" => "Alice",
#   "cities_lived" => [
#     {
#       "place" => "Seattle",
#       "number_of_years" => 5
#     },
#     {
#       "place" => "Stockholm",
#       "number_of_years" => 6
#     }
#   ]
# }
# table.insert row






# dataset = bigquery.dataset "medicare_provider_data"
# # table = dataset.table "shakespeare"

# # table.headers #=> [:word, :word_count, :corpus, :corpus_date]
# # table.rows_count #=> 164656

# table = dataset.table "inpatient_charges_2013"

# puts table.headers #=> [:word, :word_count, :corpus, :corpus_date]
# puts table.rows_count #=> 164656

# dataset = bigquery.dataset "samples"
# table = dataset.table "shakespeare"


# puts tables.count #=> 7
# puts tables.map &:table_id

# Create a new table to archive todos

# # Load data into the table
# file = File.open "/archive/todos/completed-todos.csv"
# load_job = table.load file

# Run a query for the number of completed todos by owner
# count_sql = "SELECT owner, COUNT(*) AS complete_count FROM todos GROUP BY owner"
# data = bigquery.query count_sql
# data.each do |row|
#   puts row[:name]
# end