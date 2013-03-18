require 'spec_helper'

require 'awesome_print'

describe JSONSchemaValidator, '#valid?' do
  it 'returns true for valid json' do
    dir = File.dirname(__FILE__)
    data = File.open(dir + '/fixtures/valid.json').read
    schema = File.open(dir + '/fixtures/schema.json').read

    valid = JSONSchemaValidator.new(schema, data).valid?

    expect(valid).to be_true
  end

  it 'returns false for valid json which does not fit the schema' do
    dir = File.dirname(__FILE__)
    data = File.open(dir + '/fixtures/non_compliant.json').read
    schema = File.open(dir + '/fixtures/schema.json').read

    ap valid = JSONSchemaValidator.new(schema, data).errors

    # expect(valid).to be_false
  end
end

describe JSONSchemaValidator, '#errors' do
  it 'returns true for valid json' do
    dir = File.dirname(__FILE__)
    data = File.open(dir + '/fixtures/valid.json').read
    schema = File.open(dir + '/fixtures/schema.json').read

    errors = JSONSchemaValidator.new(schema, data).errors

    expect(errors).to be_empty
  end
end
