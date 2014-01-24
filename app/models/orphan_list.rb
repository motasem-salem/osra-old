class OrphanList
  include Mongoid::Document
  include Mongoid::Timestamps
  
  before_create :set_new_status
 
  field :status
  
  mount_uploader :uploaded_list, OrphanListUploader
  
  embedded_in :partner, :inverse_of => :orphan_lists
  
  def set_new_status
    self.status = Settings.orphan_list_statuses[0]
  end
  
  def self.validate(file)
    if file.original_filename[0] == 'n'
      @imported_orphans = [1,2,3]
      @validation_errors = nil
    else
      @imported_orphans = nil
      @validation_errors = [{:ref => '4,3', :error => 'Not right'}, {:ref => '0,0', :error => 'VERY WRONG!!'}]
    end
    {:orphans => @imported_orphans, :errors => @validation_errors}
  end
end
