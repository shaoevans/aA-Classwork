require "rspec"
require "hanoi.rb"


describe Disk do
  subject(:disk) {Disk.new(3)}

  it 'should take in a value and return that value' do
    expect(disk.val).to eq(3)
  end

  it 'should return nil if no value was passed in' do
    new_disk = Disk.new
    expect(new_disk.val).to be nil
  end

end


