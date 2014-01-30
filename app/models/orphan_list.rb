require 'roo'

class OrphanList
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoInc

  before_create :set_new_status

  field :status
  auto_increment :osra_id

  mount_uploader :uploaded_list, OrphanListUploader

  embedded_in :partner, :inverse_of => :orphan_lists

  def to_param
    osra_id.to_s
  end

  def set_new_status
    self.status = Settings.orphan_list_statuses[0]
  end

  def self.add_validation_error(reference, error)
    @validation_errors.push ({:ref => reference, :error => error})
  end

  def self.get_doc(file)
    begin
      file.original_filename =~ /[.](.+)\z/
      case $1
        when 'xls'
          list = Roo::Spreadsheet.open(file.path, extension: :xls)
        when 'xlsx'
          list = Roo::Spreadsheet.open(file.path, extension: :xlsx)
        else
          add_validation_error('Uploaded file extension', 'Invalid file extension. Please upload only .xls or .xlsx files.')
          return false
      end
    rescue
      add_validation_error('Uploaded file', 'Invalid file format. Please ensure the file is a proper Excel file.')
      return false
    end
    list
  end

  def self.validate(file)
    @imported_orphans = []
    @validation_errors = []
    results = {:orphans => @imported_orphans, :errors => @validation_errors}

    list = get_doc(file)
    if !list
      return results
    end
    get_orphans(list)
  end

  def self.get_orphans(list)
    @imported_orphans = []
    @validation_errors = []
    columns = Settings.orphan_list.import.column_order.reduce ({}) do |h, e|
      h.merge e
    end
    Settings.orphan_list.import.first_row.upto(list.last_row) do |record|
      o = Orphan.new
      columns.each_pair { |k, v|
        puts "#{k}:"
        puts Orphan.fields[k.to_s].type.name
        case Orphan.fields["#{k}"].type.name
          when Integer
            puts 'found an Integer => ' + list.cell(record, v).to_i
          when 'Date'
            puts 'found a date'
          when 'Boolean'
            puts 'found a Boolean =>' + list.cell(record, v)
          when 'String'
            puts 'found a String =>' + list.cell(record, v)
          else
            puts 'I''m confused now!!!'
        end
        #   o.send("#{k}=", list.cell(record, v))
      }
      #  o = Orphan.new(:name => list.cell(record, Settings.orphan_list.import.name_col))
      @imported_orphans.push (o)
    end
    {:orphans => @imported_orphans, :errors => @validation_errors}
  end
end