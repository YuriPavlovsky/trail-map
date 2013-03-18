require 'json-schema'

class JSONSchemaValidator
  attr_reader :data, :schema

  def initialize(data, schema)
    @data = data
    @schema = schema
  end

  def valid?
    JSON::Validator.validate(schema, data)
  end

  def errors
    JSON::Validator.fully_validate(schema, data)
  end
end
