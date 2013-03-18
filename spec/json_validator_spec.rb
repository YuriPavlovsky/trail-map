require 'spec_helper'

describe JSONValidator, '#run' do
  it 'returns true and outputs a dot if the JSON is valid' do
    $stdout = io = StringIO.new
    dir = File.dirname(__FILE__)
    file_name = File.open(dir + '/fixtures/valid.json')

    result = JSONValidator.new(file_name).run

    result.should be_true
    io.string.should eq '.'
  end


  it 'returns false and outputs an error if the JSON is not valid' do
    $stdout = io = StringIO.new
    dir = File.dirname(__FILE__)
    file_name = File.open(dir + '/fixtures/invalid.json')

    result = JSONValidator.new(file_name).run

    result.should be_false
    io.string.should =~ /ERROR/
  end
end

describe JSONValidator, '#schema' do
  it 'checks the JSON against the schema' do
    validator = stub('validator', :validate)
    JSONSchemaValidator.stubs(:new).returns(validator)

    dir = File.dirname(__FILE__)
    file_name = File.open(dir + '/fixtures/invalid.json')
    result = JSONValidator.new(file_name).run

    expect(JSONSchemaValidator).to have_received(:new)
    expect(validator).to have_received(:validate)
  end
end
