# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_19_190440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "job_storages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kv1_destinations", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "dest_code", limit: 10, null: false
    t.string "dest_name_full", limit: 50, null: false
    t.string "dest_name_main", limit: 24, null: false
    t.string "dest_name_detail", limit: 24
    t.boolean "relevant_dest_name_detail", null: false
    t.string "dest_name_main_21", limit: 21, null: false
    t.string "dest_name_detail_21", limit: 21
    t.string "dest_name_main_19", limit: 19, null: false
    t.string "dest_name_detail_19", limit: 19
    t.string "dest_name_main_16", limit: 16, null: false
    t.string "dest_name_detail_16", limit: 16
    t.integer "dest_icon"
    t.string "dest_color", limit: 6
    t.string "dest_text_color", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "dest_code"], name: "index_kv1_destinations", unique: true
  end

  create_table "kv1_exceptional_operating_days", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "org_unit_code", limit: 10, null: false
    t.date "valid_date", null: false
    t.string "day_type_as_on", limit: 7, null: false
    t.string "specific_day_code", limit: 10, null: false
    t.string "period_group_code", limit: 10
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "org_unit_code", "valid_date"], name: "index_kv1_exceptional_operating_days", unique: true
  end

  create_table "kv1_higher_org_units", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "org_unit_code_parent", limit: 10, null: false
    t.string "org_unit_code_child", limit: 10, null: false
    t.date "valid_from", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "org_unit_code_parent", "org_unit_code_child", "valid_from"], name: "index_kv1_higher_org_units", unique: true
  end

  create_table "kv1_journey_pattern_timing_links", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "journey_pattern_code", limit: 10, null: false
    t.integer "timing_link_order", null: false
    t.string "user_stop_code_begin", limit: 10, null: false
    t.string "user_stop_code_end", limit: 10, null: false
    t.string "confinrel_code", limit: 10, null: false
    t.string "dest_code", limit: 10, null: false
    t.boolean "is_timing_stop", null: false
    t.string "display_public_line", limit: 4
    t.integer "product_formula_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "line_planning_number", "journey_pattern_code", "timing_link_order"], name: "index_kv1_journey_pattern_timing_links", unique: true
    t.index ["data_owner_code", "line_planning_number", "journey_pattern_code", "user_stop_code_begin", "user_stop_code_end"], name: "index_kv1_journey_pattern_timing_links_user_stop_codes", unique: true
  end

  create_table "kv1_journey_patterns", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "journey_pattern_code", limit: 10, null: false
    t.string "journey_pattern_type", limit: 10, null: false
    t.string "direction", limit: 10, null: false
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "line_planning_number", "journey_pattern_code"], name: "index_kv1_journey_patterns", unique: true
  end

  create_table "kv1_lines", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "line_public_number", limit: 4, null: false
    t.string "line_name", limit: 50, null: false
    t.integer "line_ve_tag_number", null: false
    t.string "description", limit: 255
    t.string "transport_type", limit: 5, null: false
    t.integer "line_icon"
    t.string "line_color", limit: 6
    t.string "line_text_color", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "line_planning_number"], name: "index_kv1_lines", unique: true
  end

  create_table "kv1_links", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "user_stop_code_begin", limit: 10, null: false
    t.string "user_stop_code_end", limit: 10, null: false
    t.date "valid_from", null: false
    t.integer "distance", null: false
    t.string "description", limit: 255
    t.string "transport_type", limit: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "user_stop_code_begin", "user_stop_code_end", "valid_from", "transport_type"], name: "index_kv1_links", unique: true
  end

  create_table "kv1_notice_assignments", force: :cascade do |t|
    t.string "object", limit: 10, null: false
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "notice_code", limit: 20, null: false
    t.string "timetable_version_code", limit: 10
    t.string "org_unit_code", limit: 10
    t.string "schedule_code", limit: 10
    t.string "schedule_type_code", limit: 10
    t.string "period_group_code", limit: 10
    t.string "specific_day_code", limit: 10
    t.string "day_type", limit: 10
    t.integer "journey_number"
    t.integer "stop_order"
    t.string "journey_pattern_code", limit: 10
    t.string "timing_link_code", limit: 10
    t.string "user_stop_code", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object", "data_owner_code", "line_planning_number", "notice_code"], name: "index_kv1_notice_assignments"
  end

  create_table "kv1_notices", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "notice_code", limit: 20, null: false
    t.string "notice", limit: 1024, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "notice_code"], name: "index_kv1_notices", unique: true
  end

  create_table "kv1_org_units", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "org_unit_code", limit: 10, null: false
    t.string "name", limit: 50, null: false
    t.string "org_unit_type", limit: 10, null: false
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "org_unit_code"], name: "index_kv1_org_units", unique: true
  end

  create_table "kv1_period_group", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "period_group_code", limit: 10, null: false
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "period_group_code"], name: "index_kv1_period_group", unique: true
  end

  create_table "kv1_period_group_validities", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "org_unit_code", limit: 10, null: false
    t.string "period_group_code", limit: 10, null: false
    t.date "valid_from", null: false
    t.date "valid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "org_unit_code", "period_group_code", "valid_from"], name: "index_kv1_period_group_validity", unique: true
  end

  create_table "kv1_point_on_links", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "user_stop_code_begin", limit: 10, null: false
    t.string "user_stop_code_end", limit: 10, null: false
    t.date "link_valid_from", null: false
    t.string "point_data_owner_code", limit: 10, null: false
    t.string "point_code", limit: 10, null: false
    t.integer "distance", null: false
    t.integer "segment_speed"
    t.integer "local_point_speed"
    t.string "description", limit: 255
    t.string "transport_type", limit: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "user_stop_code_begin", "user_stop_code_end", "link_valid_from", "transport_type", "point_data_owner_code", "point_code"], name: "index_kv1_point_on_links", unique: true
  end

  create_table "kv1_points", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "point_code", limit: 10, null: false
    t.date "valid_from", null: false
    t.string "point_type", limit: 10, null: false
    t.integer "rd_x", null: false
    t.integer "rd_y", null: false
    t.integer "location_z"
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "point_code"], name: "index_kv1_points", unique: true
  end

  create_table "kv1_public_journeys", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "timetable_version_code", limit: 10, null: false
    t.string "org_unit_code", limit: 10, null: false
    t.string "period_group_code", limit: 10, null: false
    t.string "specific_day_code", limit: 10, null: false
    t.string "day_type", limit: 7, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.integer "journey_number", null: false
    t.string "time_demand_group_code", limit: 10, null: false
    t.string "journey_pattern_code", limit: 10, null: false
    t.string "departure_time", limit: 8, null: false
    t.string "wheelchair_accessible", limit: 13, null: false
    t.boolean "data_owner_is_operator", null: false
    t.boolean "planned_monitored", null: false
    t.integer "product_formula_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "timetable_version_code", "org_unit_code", "period_group_code", "specific_day_code", "day_type", "line_planning_number", "journey_number"], name: "index_kv1_public_journey", unique: true
  end

  create_table "kv1_specific_days", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "specific_day_code", limit: 10, null: false
    t.string "name", limit: 50, null: false
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "specific_day_code"], name: "index_kv1_specific_days", unique: true
  end

  create_table "kv1_time_demand_group_run_times", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "journey_pattern_code", limit: 10, null: false
    t.string "time_demand_group_code", limit: 10, null: false
    t.integer "timing_link_order", null: false
    t.string "user_stop_code_begin", limit: 10, null: false
    t.string "user_stop_code_end", limit: 10, null: false
    t.integer "total_drive_time", null: false
    t.integer "drive_time", null: false
    t.integer "expected_delay"
    t.integer "lay_over_time"
    t.integer "stop_wait_time", null: false
    t.integer "minimum_stop_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "line_planning_number", "journey_pattern_code", "time_demand_group_code", "timing_link_order"], name: "index_kv1_time_demand_group_run_times", unique: true
  end

  create_table "kv1_time_demand_groups", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "line_planning_number", limit: 10, null: false
    t.string "journey_pattern_code", limit: 10, null: false
    t.string "time_demand_group_code", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "line_planning_number", "journey_pattern_code", "time_demand_group_code"], name: "index_kv1_time_demand_groups", unique: true
  end

  create_table "kv1_timetable_versions", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "org_unit_code", limit: 10, null: false
    t.string "timetable_version_code", limit: 10, null: false
    t.string "period_group_code", limit: 10, null: false
    t.string "specific_day_code", limit: 10, null: false
    t.date "valid_from", null: false
    t.string "timetable_version_type", limit: 10, null: false
    t.date "valid_until"
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "org_unit_code", "timetable_version_code", "period_group_code", "specific_day_code"], name: "index_kv1_timetable_versions", unique: true
  end

  create_table "kv1_timing_links", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "user_stop_code_begin", limit: 10, null: false
    t.string "user_stop_code_end", limit: 10, null: false
    t.integer "minimal_drive_time"
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "user_stop_code_begin", "user_stop_code_end"], name: "index_kv1_timing_links", unique: true
  end

  create_table "kv1_user_stop_areas", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "user_stop_area_code", limit: 10, null: false
    t.string "name", limit: 50, null: false
    t.string "town", limit: 50, null: false
    t.string "road_side_eq_data_owner_code", limit: 10
    t.integer "road_side_eq_unit_number"
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "user_stop_area_code"], name: "index_kv1_user_stop_areas", unique: true
  end

  create_table "kv1_user_stop_points", force: :cascade do |t|
    t.string "data_owner_code", limit: 10, null: false
    t.string "user_stop_code", limit: 10, null: false
    t.string "timing_point_code", limit: 10
    t.boolean "get_in", null: false
    t.boolean "get_out", null: false
    t.string "name", limit: 50, null: false
    t.string "town", limit: 50, null: false
    t.string "user_stop_area_code", limit: 10
    t.string "stop_side_code", limit: 10
    t.string "road_side_eq_data_owner_code", limit: 10
    t.integer "road_side_eq_unit_number"
    t.integer "minimal_stop_time", null: false
    t.integer "stop_side_length"
    t.string "description", limit: 255
    t.string "user_stop_type", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_owner_code", "user_stop_code"], name: "index_kv1_user_stop_points", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
