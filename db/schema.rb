# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160529200043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowed_statuses", force: :cascade do |t|
    t.integer  "workflow_id"
    t.integer  "status_id"
    t.text     "next_statuses"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "next_status_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auto_log_entries", force: :cascade do |t|
    t.integer  "who_id"
    t.integer  "status_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "package_id"
    t.integer  "weekly_workload_id"
  end

  create_table "auto_sum_details", force: :cascade do |t|
    t.integer  "weekly_workload_id"
    t.integer  "status_id"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brew_nvrs", force: :cascade do |t|
    t.integer  "package_id"
    t.string   "nvr",        limit: 255
    t.string   "distro",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link",       limit: 255
  end

  create_table "bz_bugs", force: :cascade do |t|
    t.string   "bz_id",          limit: 255
    t.integer  "package_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "summary",        limit: 255
    t.string   "bz_status",      limit: 255
    t.datetime "last_synced_at"
    t.string   "bz_action",      limit: 255
    t.string   "bz_assignee",    limit: 255
    t.string   "component",      limit: 255
    t.string   "keywords",       limit: 255
    t.string   "is_in_errata",   limit: 255
    t.string   "os_arch",        limit: 255
  end

  create_table "changelogs", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "changed_by"
    t.string   "category",   limit: 255
    t.string   "references", limit: 255
    t.text     "from_value"
    t.text     "to_value"
    t.datetime "changed_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50,  default: ""
    t.text     "comment",                      default: ""
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",           limit: 255
    t.index ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
    t.index ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "component_views", force: :cascade do |t|
    t.integer "component_id"
    t.integer "task_id"
  end

  create_table "components", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_packages", force: :cascade do |t|
    t.integer "component_id"
    t.integer "package_id"
  end

  create_table "cronjob_mode_os_advisory_tags", force: :cascade do |t|
    t.integer  "cronjob_mode_id"
    t.integer  "os_advisory_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cronjob_modes", force: :cascade do |t|
    t.string   "mode",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jira_bugs", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "creator_id"
    t.string   "summary",        limit: 255
    t.string   "status",         limit: 255
    t.string   "assignee",       limit: 255
    t.datetime "last_synced_at"
    t.string   "jira_bug",       limit: 255
  end

  create_table "manual_log_entries", force: :cascade do |t|
    t.integer  "who_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_id"
    t.integer  "weekly_workload_id"
  end

  create_table "os_advisory_tags", force: :cascade do |t|
    t.string   "os_arch",             limit: 255
    t.string   "advisory",            limit: 255
    t.string   "candidate_tag",       limit: 255
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "priority",            limit: 255
    t.string   "target_tag",          limit: 255
    t.string   "build_tag",           limit: 255
    t.string   "errata_prod_release", limit: 255
  end

  create_table "p_attachments", force: :cascade do |t|
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_id"
    t.integer  "created_by"
  end

  create_table "package_relationships", force: :cascade do |t|
    t.integer  "from_package_id"
    t.integer  "to_package_id"
    t.integer  "relationship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_stats", force: :cascade do |t|
    t.integer  "weekly_workload_id"
    t.integer  "package_id"
    t.integer  "user_id"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "build",                     limit: 255
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "status_id"
    t.integer  "created_by"
    t.string   "version",                   limit: 255
    t.string   "ver",                       limit: 255
    t.string   "brew_link",                 limit: 255
    t.string   "group_id",                  limit: 255
    t.string   "artifact_id",               limit: 255
    t.string   "project_url",               limit: 255
    t.string   "project_name",              limit: 255
    t.string   "license",                   limit: 255
    t.string   "internal_scm",              limit: 255
    t.integer  "updated_by"
    t.datetime "status_changed_at"
    t.string   "external_scm",              limit: 255
    t.string   "mead",                      limit: 255
    t.string   "brew",                      limit: 255
    t.integer  "time_consumed"
    t.integer  "time_point"
    t.string   "sourceURL",                 limit: 255
    t.string   "RPM",                       limit: 255
    t.string   "MEAD",                      limit: 255
    t.string   "git_url",                   limit: 255
    t.string   "mead_action",               limit: 255
    t.string   "in_errata",                 limit: 255
    t.string   "rpmdiff_status",            limit: 255
    t.string   "rpmdiff_id",                limit: 255
    t.string   "latest_brew_nvr",           limit: 255
    t.string   "brew_scm_url",              limit: 255
    t.string   "milestone",                 limit: 255
    t.string   "mead_link",                 limit: 255
    t.string   "errata",                    limit: 255
    t.binary   "maven_build_arguments"
    t.binary   "spec_file"
    t.binary   "ini_file"
    t.string   "github_pr",                 limit: 255
    t.boolean  "github_pr_closed"
    t.string   "previous_version",          limit: 255
    t.string   "sha_ini_file",              limit: 255
    t.string   "sha_spec_file",             limit: 255
    t.string   "sha_maven_build_arguments", limit: 255
  end

  create_table "readonly_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "from_name",  limit: 255
    t.string   "is_global",  limit: 255
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "to_name",    limit: 255
    t.string   "name",       limit: 255
  end

  create_table "rpm_diffs", force: :cascade do |t|
    t.string   "in_errata",      limit: 255
    t.string   "rpmdiff_status", limit: 255
    t.string   "rpmdiff_id",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nvr_in_errata",  limit: 255
    t.integer  "package_id"
    t.string   "distro",         limit: 255
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.text     "recipients"
    t.integer  "props"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "actions"
    t.text     "xattrs"
    t.string   "show_xattrs",          limit: 255
    t.string   "enabled",              limit: 255
    t.string   "enable_xattrs",        limit: 255
    t.string   "default_tag",          limit: 255
    t.integer  "close_status_id"
    t.string   "use_bz_integration",   limit: 255
    t.string   "use_mead_integration", limit: 255
    t.string   "use_jira_integration", limit: 255
  end

  create_table "start_status_workflows", force: :cascade do |t|
    t.integer  "workflow_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_stats", force: :cascade do |t|
    t.integer  "package_stat_id"
    t.integer  "status_id"
    t.integer  "user_id"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "global",          limit: 255
    t.string   "can_select",      limit: 255
    t.string   "can_show",        limit: 255
    t.string   "code",            limit: 255
    t.text     "style"
    t.string   "is_track_time",   limit: 255
    t.string   "is_finish_state", limit: 255
    t.string   "can_change_code", limit: 255
  end

  create_table "tags", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
  end

  create_table "task_group_to_tasks", force: :cascade do |t|
    t.integer  "task_group_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_workload_per_package_summaries", force: :cascade do |t|
    t.integer  "task_workload_summary_id"
    t.integer  "package_id"
    t.text     "workload_per_status_in_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_workload_summaries", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "total_number_of_packages"
    t.text     "workload_per_status_in_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "can_show",                limit: 255
    t.integer  "total_manual_track_time"
    t.string   "candidate_tag",           limit: 255
    t.string   "target_release",          limit: 255
    t.string   "tag_version",             limit: 255
    t.string   "milestone",               limit: 255
    t.string   "advisory",                limit: 255
    t.integer  "workflow_id"
    t.string   "prod",                    limit: 255
    t.string   "active",                  limit: 255
    t.string   "repository",              limit: 255
    t.string   "frozen_state",            limit: 255
    t.boolean  "allow_non_existent_pkgs"
    t.boolean  "allow_non_shipped_pkgs"
    t.string   "previous_version_tag",    limit: 255
    t.string   "build_branch",            limit: 255
  end

  create_table "time_zones", force: :cascade do |t|
    t.float  "tz_offset"
    t.string "text",      limit: 255
  end

  create_table "track_times", force: :cascade do |t|
    t.integer "status_id"
    t.integer "package_id"
    t.integer "time_consumed"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "email",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "can_manage",     limit: 255
    t.integer  "tz_id"
    t.string   "password",       limit: 255
    t.string   "bugzilla_email", limit: 255
    t.string   "reset_code",     limit: 255
  end

  create_table "weekly_workloads", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "start_of_week"
    t.datetime "end_of_week"
    t.integer  "package_count"
    t.integer  "manual_sum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_status_id"
  end

  create_table "worktime_stats", force: :cascade do |t|
    t.integer  "package_stat_id"
    t.integer  "user_id"
    t.integer  "minutes"
    t.text     "time_span"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
