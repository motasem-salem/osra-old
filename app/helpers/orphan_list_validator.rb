class OrphanListValidator

  @@config = Settings.orphan_list.import

  attr_reader :extracted_orphans, :validation_errors
  attr_writer :file, :doc

  def initialize
    @extracted_orphans = []
    @validation_errors = []
    @file = nil
    @doc = nil
  end

  def add_validation_error(reference, error)
    @validation_errors.push ({:ref => reference, :error => error})
  end

  def get_doc
    begin
      @file.original_filename =~ /[.](.+)\z/
      case $1
        when 'xls'
          @doc = Roo::Spreadsheet.open(@file.path, extension: :xls)
        when 'xlsx'
          @doc = Roo::Spreadsheet.open(@file.path, extension: :xlsx)
        else
          add_validation_error('Uploaded file extension', 'Invalid file extension. Please upload only .xls or .xlsx files.')
      end
    rescue
      add_validation_error('Uploaded file', 'Invalid file format. Please ensure the file is a proper Excel file.')
    end
  end

  def valid?
    get_doc if @doc.nil?
    get_orphans unless @doc.nil?
    @validation_errors.empty?
  end

  def get_orphans
    @@config.first_row.upto(@doc.last_row) do |record|
      rec_valid = true
      fields = {}
      @@config.columns.each do |col|
        val = @doc.cell(record, col.column)
        if val.nil?
          if col.mandatory
            rec_valid = false
            add_validation_error("(#{record},#{col.column})", "Missing mandatory field: #{col.field}")
          end
        else
          begin
            case col.type
              when 'String'
                fields[col.field] = @doc.cell(record, col.column)
              when 'Boolean'
                fields[col.field] = @doc.cell(record, col.column) == 'Y'
              when 'Date'
              #  fields[col.field] = @doc.cell(record, col.column)
              else
                add_validation_error('Import configuration', "Invalid data type: #{col.type} defined for field: #{col.field}. Please check import settings.")
            end
          rescue
            rec_valid = false
            add_validation_error("(#{record},#{col.column})", "Error reading #{col.type} value for field: #{col.field}")
          end
        end
      end
      @extracted_orphans.push(Orphan.new(fields)) unless !rec_valid
    end
  end
end