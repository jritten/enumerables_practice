require_relative '../enumerables'

RSpec.describe Enumerables do
  let(:integers) { [8, 9, 2, 5, 10, 17, 1, 42, 12] }
  let(:boxes)    { [
                    Enumerables::Box.new(length: 3,
                                         width:  3,
                                         height: 3,
                                         weight: 100,
                                         color:  "red"),
                    Enumerables::Box.new(length: 6,
                                         width:  6,
                                         height: 6,
                                         weight: 200,
                                         color:  "blue"),
                    Enumerables::Box.new(length: 9,
                                         width:  9,
                                         height: 9,
                                         weight: 300,
                                         color:  "green"),
                    Enumerables::Box.new(length: 12,
                                         width:  12,
                                         height: 12,
                                         weight: 400,
                                         color:  "red"),
                  ]}

  describe 'basic enumerables' do
    it 'finds the largest using each' do
      expect(Enumerables.max_using_each(integers)).to eq 42
    end

    it 'finds the largest using max' do
      expect(Enumerables.max_using_max(integers)).to eq 42
    end

    it 'finds the smallest using each' do
      expect(Enumerables.min_using_each(integers)).to eq 1
    end

    it 'finds the smallest using min' do
      expect(Enumerables.min_using_min(integers)).to eq 1
    end

    it 'sorts using sort' do
      expect(Enumerables.sort_using_sort(integers)).to eq [1, 2, 5, 8, 9, 10, 12, 17, 42]
    end
  end

  describe 'more advanced enumerables' do
    it 'adds up all the numbers using each' do
      expect(Enumerables.sum_using_each(integers)).to eq 106
    end

    it 'adds up all the numbers using reduce' do
      expect(Enumerables.sum_using_reduce(integers)).to eq 106
    end

    it 'multiplies all the numbers together using each' do
      expect(Enumerables.product_using_each(integers)).to eq 61689600
    end

    it 'multiplies all the numbers together using reduce' do
      expect(Enumerables.product_using_reduce(integers)).to eq 61689600
    end

    it 'generates an array of symbol versions of integers using each' do
      expect(Enumerables.symbol_versions_using_each(integers)).to eq [:"8", :"9", :"2", :"5", :"10", :"17", :"1", :"42", :"12"]
    end

    it 'generates an array of symbol versions of integers using map' do
      expect(Enumerables.symbol_versions_using_map(integers)).to eq [:"8", :"9", :"2", :"5", :"10", :"17", :"1", :"42", :"12"]
    end

    it 'generates an array of integers that are double the size of the original values using each' do
      expect(Enumerables.multiply_by_two_with_each(integers)).to eq [16, 18, 4, 10, 20, 34, 2, 84, 24]
    end

    it 'generates an array of integers that are double the size of the original values using map' do
      expect(Enumerables.multiply_by_two_with_map(integers)).to eq [16, 18, 4, 10, 20, 34, 2, 84, 24]
    end
  end

  describe 'enumerables with objects' do
    it 'finds the largest box by weight using each' do
      expect(Enumerables.largest_box_by_weight_using_each(boxes)).to eq boxes[3]
    end

    it 'finds the largest box by weight using max_by' do
      expect(Enumerables.largest_box_by_weight_using_max_by(boxes)).to eq boxes[3]
    end

    it 'finds the smallest box by weight using each' do
      expect(Enumerables.smallest_box_by_weight_using_each(boxes)).to eq boxes[0]
    end

    it 'finds the smallest box by weight using min_by' do
      expect(Enumerables.smallest_box_by_weight_using_min_by(boxes)).to eq boxes[0]
    end

    it 'finds the largest box by volume (length x width x height) using each' do
      expect(Enumerables.largest_box_by_volume_using_each(boxes)).to eq boxes[3]
    end

    it 'finds the largest box by volume (length x width x height) using max_by' do
      expect(Enumerables.largest_box_by_volume_using_max_by(boxes)).to eq boxes[3]
    end

    it 'finds all the red colored boxes using each' do
      expect(Enumerables.find_red_boxes_using_each(boxes)).to eq [boxes[0], boxes[3]]
    end

    it 'finds all the red colored boxes using select' do
      expect(Enumerables.find_red_boxes_using_select(boxes)).to eq [boxes[0], boxes[3]]
    end

    it 'adds up all the box weights using each' do
      expect(Enumerables.sum_box_weights_using_each(boxes)).to eq 1000
    end

    it 'adds up all the box weights using reduce' do
      expect(Enumerables.sum_box_weights_using_reduce(boxes)).to eq 1000
    end

    it 'generates an array of all the box colors using each' do
      expect(Enumerables.generate_array_of_box_colors_using_each(boxes)).to eq ["red", "blue", "green", "red"]
    end

    it 'generates an array of all the box colors using map' do
      expect(Enumerables.generate_array_of_box_colors_using_map(boxes)).to eq ["red", "blue", "green", "red"]
    end

    it 'sorts the boxes in descending order based on weight' do
      expect(Enumerables.sort_boxes_in_descending_order_by_weight(boxes)).to eq [boxes[3], boxes[2], boxes[1], boxes[0]]
    end

  end

end
