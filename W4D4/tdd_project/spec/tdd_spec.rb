require "rspec"
require "tdd"

describe Array do

  describe '#my_uniq' do
    it 'does not raise error' do
      expect {[1,2,3].my_uniq}.not_to raise_error
    end

    it 'returns array without duplicates' do
      expect([1,2,3,1,2,3].my_uniq).to eq([1,2,3])
    end

    it 'returns empty array when empty array is passed in' do
      expect([].my_uniq).to eq([])
    end

    it 'returns elements in orignal order' do
      expect([1,2,3,3,2,1].my_uniq).to eq([1,2,3])
    end

    it 'should work on a large array' do
      expect([1,2,3,1,2,3,1,2,3,1,2,3].my_uniq).to eq([1,2,3])
    end

  end

  describe '#two_sum' do
    it 'does not raise error' do
      expect{[1,2,3].two_sum}.not_to raise_error
    end

    it 'works on empty array' do
      expect([].two_sum).to eq([])
    end

    it 'returns indices where sums are zero' do
      expect([-1,1].two_sum).to eq([[0,1]])
    end

    it 'returns indices that sum to zero in sorted order' do
      expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end

    it 'does not double count indices that sum to zero' do
      expect([-1,0,2,-2,1].two_sum).to_not include([0,0])
      expect([-1,0,2,-2,1].two_sum).to_not include([4,0])
    end
  end
end

describe '#my_transpose' do

  it 'raises error if argument is not an array' do
    expect{my_transpose("")}.to raise_error(ArgumentError)
  end

  it 'accepts an empty array' do
    expect(my_transpose([])).to eq([])
  end

  it 'works for an array of one element' do
    expect(my_transpose([[1],[2]])).to eq([[1,2]])
  end

  it 'works for an array of multiple elements' do
    array = [
      [0,1,2],
      [3,4,5],
      [6,7,8]
    ]
    answer = [
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]
    expect(my_transpose(array)).to eq(answer)
  end

  it 'raises an indexerror if array elements vary in length' do
    expect{my_transpose([[1],[2,3]])}.to raise_error(IndexError)
  end

end

describe '#stock_picker' do

  it 'raises argument error if input is not array' do
    expect {stock_picker("")}.to raise_error(ArgumentError)
  end

  it 'returns days with max diff' do
    expect(stock_picker([1,4,5,4,9])).to eq([0,4])
  end

  it 'does not allow sell date to be smaller than buy date' do
    expect(stock_picker([10,1,4,8])).to eq([1,3])
  end

  it 'should return nil if no days are profitable' do
    expect(stock_picker([5,4,3,2])).to be nil
  end

  it 'should return first day pair if multiple days have same max diff' do
      arr = [1,10,1,10]
      expect(stock_picker(arr)).to eq([0,1])
  end

  # 1. make sure argument is an array
  # 2. returns days on which price diff is greatest (indices)
  # 3. sell date must be greater than purchase date
  # 4. should return nil if no days profitable
  # 5. return first day pair if multiple days have same max diff


end
