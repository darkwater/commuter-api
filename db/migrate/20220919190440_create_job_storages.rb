class CreateJobStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :job_storages do |t|
      t.timestamps
    end
  end
end
